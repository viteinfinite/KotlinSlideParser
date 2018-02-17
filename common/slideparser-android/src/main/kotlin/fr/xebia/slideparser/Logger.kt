package fr.xebia.slideparser

import android.util.Log

actual class Logger {
    actual fun log(tag: String?, message: String) {
    	Log.d(tag ?: "", message)
    }
}