package fr.xebia.slideparser

class Support {
    fun optionalInt(): Int? {
        return null
    }

    fun somethingThatThrows() {
        throw Exception(message = "Oops.")
    }
}
