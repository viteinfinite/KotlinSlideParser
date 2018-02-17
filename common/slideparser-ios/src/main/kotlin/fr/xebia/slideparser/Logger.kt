package fr.xebia.slideparser
import kotlinx.cinterop.*
import platform.Foundation.*

actual class Logger {
    actual fun log(tag: String?, message: String) {
    	if (tag != null) {
    		NSLog(tag + ": " + message)
    	} else {
    		NSLog(message)
    	}    	
    }
}

