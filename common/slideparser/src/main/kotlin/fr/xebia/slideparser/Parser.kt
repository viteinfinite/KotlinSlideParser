package fr.xebia.slideparser

enum class MyEnum {
    A,
    B,
    C
}

enum class OtherEnum(val value: Int, val toto: String) {
    A(value = 1, toto = "1"),
    B(value = 2, toto = "2")
}

internal data class Parser<T>(val process: (String) -> List<Pair<T, String>>) {
    operator fun plus(increment: Parser<T>): Parser<T> {
        return Parser {
            val left = this.process(it)
            if (left.isNotEmpty()) {
                left
            } else {
                increment.process(it)
            }
        }
    }

    fun <B> concat(f: (T) -> Parser<B>): Parser<B> {
        return Parser { string  ->
            val results = this.parse(input = string)
            if (results.isEmpty()) {
                listOf()
            } else {
                val nextParser = f(results[0].first)
                val nextParserResults = nextParser.parse(results[0].second)
                if (nextParserResults.isEmpty()) {
                    listOf()
                } else {
                    nextParserResults
                }
            }
        }
    }

    private fun parse(input: String): List<Pair<T, String>> {
        var results = listOf<Pair<T, String>>()
        for ((x, s) in this.process(input)) {
            results += Pair(x, s)
        }
        return results
    }
}

internal fun isSpace(c: Char): Boolean {
    return c == ' ' || c == '\n' || c == ' '
}

internal fun isPureSpace(c: Char): Boolean {
    return c == ' '
}

internal fun isNotNewLine(c: Char): Boolean {
    return !isNewLine(c)
}

internal fun isNewLine(c: Char): Boolean {
    return c == '\n'
}

internal fun <A> pure(item: A): Parser<A> {
    return Parser { cs ->
        listOf(Pair(item, cs))
    }
}

internal fun satisfy(condition: (Char) -> Boolean) : Parser<Char> {
    return Parser { x ->
        val head = x.firstOrNull()
        if (head == null || !condition(head)) {
            listOf()
        } else {
            listOf(Pair(head, x.drop(1)))
        }
    }
}

internal fun until(word: String, terminator: Char?): Parser<String> {
    return Parser {
        val idx = it.indexOf(word)
        val idxTer: Int = if (terminator != null) it.indexOf(terminator) else {
            it.lastIndex
        }

        when {
            idx == -1 -> listOf(Pair(it, ""))
            idxTer == -1 -> {
                val a = it.substring(startIndex = 0, endIndex = idx)
                val b = it.substring(startIndex = idx)
                listOf(Pair(a, b))
            }
            else -> {
                val finalIdx = if (idx > idxTer) {
                    idxTer
                } else {
                    idx
                }
                val a = it.substring(startIndex = 0, endIndex = finalIdx)
                val b = it.substring(startIndex = finalIdx)
                listOf(Pair(a, b))
            }
        }
    }
}

internal fun lineUntil(word: String): Parser<String> {
    return until(word, terminator = '\n')
}

// Combinator

internal fun <A> many(p: Parser<A>): Parser<List<A>> = many1(p) + pure(listOf())

internal fun <A> many1(p: Parser<A>): Parser<List<A>> = p.concat { it1 ->
    many(p).concat { it2 ->
        pure(listOf(it1) + it2)
    }
}

internal fun <A> many1loop(p: Parser<A>): Parser<List<A>> = Parser { str ->
    var result: List<A> = listOf()
    var curStr = str
    while ((true)) {
        val temp = p.process(curStr)
        if (temp.isEmpty()) {
            break
        } else {
            result += temp[0].first
            curStr = temp[0].second
        }
    }
    if (result.isEmpty()) {
        listOf()
    } else {
        listOf(Pair(result, curStr))
    }
}


internal fun parserChar(c: Char) : Parser<Char> = Parser { x ->
    val head = x.firstOrNull()
    if (head == null || head != c) {
        listOf()
    } else {
        listOf(Pair(c, x.drop(1)))
    }
}

// Handle String

internal fun string(str: String): Parser<String> {
    val head = str.firstOrNull() ?: return pure("")
    return parserChar(head).concat { it1 ->
        val remnant = str.drop(1)
        string(remnant).concat { it2 ->
            pure(it1 + it2)
        }
    }
}


internal fun line() : Parser<String> = many1loop(satisfy { isNotNewLine(it) }).concat { pure(it.joined()) }

internal fun space(includeNewLine: Boolean = true) : Parser<String> {
    return if (includeNewLine) {
        many(satisfy { isSpace(it) }).concat { pure("") }
    } else {
        many(satisfy { isPureSpace(it) }).concat { pure("") }
    }
}

internal fun symbol(sym: String): Parser<String> = string(sym).concat { pure(it) }

// Handle expressions

internal fun pair(separator: String): Parser<String> = symbol(separator).concat {
    lineUntil(separator).concat { str ->
        symbol(separator).concat { pure(str) }
    }
}

internal fun pair(separator1: String, separator2: String): Parser<String> = symbol(separator1).concat {
    lineUntil(separator2).concat { str ->
        symbol(separator2).concat { pure(str) }
    }
}

internal fun trimmedSatisfy(pred: (Char) -> Boolean) : Parser<Char> = space(false).concat {
    satisfy(pred).concat { x -> pure(x) }
}

internal fun lineStr() : Parser<String> = many1loop(satisfy { isNotNewLine(it) }).concat {
    pure(it.joined())
}

internal fun List<Char>.joined(): String = joinToString(separator = "")