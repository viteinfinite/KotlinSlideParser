package fr.xebia.sliderehearser

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.support.v4.view.ViewPager
import fr.xebia.slideparser.SlideEntity
import fr.xebia.slideparser.SlideParser


class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        val parser = SlideParser()
        val results = parser.parsePages("--- 123 --- 456")
        if (results != null) {
            createPager(slides = results)
        }
    }

    private fun createPager(slides: List<SlideEntity>) {
        val pager = findViewById<ViewPager>(R.id.pager)
        pager.adapter = SlidePagerAdapter(supportFragmentManager, slides)
    }
}
