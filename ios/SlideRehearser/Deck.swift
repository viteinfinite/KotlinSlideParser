import Foundation

struct Deck {
    let contents: String

    init() {
        self.contents = """
        ---

        # [fit] Reusable
        # [fit] Native Modules with
        # [fit] Kotlin
        ---

        This is a mobile phone

        ---

        This is a mobile phone

        ---

        And when you have an app like this

        ---

        Your shareholders think: "How can I save money?"

        ---

        You think: "How can I write/maintain less code?"

        ---

        Solution: by doing cross-platform apps

        ---

        There are many mobile technologies:
        1. Xamarin
        2. PhoneGap / Cordova
        3. Titanium
        4. React Native
        5. Rubymotion
        6. Flash
        7. ...

        ---

        And over the years, many have failed to some extent

        ---

        Some have gained success:
        - PhoneGap
        - React Native
        - Xamarin

        ---

        But I don't like any of the three // TODO

        ---

        So, I kept coding in my favourite language

        ---

        Until...

        ---

        Kotlin

        ---

        Kotlin is a language developed by JetBrains which runs in the JVM

        ---

        Main features:
        // TODO

        ---

        It is widely used on Android apps, runs on backend apps

        ---

        And, since XXX 2017, it compiles to binary code

        ---

        How compilation works // TODO

        ---

        Supported targets:
        1. Android Native
        2. Linux
        3. macOS
        4. iOS

        ---

        Kotlin is interoperable and can useXXX any C code (with linking XXX) and that’s quite cool, because all of the iOS platform headers are in C

        ---

        So, let's say we want to create an app, written in Kotlin, that runs on both iOS and Android. Is this feasible? Yes
        (And there's even a nice example)

        ---

        But Kotlin also support creating iOS frameworks

        ---

        We basically have the following choice:
        1. Build entire iOS apps in kotlin (cf example)
        2. Do cross platforms Android / iOS  frameworks

        ---

        Today I'll speak about #2.
        Goal: create a .framework for iOS and a .aar for Android

        ---

        Why?

        1. I’m still a Swift fan
        2. Xcode / Swift is still a good platform today, especially if you use Storyboards
        3. Even if you create a full iOS app in Kotlin, view code is still specific to each platform and you will still have specific view implementations for iOS and Android
        4. Reuse code you would have written anyway
        5. Write once, test once
        6. Same, predictable, behavior
        7. A Kotlin developer making iOS apps still need to know the SDK, which is kindof the hardest part: in this case the kotlin developer only needs to know the business logic

        ---

        How to setup
        1. Project structure
        // TODO: Screenshot

        ---

        2. Gradle (Android and iOS)
        Compile framework vs aar

        ---

        IDE

        ---

        Let's compile (command line example)

        ---

        Xcode screenshot with framework

        ---

        # Digging deeper

        ---

        Generated headers for Objective-C

        ---

        Testing

        ---

        Debugging

        ---

        Type correspondance

        ---

        Access modifiers

        ---

        Optionals

        ---

        Memory management

        ---

        Coroutines

        ---

        Calling iOS modules from within Kotlin

        ---

        Conditional Modules

        ---

        Code example

        ---

        # Improvements

        ---

        - Compilation performance

        ---

        Limitations:
        - enums (+ proposed solution)
        - generics in arrays
        - missing full support for coroutines
        - some functions you use everyday are actually coming from Java, so they won't be available in KN (but think about CoreFoundation)

        ---

        You have almost the same limitations than when you want to use Swift modules from within ObjC

        ---

        # What's coming next

        ---

        Multiplatform: an easier API to build cross-platform apps

        ---

        # Another possible approach

        ---

        Native Framework for Android:
        - less user friendly
        - but better performance
        - especially for CPU intensive operations


"""
    }
}
