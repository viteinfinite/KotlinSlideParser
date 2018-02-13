package fr.xebia.sliderehearser

import android.support.v4.app.Fragment
import android.support.v4.app.FragmentManager
import android.support.v4.app.FragmentStatePagerAdapter
import fr.xebia.slideparser.SlideEntity

class SlidePagerAdapter(fragmentManager: FragmentManager, private val slides: List<SlideEntity>) : FragmentStatePagerAdapter(fragmentManager) {

    override fun getItem(position: Int): Fragment? {
        return SlideFragment.newInstance(slides[position])
    }

    override fun getCount(): Int {
        return slides.size
    }
}
