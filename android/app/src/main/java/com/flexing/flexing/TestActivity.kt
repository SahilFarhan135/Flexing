package com.flexing.flexing

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.Toast
import com.flexing.flexing.MainActivity.Companion.channel

class TestActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_test)
        //make this as tranparent activyt
        window.setBackgroundDrawableResource(android.R.color.transparent)
        findViewById<Button>(R.id.btn1).setOnClickListener {
            channel?.invokeMethod("showFlutterDialog", null);
            Toast.makeText(this, "btn1 ${channel}", Toast.LENGTH_SHORT).show()

        }
    }
}