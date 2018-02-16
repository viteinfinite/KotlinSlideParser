# KotlinSlideParser

Experimental Android and iOS apps using a shared parsing module written in Kotlin/Native.

The project was presented at [MobOS 2018](http://romobos.com). The slides screened during the talk are [available here](https://speakerdeck.com/viteinfinite/native).

It supports the [Kotlin Multiplatform DSL](https://kotlinlang.org/docs/reference/multiplatform.html) introduced in Kotlin 1.2 and Kotlin/Native 0.6.

## Use Case

The apps provide a basic viewer for Markdown-based slides presented via [Deckset.app](https://www.decksetapp.com). 

### Main Blocks

- The parsing module is shared between Android and iOS
- The presentation layer is platform-specific: Kotlin is used on Android, while Swift on iOS

## Requirements

- Xcode 9.2
- [Kotlin/Native 0.6](https://github.com/JetBrains/kotlin-native/releases)

## Configuration

- Set `sdk.dir` in `common/local.properties` to your Android SDK folder
- Set `konan.home` in `common/gradle.properties` to the directory containing the [Kotlin/Native](https://github.com/JetBrains/kotlin-native/releases) compiler

## Credits

The parsing logic is **heavily** inspired by [SwiftyDown](https://github.com/aaaron7/SwiftyDown) - Kotlin feels just like Swift, _doesn't it?_ 
