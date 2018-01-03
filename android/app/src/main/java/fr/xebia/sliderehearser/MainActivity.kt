package fr.xebia.sliderehearser

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import fr.xebia.slideparser.SlideParser
import fr.xebia.slideparser.Support


class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        val parser = SlideParser()
        parser.parse("123 --- 123")

        //val pages = parser.parse("123")

        Log.d("AAA", "osname is: " + Support().osName())
        //val support = Support()
        //support.osName
    }
}
