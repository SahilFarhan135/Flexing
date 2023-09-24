package com.flexing.flexing

import android.annotation.SuppressLint
import android.content.Intent
import android.os.Bundle
import android.util.Log
import android.webkit.WebChromeClient
import android.webkit.WebResourceError
import android.webkit.WebResourceRequest
import android.webkit.WebView
import android.webkit.WebViewClient
import android.widget.FrameLayout
import android.widget.ImageButton
import android.widget.Toast
import androidx.core.view.isVisible
import androidx.fragment.app.FragmentActivity
import com.facebook.react.modules.core.PermissionListener
import com.flexing.flexing.CommunicationManager.sendMessageToFlutter
import org.jitsi.meet.sdk.JitsiMeetActivityDelegate
import org.jitsi.meet.sdk.JitsiMeetActivityInterface
import org.jitsi.meet.sdk.JitsiMeetConferenceOptions
import org.jitsi.meet.sdk.JitsiMeetView
import androidx.localbroadcastmanager.content.LocalBroadcastManager

import org.jitsi.meet.sdk.BroadcastIntentHelper


import org.jitsi.meet.sdk.BroadcastEvent
import android.content.BroadcastReceiver
import android.content.Context

import android.content.IntentFilter
import org.jitsi.meet.sdk.JitsiMeet
import timber.log.Timber
import java.net.MalformedURLException
import java.net.URL


class JitsiActivity : FragmentActivity(), JitsiMeetActivityInterface {
    private var view: JitsiMeetView? = null
    private var webViewBottomSheet: WebViewBottomSheet? = null


    private val broadcastReceiver: BroadcastReceiver = object : BroadcastReceiver() {
        override fun onReceive(p0: Context?, p1: Intent?) {
            onBroadcastReceived(p1)
        }
    }


    private fun openWebView(linkUrl: String?) {
        if (webViewBottomSheet != null && webViewBottomSheet?.isVisible == true) {
            webViewBottomSheet?.dismissAndClose()
        }
        webViewBottomSheet = WebViewBottomSheet.newInstance()
        webViewBottomSheet?.show(
            supportFragmentManager, WebViewBottomSheet::class.java.simpleName
        )
        val bundle = Bundle()
        bundle.putString("link", linkUrl)
        webViewBottomSheet?.arguments = bundle
    }

    @Deprecated(
        "Deprecated in Java", ReplaceWith(
            "JitsiMeetActivityDelegate.onBackPressed()",
            "org.jitsi.meet.sdk.JitsiMeetActivityDelegate"
        )
    )
    override fun onBackPressed() {
        JitsiMeetActivityDelegate.onBackPressed()
    }

    @SuppressLint("MissingInflatedId")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_jitsi)
        val meetData = intent.getStringExtra("jitsi_config") ?: "https://meet.jit.si/test123"
        view = findViewById<JitsiMeetView>(R.id.jitsiView)
        val webView = findViewById<WebView>(R.id.web_view)
        val frameView = findViewById<FrameLayout>(R.id.frame_layout)

        val serverURL: URL = try {
            // When using JaaS, replace "https://meet.jit.si" with the proper serverURL
            URL(meetData)
        } catch (e: MalformedURLException) {
            e.printStackTrace()
            throw RuntimeException("Invalid server URL!")
        }
        val defaultOptions = JitsiMeetConferenceOptions.Builder()
            .setServerURL(serverURL)
            // When using JaaS, set the obtained JWT here
            //.setToken("MyJWT")
            // Different features flags can be set
            //.setFeatureFlag("toolbox.enabled", false)
            //.setFeatureFlag("filmstrip.enabled", false)
            .setFeatureFlag("welcomepage.enabled", false)
            .build()
        JitsiMeet.setDefaultConferenceOptions(defaultOptions)
        val options = JitsiMeetConferenceOptions.Builder()
            .setRoom(meetData)
            .build()
        view!!.join(options)
        registerForBroadcastMessages();
        findViewById<ImageButton>(R.id.btn1).setOnClickListener {
            openWebView("https://v.zoyel.one/whiteboard/#room=262506775262506775Aa,262506775262506775Absc")
            Toast.makeText(this, "WhiteBoard ${frameView.isVisible}", Toast.LENGTH_LONG).show()
        }

    }

    private fun registerForBroadcastMessages() {
        val intentFilter = IntentFilter()

        /* This registers for every possible event sent from JitsiMeetSDK
           If only some of the events are needed, the for loop can be replaced
           with individual statements:
           ex:  intentFilter.addAction(BroadcastEvent.Type.AUDIO_MUTED_CHANGED.getAction());
                intentFilter.addAction(BroadcastEvent.Type.CONFERENCE_TERMINATED.getAction());
                ... other events
         */
        for (type: BroadcastEvent.Type? in BroadcastEvent.Type.values()) {
            intentFilter.addAction(type?.action)
        }
        LocalBroadcastManager.getInstance(this).registerReceiver(broadcastReceiver, intentFilter)
    }

    // Example for handling different JitsiMeetSDK events
    private fun onBroadcastReceived(intent: Intent?) {
        if (intent != null) {
            val event = BroadcastEvent(intent)
            when (event.type ?: "") {
                BroadcastEvent.Type.CONFERENCE_JOINED -> {
                    Timber.e(
                        "Conference Joined with url%s",
                        event.data["url"].toString()
                    )
                }

                BroadcastEvent.Type.PARTICIPANT_JOINED -> {
                    Timber.e(
                        "Participant joined%s",
                        event.data["name"].toString()
                    )
                }

                else -> {
                    Timber.e(
                        "Participant joined%s",
                        event.toString()
                    )
                }
            }
        }
    }

    // Example for sending actions to JitsiMeetSDK
    private fun hangUp() {
        val hangupBroadcastIntent: Intent = BroadcastIntentHelper.buildHangUpIntent()
        LocalBroadcastManager.getInstance(applicationContext)
            .sendBroadcast(hangupBroadcastIntent)
    }

    override fun onDestroy() {
        super.onDestroy()
        view!!.dispose()
        view = null
        JitsiMeetActivityDelegate.onHostDestroy(this)
        sendMessageToFlutter("disconnect", "Meeting Has Been Disconnected")
    }


    public override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        JitsiMeetActivityDelegate.onNewIntent(intent)
    }

    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<String>,
        grantResults: IntArray
    ) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        JitsiMeetActivityDelegate.onRequestPermissionsResult(requestCode, permissions, grantResults)
    }

    override fun onResume() {
        super.onResume()
        JitsiMeetActivityDelegate.onHostResume(this)
        sendMessageToFlutter("resumed", "Meeting Has Been Resumed")
    }

    override fun onStop() {
        super.onStop()
        JitsiMeetActivityDelegate.onHostPause(this)
        sendMessageToFlutter("paused", "Meeting Has Been Paused")
    }

    override fun requestPermissions(
        strings: Array<String>,
        i: Int,
        permissionListener: PermissionListener
    ) {
    }
}