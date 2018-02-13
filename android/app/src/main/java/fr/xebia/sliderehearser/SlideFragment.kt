package fr.xebia.sliderehearser

import android.os.Bundle
import android.support.v4.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import fr.xebia.slideparser.SlideEntity

class SlideFragment : Fragment() {

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {

        val view = inflater.inflate(R.layout.fragment_slide, container, false)
        val textView = view.findViewById<TextView>(R.id.textView)

        val args = arguments
        textView.text = args.getString("TEXT")

        return view
    }

    companion object {
        fun newInstance(slide: SlideEntity): SlideFragment {
            val args = Bundle()
            args.putString("TEXT", slide.createAttributedString())


            val fragment = SlideFragment()
            fragment.arguments = args
            return fragment
        }
    }
}

fun SlideEntity.createAttributedString(): String {
    return when {
        this is SlideEntity.Page -> contents.toString()
        else -> ""
    }
}
