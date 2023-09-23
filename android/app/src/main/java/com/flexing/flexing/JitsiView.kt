package com.flexing.flexing

import android.content.Context
import android.graphics.Color
import android.view.View
import android.widget.Button
import android.widget.LinearLayout
import android.widget.TextView
import android.widget.Toast
import androidx.appcompat.widget.LinearLayoutCompat.OrientationMode
import androidx.core.content.ContextCompat
import androidx.viewpager2.widget.ViewPager2.Orientation
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory


internal class NativeView(
    context: Context,
    id: Int,
    messenger: BinaryMessenger,
    creationParams: Map<String?, Any?>?,
) : PlatformView {

    private var methodChannel: MethodChannel? = null

    private val textView: TextView
    private val button: Button
    private val linearLayout: LinearLayout

    override fun getView(): View {
        return linearLayout
    }

    override fun dispose() {

    }


    init {
        methodChannel = MethodChannel(messenger, "test_channel")
        linearLayout = LinearLayout(context)
        linearLayout.orientation = LinearLayout.VERTICAL
        textView = TextView(context)
        button = Button(context)
        button.text = "Click On Me"
        button.textSize = 44f
        button.setOnClickListener {
            Toast.makeText(context, "Working", Toast.LENGTH_LONG).show()
            methodChannel?.invokeMethod("showFlutterDialog", null)
        }
        textView.textSize = 22f
        textView.setBackgroundColor(Color.rgb(255, 255, 255))
        textView.text = "Rendered on a native Android view (id: $id)"
        linearLayout.addView(textView)
        linearLayout.addView(button)
        linearLayout.background = ContextCompat.getDrawable(context, R.drawable.launch_background)
    }

}


class NativeViewFactory(private val binaryMessenger: BinaryMessenger) :
    PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        val creationParams = args as Map<String?, Any?>?
        return NativeView(context, viewId, binaryMessenger, creationParams)
    }
}

