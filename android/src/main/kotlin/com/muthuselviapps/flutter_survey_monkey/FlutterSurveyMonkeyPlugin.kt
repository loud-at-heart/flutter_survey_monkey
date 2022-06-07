package com.muthuselviapps.flutter_survey_monkey

import android.app.Activity
import android.content.Intent
import androidx.annotation.NonNull
import com.surveymonkey.surveymonkeyandroidsdk.SurveyMonkey
import io.flutter.embedding.android.FlutterActivity

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.BinaryMessenger
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
  val surveyMonkey: SurveyMonkey = SurveyMonkey()
  private var activity: Activity? = null
  private lateinit var result: Result
  private val REQUESTCODE = 0
  private var calledMethod: String = ""
  private val openSurvey: String = "openSurvey"
  private val openSurveyWithResult: String = "openSurveyWithResult"


  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_survey_monkey")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    calledMethod = call.method
    if (call.method == openSurvey) {
      this.result = result
      val surveyHash: String=call.argument<String>("surveyHash")!!
      val customVariables: Map<String,Any>? = call.argument<Map<String,Any>>("customVariables")
      openSurvey(surveyHash,customVariables)
    } else if (call.method == openSurveyWithResult) {
      this.result = result
      val surveyHash: String = call.argument<String>("surveyHash")!!
      openSurveyWithResult(surveyHash)
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  private fun openSurvey(surveyHash: String,customVariables: Map<String,Any>?) {
    if(customVariables!=null)
    {
      val jsonObject: JSONObject= JSONObject(customVariables)
      surveyMonkey.startSMFeedbackActivityForResult(activity, 0, surveyHash,jsonObject)
    }
    else
    {
      surveyMonkey.startSMFeedbackActivityForResult(activity, 0, surveyHash)
    }
  }

  private fun openSurveyWithResult(surveyHash: String) {
    surveyMonkey.startSMFeedbackActivityForResult(activity, 0, surveyHash)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.getActivity();
    binding.addActivityResultListener(this);
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
    if (calledMethod == openSurvey) {
      if (resultCode == Activity.RESULT_OK && requestCode == REQUESTCODE) {
        result.success(true)
        return true
      }
      result.success(false)
    } else if (calledMethod == openSurveyWithResult) {
      val hashMap: HashMap<String, Any> = HashMap<String, Any>()
      if (resultCode == Activity.RESULT_OK && requestCode == REQUESTCODE) {
        var respondent: String? = data?.getStringExtra("smRespondent");
        val jsonObject: JSONObject = JSONObject(respondent)
        hashMap.put("surveyResponse", jsonObject.toString())
        hashMap.put("surveyCompleted", true)
        result.success(hashMap)
        return true
      }
      hashMap.put("surveyCompleted",false)
      result.success(hashMap)
      return false
    }
    return false
  }
}