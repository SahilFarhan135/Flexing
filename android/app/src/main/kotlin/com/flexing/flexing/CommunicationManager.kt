package com.flexing.flexing

import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

object CommunicationManager {
    private var methodChannel: MethodChannel? = null

    val communicationChannel: MethodChannel?
        get() = methodChannel

    fun initialize(flutterEngine: FlutterEngine) {
        if (methodChannel == null) {
            methodChannel = MethodChannel(flutterEngine.dartExecutor, "com.zoyel.mobile")
        }
    }


    fun <T> sendMessageToFlutter(invokeMethod: String, message: T? = null) {
        try {
            methodChannel?.invokeMethod(invokeMethod, message)
        } catch (e: Exception) {
            // Handle exceptions, e.g., log or notify Flutter
            e.printStackTrace()
        }
    }


    // Add a releaseInstance method if needed
    fun releaseInstance() {
        methodChannel = null
    }

}
