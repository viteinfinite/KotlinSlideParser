package fr.xebia.slideparser

public sealed class SlideEntity {
    data class Page(val contents: List<MarkdownEntity>): SlideEntity()
}

public sealed class MarkdownEntity {
    data class Italic(val contents: List<MarkdownEntity>): MarkdownEntity()
    data class Bold(val contents: List<MarkdownEntity>): MarkdownEntity()
    data class Header(val contents: List<MarkdownEntity>, val level: Int): MarkdownEntity()
    data class InlineCode(val contents: List<MarkdownEntity>): MarkdownEntity()
    data class CodeBlock(val contents: String): MarkdownEntity()
    data class Links(val contents: List<MarkdownEntity>, val urlString: String): MarkdownEntity()
    data class Plain(val contents: String): MarkdownEntity()
    data class Refer(val contents: List<MarkdownEntity>): MarkdownEntity()
    data class Delete(val contents: List<MarkdownEntity>): MarkdownEntity()
}

public class SlideParser {
    internal val reserved = "`*#[(~"

   private fun slide(): Parser<SlideEntity.Page> =
           newPage()

    private fun markdown(): Parser<MarkdownEntity> =
            refer() +
            bold() +
            italic() +
            codeBlock() +
            delete() +
            inlineCode() +
            pureHeader() +
            links() +
            plain() +
            newline() +
            fakeNewLine() +
            reservedHandler()


    internal fun trimmedMarkdowns(): Parser<List<MarkdownEntity>> {
        val m = space(false).concat { this.markdown() }
        val mm = many1loop(m)
        return Parser { mm.process(it) }
    }

    internal fun trimmedSlides(): Parser<List<SlideEntity.Page>> {
        val m = space(false).concat { this.slide() }
        val mm = many1loop(m)
        return Parser { mm.process(it) }
    }

    private fun markdownParser(): Parser<List<MarkdownEntity>> = trimmedMarkdowns()
    private fun pageParser(): Parser<List<SlideEntity.Page>> = trimmedSlides()

    public fun parse(string: String): List<MarkdownEntity>? {
        val result = this.markdownParser().process(string)
        return if (result.isEmpty()) {
            null
        } else {
            result[0].first
        }
    }

    public fun parsePages(string: String): List<SlideEntity.Page>? {
        val result = this.pageParser().process(string)
        return if (result.isEmpty()) {
            null
        } else {
            result[0].first
        }
    }
}

// Entities

// TODO: Newlines
private fun SlideParser.newPage(): Parser<SlideEntity.Page> =
        symbol("---").concat {
            until("---", terminator = null).concat {
                val tmds = this.pureStringParse(it)
                pure(SlideEntity.Page(tmds))
            }
        }

private fun SlideParser.reservedHandler(): Parser<MarkdownEntity> {
    fun pred(c: Char): Boolean = reserved.indexOf(c) != -1
    return satisfy { pred(it) }.concat { c ->
        pure(MarkdownEntity.Plain(c.toString()) as MarkdownEntity)
    }
}

private fun SlideParser.pureHeader(): Parser<MarkdownEntity> = many1loop(parserChar('#')).concat { cs ->
    line().concat { str ->
        val tmds: List<MarkdownEntity> = listOf(MarkdownEntity.Plain("\n")) +
                this.pureStringParse(str) +
                MarkdownEntity.Plain("\n")
        pure(MarkdownEntity.Header(tmds, cs.size) as MarkdownEntity)
    }
}


private fun SlideParser.italic(): Parser<MarkdownEntity> = pair("*").concat {
    val mds = this.pureStringParse(it)
    pure(MarkdownEntity.Italic(mds) as MarkdownEntity)
}

private fun SlideParser.delete(): Parser<MarkdownEntity> = pair("~~").concat { str ->
    val mds = this.pureStringParse(str)
    pure(MarkdownEntity.Delete(mds) as MarkdownEntity)
}

private fun SlideParser.bold(): Parser<MarkdownEntity> = pair("**").concat { str ->
    val mds = this.pureStringParse(str)
    pure(MarkdownEntity.Bold(mds) as MarkdownEntity)
}

private fun SlideParser.inlineCode(): Parser<MarkdownEntity> = pair("`").concat { str ->
    val mds = this.pureStringParse(str)
    pure(MarkdownEntity.InlineCode(mds) as MarkdownEntity)
}

private fun SlideParser.links(): Parser<MarkdownEntity> = pair(separator1 = "[", separator2 = "]").concat { str ->
    pair(separator1 = "(", separator2 = ")").concat { str1 ->
        val mds = this.pureStringParse(str)
        pure(MarkdownEntity.Links(mds, str1) as MarkdownEntity)
    }
}

private fun SlideParser.markdownNewLineBreak(): Parser<String> {
    val process = trimmedSatisfy { isNewLine(it) }
    return process.concat { many1loop(process).concat { pure("\n") }}
}

private fun SlideParser.newline(): Parser<MarkdownEntity> = markdownNewLineBreak().concat { str ->
    pure(MarkdownEntity.Plain(str) as MarkdownEntity)
}

private fun SlideParser.fakeNewLine(): Parser<MarkdownEntity> = trimmedSatisfy { isNewLine(it) }.concat {
    pure(MarkdownEntity.Plain(" ") as MarkdownEntity)
}

private fun SlideParser.markdownLineStr(): Parser<String> = Parser { str ->
    var result = ""
    var rest = str
    while ((true)) {
        val temp = lineStr().process(rest)
        if (temp.isEmpty()) {
            result += rest[0]
            rest = rest.drop(1)
            continue
        }
        result += temp[0].first
        rest = temp[0].second
        if (rest == "") {
            break
        }
        val lineBreaks = this.markdownNewLineBreak().process(temp[0].second)
        if (lineBreaks.isNotEmpty()) {
            break
        } else {
            continue
        }
    }
    listOf(Pair(result, rest))
}

private fun SlideParser.plain(): Parser<MarkdownEntity> {
    fun predicate(c: Char) : Boolean {
        if (reserved.indexOf(c) != -1) {
            return false
        }
        return isNotNewLine(c)
    }
    return many1loop(satisfy { predicate(it) }).concat {
        pure(MarkdownEntity.Plain(it.joined()) as MarkdownEntity)
    }
}

private fun SlideParser.pureStringParse(string: String): List<MarkdownEntity> {
    val result = this.trimmedMarkdowns().process(string)
    return if (result.isNotEmpty()) {
        result[0].first
    } else {
        listOf()
    }
}

private fun SlideParser.refer(): Parser<MarkdownEntity> = many1loop(this.fakeNewLine()).concat {
    space(false).concat {
        symbol(">").concat {
            this.markdownLineStr().concat {
                val mds: List<MarkdownEntity> = this.pureStringParse(it) + MarkdownEntity.Plain("\n")
                pure(MarkdownEntity.Refer(mds) as MarkdownEntity)
            }
        }
    }
}

private fun SlideParser.codeBlock(): Parser<MarkdownEntity> = symbol("```").concat {
    ((lineStr().concat { space(true) }) + space(true))
            .concat {
                until("```", terminator = null).concat { str  ->
                    symbol("```").concat { pure(MarkdownEntity.CodeBlock(str) as MarkdownEntity) }
                }
            }
}
