package com.flexing.flexing

import io.flutter.plugin.common.MethodChannel
import org.json.JSONObject

sealed class MethodChannelResult<out T> {
    data class Success<out T>(val data: T) : MethodChannelResult<T>()
    data class Error(val errorCode: String?, val errorMessage: String?, val errorDetails: Any? = null) : MethodChannelResult<Nothing>()

    fun toJson(): String {
        val json = JSONObject()
        when (this) {
            is Success -> {
                json.put("type", "success")
                json.put("data", data)
            }
            is Error -> {
                json.put("type", "error")
                json.put("errorCode", errorCode)
                json.put("errorMessage", errorMessage)
                json.put("errorDetails", errorDetails)
            }
        }
        return json.toString()
    }
}

// Usage example:
val result = MethodChannelResult.Success("Data to send to Flutter")
val jsonResult = result.toJson()
