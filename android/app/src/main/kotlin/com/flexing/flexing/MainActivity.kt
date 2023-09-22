package com.flexing.flexing

import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        flutterEngine
            .platformViewsController
            .registry
            .registerViewFactory("<platform-view-type>",
                NativeViewFactory(flutterEngine.dartExecutor.binaryMessenger))

        showFlutterDialog(flutterEngine)
        // In your Android activity
       // showFlutterDialog(flutterEngine)

    }

    companion object{
        const val CHANNEL = "test_channel"
        var channel: MethodChannel? = null

    }
    private fun showFlutterDialog(flutterEngine: FlutterEngine) {
         channel =
            MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "test_channel");
        channel?.setMethodCallHandler { call, result ->
            if (call.method == "click") {
                //startActivity(Intent(this, TestActivity::class.java))
            } else {
                result.notImplemented()
            }
        }
       // channel?.invokeMethod("showFlutterDialog", null);

    }

}
