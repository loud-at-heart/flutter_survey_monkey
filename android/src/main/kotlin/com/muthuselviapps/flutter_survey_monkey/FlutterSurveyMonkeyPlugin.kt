package com.muthuselviapps.flutter_survey_monkey

import android.app.Activity
import android.content.Intent
import androidx.annotation.NonNull
import com.surveymonkey.surveymonkeyandroidsdk.SurveyMonkey
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry
import org.json.JSONObject

/** FlutterSurveyMonkeyPlugin */
class FlutterSurveyMonkeyPlugin: FlutterPlugin, MethodCallHandler,ActivityAware,PluginRegistry.ActivityResultListener {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel: MethodChannel
  private val surveyMonkey: SurveyMonkey = SurveyMonkey()
  private var activity: Activity? = null
  private lateinit var result: Result
  private var calledMethod: String = ""
  private val getSurveyStatusMethod: String = "getSurveyStatus"
  private val getSurveyResponseMethod: String = "getSurveyResponse"


  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "com.muthuselviapps.flutter_survey_monkey")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    calledMethod = call.method
    when(call.method){
      getSurveyStatusMethod -> {
        this.result = result
        val surveyHash: String=call.argument<String>("surveyHash")!!
        val customVariables: Map<String,Any>? = call.argument<Map<String,Any>>("customVariables")
        openSurvey(surveyHash,customVariables)
      }
      getSurveyResponseMethod->{
        this.result = result
        val surveyHash: String = call.argument<String>("surveyHash")!!
        val customVariables: Map<String,Any>? = call.argument<Map<String,Any>>("customVariables")
        openSurveyWithResult(surveyHash,customVariables)
      }
      else ->{
        result.notImplemented()
      }
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  private fun openSurvey(surveyHash: String,customVariables: Map<String,Any>?) {
    if(customVariables!=null)
    {
      val jsonObject = JSONObject(customVariables)
      surveyMonkey.startSMFeedbackActivityForResult(activity, 0, surveyHash,jsonObject)
    }
    else
    {
      surveyMonkey.startSMFeedbackActivityForResult(activity, 0, surveyHash)
    }
  }

  private fun openSurveyWithResult(surveyHash: String,customVariables: Map<String,Any>?) {
    if(customVariables!=null)
    {
      val jsonObject = JSONObject(customVariables)
      surveyMonkey.startSMFeedbackActivityForResult(activity, 0, surveyHash,jsonObject)
    }
    else
    {
      surveyMonkey.startSMFeedbackActivityForResult(activity, 0, surveyHash)
    }
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity
    binding.addActivityResultListener(this)
  }

  override fun onDetachedFromActivityForConfigChanges() {
    activity = null
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    activity = binding.activity as FlutterActivity
  }

  override fun onDetachedFromActivity() {
    activity = null
  }

  override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
    if (calledMethod == getSurveyStatusMethod) {
      if (resultCode == Activity.RESULT_OK && requestCode == 0) {
        result.success(true)
        return true
      }
      result.success(false)
    } else if (calledMethod == getSurveyResponseMethod) {
      val hashMap = HashMap<String, Any>()
      if (resultCode == Activity.RESULT_OK && requestCode == 0) {
        val respondent: String? = data?.getStringExtra("smRespondent")
        if(respondent!=null)
        {
          val jsonObject = JSONObject(respondent)
          hashMap["surveyResponse"] = jsonObject.toString()
        }
        hashMap["surveyCompleted"] = true
        result.success(hashMap)
        return true
      }
      hashMap["surveyCompleted"]=false
      result.success(hashMap)
      return false
    }
    return false
  }
}