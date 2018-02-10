import Foundation

struct Deck {
    let contents: String

    init() {
        self.contents = """
        ---

        # [fit] **Shared**
        # [fit] Cross-Platform
        # [fit] Modules with
        # [fit] __*Kotlin/Native*__

        ---

        # [fit] Simone Civetta
        # [fit] @viteinfinite

        ![inline, 15%](images/logoxebia.png)

        ---

        ![](images-conan/vlcsnap-2018-02-08-14h18m59s370.png)

        ^ We're gonna start from the beginning

        ---

        ![](https://static.pexels.com/photos/590763/pexels-photo-590763.jpeg)

        ^ This is a mobile phone

        ---

        ![](https://upload.wikimedia.org/wikipedia/commons/d/d6/Sony_Xperia_Z2_face_20140429.jpg)

        ^ This is a mobile phone

        ---

        ![original](https://get.pxhere.com/photo/smartphone-watch-hand-technology-phone-telephone-communication-gadget-yellow-mobile-phone-list-network-app-to-do-list-portable-communications-device-to-do-1086921.jpg)

        ^ And when you have an app like this

        ---

        # [fit] Shareholders

        ![original](images-conan/vlcsnap-2018-02-08-16h49m09s855.png)

        ^ The first thing your shareholders think: "How can I save money?"

        ---

        # [fit] ` `    You    ` `

        ![](images/Intro Text.png)

        <!-- ![original](https://get.pxhere.com/photo/laptop-computer-screen-keyboard-technology-web-internet-office-communication-website-html-monitor-programming-source-code-science-programmer-background-electronics-display-concept-pc-information-java-network-software-multimedia-wireless-code-program-data-script-www-world-wide-web-css-personal-computer-cyberspace-php-electronic-device-computer-hardware-personal-computer-hardware-display-device-computer-program-coder-webdesigner-css3-html5-software-engineer-unstock-912807.jpg)
        -->
        ^ You think: "How can I write/maintain less code?"

        ---

        **Solution**

        ## [fit] Cross-Platform

        ---

        # Main platforms:

        - Xamarin
        - PhoneGap / Cordova
        - AppCelerator Titanium
        - React Native
        - RubyMotion
        - Flash
        - ...

        ---

        <!-- ![](https://i.ytimg.com/vi/qeuTF5XE4mk/maxresdefault.jpg) -->

        ![](images-conan/vlcsnap-2018-02-08-16h40m50s033.png)

        ^ And over the years, many have failed to some extent

        ---

        ![](http://geekycentral.com/wp-content/uploads/2017/09/react-native.png)

        ^ And some have gained success

        ^ Truth to be honest, as much as it works...

        ---

        ![](images-conan/vlcsnap-2018-02-08-14h32m58s967.png)

        ^ It scares me
        ^ Well, I'm not a huge fan of cross-platform after all
        ^ And, as an iOS developer, I wanted to stick to a language I really like

        ---

        ![](images/Swift.png)

        ^ So, I kept coding in my favourite language

        ---

        ![](images-conan/vlcsnap-2018-02-08-16h22m10s507.png)

        ---

        ![original](images/Kotlin Blurred.png)

        ---

        ![](images/Kotlin.png)

        ^ Who knows Kotlin?
        ^ Who's using Kotlin today?

        ---

        ![](images/JetBrains.png)

        ^ Kotlin is a language developed by JetBrains, from 2011

        ---

        # [fit] JVM

        ^ runs in the JVM

        ---

        # [fit] Statically typed

        ---

        # Function extensions

        ```kotlin
        fun MutableList<Int>.swap(index1: Int, index2: Int) {
        val tmp = this[index1] // 'this' corresponds to the list
        this[index1] = this[index2]
        this[index2] = tmp
        }
        val l = mutableListOf(1, 2, 3)
        l.swap(0, 2)
        ```

        ---

        # Optionals

        ```kotlin
        var a: String = "abc"
        a = null // compilation error
        ```

        # Smart casting

        ```kotlin
        fun demo(x: Any) {
        if (x is String) {
        print(x.length) // x is automatically cast to String
        }
        }
        ```

        ---

        # Lambda & Inlines

        ```kotlin
        max(strings, { a, b -> a.length < b.length })
        ```

        # Data classes

        ```kotlin
        data class User(val name: String, val age: Int)
        ```

        ---

        # [fit] 15%
        # [fit] of developers
        # [fit] use Kotlin on Android

        ^ It is widely used on Android apps

        ![](images-conan/vlcsnap-2018-02-08-16h31m04s198.png)

        ^ Selon les données de Realm

        ---

        # [fit] Server-Side

        ![original](https://media.licdn.com/mpr/mpr/AAEAAQAAAAAAAAlXAAAAJDY3N2Q0YjkzLWQ3NTMtNGU4MC1hZGVlLTg4MzdiZDViOTg0MA.jpg)

        ^ It can runs on server-side apps

        ---

        # [fit] April 2017

        ![original](images-conan/vlcsnap-2018-02-08-16h30m00s091.png)

        ---

        # [fit] **Kotlin/Native**

        ---

        ![](https://2.bp.blogspot.com/-V2KDv9Fp54A/WHrBIbNPbaI/AAAAAAAAZQA/Itn5PO13TSY7oI1txfjI-3VDEhpS3xyfwCLcB/s1600/conan-the-barbarian.jpg)

        ---

        ![original](https://2.bp.blogspot.com/-V2KDv9Fp54A/WHrBIbNPbaI/AAAAAAAAZQA/Itn5PO13TSY7oI1txfjI-3VDEhpS3xyfwCLcB/s1600/conan-the-barbarian.jpg)

        #
        # [fit] Konan
        ###### Kotlin Native Backend

        ---

        # [fit] How it works

        ---

        ![](images/LLVM Step 1.png)

        ---

        ![](images/LLVM Step 2.png)

        ---

        # Supported Targets

        1. Android Native
        2. Web Assembly
        3. Linux
        4. macOS
        5. iOS

        ---

        # [fit] Interoperable

        Can make use of any C library

        ^ and that’s quite cool, because all of the iOS platform headers are in C

        ![original](images-conan/vlcsnap-2018-02-08-16h35m19s453.png)

        ---

        # [fit] Can I write an entire iOS in Kotlin?

        # [fit] YES

        ---

        ![fit](images/ios-app.jpeg)

        ---

        # But There's More

        ---

        # [fit] iOS Frameworks

        ^ Since 0.5 (December 2017) Kotlin also supports creating iOS frameworks

        ---

        # [fit] Sharing
        # [fit] Code between
        # [fit] **iOS** and **Android**

        ![original](images-conan/vlcsnap-2018-02-08-16h39m30s441.png)

        ---

        # A **Cross-Platform**, **shared**, Module

        ---

        # Why Does it Make Sense?

        1. Xcode still the most suitable IDE for iOS
        2. Code for views cannot be shared anyway
        3. Either way, you have to master UIKit

        ^ 1. Xcode is still the best platform to handle and debug your views
        ^ 2. Even if you create a full iOS app in Kotlin, view code is still specific to each platform and you will still have specific view implementations for iOS and Android
        ^ 3. No matter the language you use, you still have to know UIKit, which is more than half of the stuff you need to know when you're an iOS developer

        ---

        # My Usecase

        - Deckset
        - Markdown-based slides
        - Share parsing logic

        ![inline](https://is1-ssl.mzstatic.com/image/thumb/Purple118/v4/76/23/28/76232896-644e-c9f5-e394-67cafefb844a/AppIcon.png/246x0w.png)

        ---

        # App Structure

        - iOS view logic
        - Android view logic
        - Shared parsing library:
        - **iOS**  ➡ `.framework` (Kotlin/Native)
        - **Android**  ➡ `.aar` (Kotlin/JVM)

        ---

        # [fit] IDE

        ---

        ![fit](https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Android_Studio_icon.svg/2000px-Android_Studio_icon.svg.png)

        ---

        # [fit] Project
        # [fit] Structure

        ---

        # Project Structure

        ```
        ├── android/
        ├── ios/
        └── common/
                ├── build.gradle
                ├── gradle/
                └── slideparser/
                          ├── build.gradle
                          └── src/
        ```

        ---

        # [fit] Dependency Manager &
        # [fit] Environment Setup

        ---

        ![inline, 30%](images/gradle.png)

        ---

        # `common/build.gradle`

        ```
        ├── android/
        ├── ios/
        └── common/
                ├── build.gradle ⬅⬅⬅
                ├── gradle/
                └── slideparser/
                          ├── build.gradle
                          └── src/
        ```

        ---

        # `common/build.gradle`

        ```gradle
        subprojects {
        buildscript {
        ext.kotlin_version = '1.2.20'

        repositories {
        mavenCentral()
        maven {
        url "https://dl.bintray.com/jetbrains/kotlin-native-dependencies"
        }
        google()
        jcenter()
        }

        dependencies {
        classpath 'com.android.tools.build:gradle:3.0.1'
        classpath "org.jetbrains.kotlin:kotlin-native-gradle-plugin:+"
        }
        }
        }

        allprojects {
        repositories {
        google()
        jcenter()
        }
        }
        ```

        ---

        # `common/slideparser/build.gradle`

        ```
        ├── android/
        ├── ios/
        └── common/
                ├── build.gradle
                ├── gradle/
                └── slideparser/
                          ├── build.gradle ⬅⬅⬅
                          └── src/
        ```

        ---

        # `common/slideparser/build.gradle` (1/3)

        ```gradle
        buildscript {
        dependencies {
        classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"
        }
        }

        repositories {
        mavenCentral()
        }

        apply plugin: 'konan'
        apply plugin: 'com.android.library'
        apply plugin: 'kotlin-android'

        // ...
        ```

        ---

        # `common/slideparser/build.gradle` (2/3)
        ## Android

        ```gradle
        android {
        compileSdkVersion 26

        defaultConfig {
        // ...
        }

        sourceSets {
        main.java.srcDirs += 'src/main/kotlin'
        main.java.srcDirs += 'src/test/kotlin'
        }
        }
        ```


        ---

        # `common/slideparser/build.gradle` (3/3)
        ## iOS


        ```gradle
        konan.targets = ['iphone', 'iphone_sim']

        konanArtifacts {
        framework('KotlinSlideParser') {
        srcDir 'src/main/kotlin'
        }
        }
        ```

        ---

        # Tasks

        ```bash
        ./gradlew tasks

        assemble - Assembles all variants of all applications and packages.

        build - Assembles and tests this project.

        compileKonanKotlinSlideParserIphone -
        Build the Kotlin/Native framework \
        'compileKonanKotlinSlideParserIphone' for target 'IPHONE'

        compileKonanKotlinSlideParserIphone_sim -
        Build the Kotlin/Native framework
        'compileKonanKotlinSlideParserIphone_sim' for target 'IPHONE_SIM'
        ```

        ---

        # Build

        ```bash
        ./gradlew -p . compileKonanKotlinSlideParserIphone
        ```

        ![original,150%](images/Framework File.png)

        ---

        ![original](images-conan/vlcsnap-2018-02-08-17h26m21s772.png)

        # [fit] Digging
        # [fit] Deeper

        ---

        ![original](images-conan/vlcsnap-2018-02-08-17h31m03s223.png)

        # Digging Deeper
        ## [fit] Testing

        ---

        # Testing

        - Unit tests supported in Kotlin/Native
        - But you can use JUnit (or Spek) too
        - Optimal IDE support

        ![inline](images/Testing.png)

        ---

        ![](images-conan/vlcsnap-2018-02-08-17h12m02s410.png)

        # Digging Deeper
        ## [fit] Objective-C Headers

        ---

        # Objective-C Generated Headers

        ![inline,150%](images/Framework File.png)

        ---

        # Objective-C Generated Headers

        ```
        └── KotlinSlideParser.framework
                ├── Headers
                │   └── KotlinSlideParser.h ⬅⬅⬅
                ├── Info.plist
                ├── KotlinSlideParser
                └── Modules
                        └── module.modulemap

        ```

        ---

        # Kotlin / ObjC / Swift Type Correspondance

        Kotlin | Objective-C | Swift
        -------|-------------|------
        `Float` | `float` | `Float`
        `Double` | `double` | `Double`
        `Int` | `int32_t` | `Int32`
        `Boolean` | `BOOL` | `Bool`
        `String` | `NSString *` | `String`
        `Array<String>` | `StdlibArray *` | `StdlibArray`
        `List<String>` | `NSArray<id> *` | `[Any]`
        `Int?` | `Nullable NSNumber *` | `NSNumber?`

        ^ Optionals are supported
        ^ ByteArray StdlibByteArray (convertible to data)

        ---

        Kotlin | Objective-C | Swift
        -------|-------------|------
        `interface` | `protocol` | `protocol`
        `data class` | `class` | `class`
        `enum class` | `StdlibEnum` | `StdlibEnum`

        Kotlin | Objective-C | Swift
        -------|-------------|------
        `open` | _(subclassable)_ | `open`
        `public` | _(subclassable)_ | `open`

        ---

        ![original](images-conan/vlcsnap-2018-02-08-18h12m31s817.png)

        # Digging Deeper
        ## [fit] Debugging

        ---

        # Debugging

        - Debugging is supported
        - Compiler produces a `.dSYM` file
        - "official" LLVM symbolication file for debugging
        - DWARF format
        - Allows using Xcode for debugging

        ---

        # Debugging

        ```llvm
        // Force adding symbolication file if needed
        (lldb) add-dsym PATH/TO/KotlinSlideParser.framework.dSYM

        (lldb) breakpoint set --func-regex "my-regex"

        (lldb) b kfun
        ```

        ![inline,80%](images/b kfun.png)

        ---

        ![fit](images/Debugging.png)

        ---

        ![original](images-conan/vlcsnap-2018-02-08-17h35m56s744.png)

        # Digging Deeper
        ## [fit] Memory Management

        ---

        # Memory Management

        - No Garbage-Collector
        - ARC-based...
        - ...with a cycle collector on top ARC

        <!-- ---

        Calling iOS modules from within Kotlin // TODO? -->

        ---

        ![](images-conan/vlcsnap-2018-02-08-18h07m34s370.png)

        # Digging Deeper
        ## [fit] Platform-Specific Code

        ^ It's the "official" hack as for now

        ---

        # Platform-Specific Code: Android

        ```gradle
        // ...

        android {
        // ...
        sourceSets {
        main.java.srcDirs += 'src/main/kotlin'
        main.java.srcDirs += 'src/android/kotlin' ⬅⬅⬅

        main.java.srcDirs += 'src/test/kotlin'
        }
        }
        ```

        ---

        # Platform-Specific Code: iOS

        ```gradle
        // ...
        konanArtifacts {
        framework('KotlinSlideParser') {
        srcDir 'src/main/kotlin'

        target('iphone') {
        srcDir 'src/ios/kotlin' ⬅⬅⬅
        }

        target('iphone_sim') {
        srcDir 'src/ios/kotlin' ⬅⬅⬅
        }
        }
        }
        ```

        ---

        ![original](images-conan/vlcsnap-2018-02-08-18h13m11s907.png)

        # [fit] Example

        ---

        # Kotlin

        ```kotlin
        public sealed class SlideEntity {
        data class Page(val contents: List<MarkdownEntity>): SlideEntity()
        }

        public sealed class MarkdownEntity {
        data class Header(val contents: List<MarkdownEntity>, val level: Int): MarkdownEntity()
        data class Plain(val contents: String): MarkdownEntity()
        }

        public class SlideParser {
        public fun parsePages(string: String): List<SlideEntity>? {
        val result = this.pageParser().process(string)
        return if (result.isEmpty()) {
        null
        } else {
        result[0].first
        }
        }
        }
        ```

        ---

        # Swift

        ```swift
        import KotlinSlideParser
        // ...
        let parser = KSPSlideParser()
        guard let pages = parser.parsePages(string: myText)
        as? [KSPSlideEntityPage] else { return }

        pages.first?.contents.forEach { entity in
        switch entity {
        case let header as KSPMarkdownEntityHeader:
        header.level // Level of the header

        case let plain as KSPMarkdownEntityPlain:
        plain.contents // Text of the entity

        default:
        break
        }
        }
        ```

        ---

        ![original](images-conan/vlcsnap-2018-02-08-17h17m46s009.png)

        # [fit] Another Approach

        ---

        # Another Approach

        NDK Library for Android

        - less user friendly
        - better performance
        - suitable for CPU-intensive operations

        ---

        ![original](images-conan/vlcsnap-2018-02-08-17h24m03s923.png)

        # [fit] Current Limitations

        ---

        # Current Limitations

        - ~~Compilation time~~
        - Still a Technology Preview
        - Missing `kotlinx.coroutines` extensions
        - Some everyday functions not available in KN
        - Some types poorly translate to Swift

        > Overall, not much worse than calling Objective-C from Swift

        ^ 3. as they're actually imported from `java.*`
        ^ 4. (but think about CoreFoundation)
        ^ 5. For instance, generics

        ---

        # [fit] Future Evolutions

        ![original](images-conan/vlcsnap-2018-02-08-16h52m21s424.png)

        ---

        # Future Evolutions

        - _Multiplatform_
        - an easier API to build cross-platform apps
        - AppCode Support
        - Better Objective-C header generation
        - Native interoperability with Swift (?)
        - And more...

        ---

        # [fit] Other Resources

        - [Swift is like Kotlin](http://nilhcem.com/swift-is-like-kotlin/)
        - [Kotlin Blog](https://blog.jetbrains.com/kotlin/)
        - [Deep Dive into Kotlin/Native by Andrey Breslav](https://www.youtube.com/watch?v=3Lqiupxo4CE)
        - Kotlin Slack

        ---

        # [fit] Summing Up

        ---

        # Main strengths

        - Reuse Kotlin code you already have
        - "Feels" like Swift
        - Write once, _create binaries that run anywhere_ (without overhead)
        - Battle-tested, mobile-first IDEs

        ---

        > Kotlin/Native is still young but **already usable**, and **very, very promising**

        ---

        # [fit] Thank You!

        ---

        # [fit] Simone Civetta
        # [fit] @viteinfinite

        ![inline, 15%](images/logoxebia.png)

        ^ We're gonna start by the basics

        ---

"""
    }
}
