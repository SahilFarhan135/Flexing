package com.flexing.flexing

import android.content.Intent
import com.facebook.react.modules.core.PermissionListener
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import org.jitsi.meet.sdk.JitsiMeetActivityDelegate
import org.jitsi.meet.sdk.JitsiMeetConferenceOptions
import org.jitsi.meet.sdk.JitsiMeetView
import org.jitsi.meet.sdk.JitsiMeetActivityInterface
import android.util.Log

class MainActivity : FlutterActivity() {


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        CommunicationManager.initialize(flutterEngine)
        CommunicationManager.communicationChannel?.setMethodCallHandler { call, result ->
            Log.e("call_method", call.arguments.toString())
            when (call.method) {
                "open_jitsi" -> {
                    val map = call.arguments as? HashMap<String, String>
                    kotlin.io.print(map.toString())
                    val jitsiIntent = Intent(this, JitsiActivity::class.java)
                    jitsiIntent.putExtra(
                        "jitsi_config",
                        "https://meet.jit.si/zoyel398870036"
                    )
                    startActivity(jitsiIntent)
                }

                else -> result.notImplemented()
            }
        }

    }


}
