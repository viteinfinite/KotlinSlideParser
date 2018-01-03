package fr.xebia.slideparser

import junit.framework.Assert.assertEquals
import org.junit.Test

class SlideParserTest {

    @Test
    fun parseOneLinePlainText() {
        val parser = SlideParser()
        val result = parser.parse("abc")!!
        assertEquals(1, result.size)
        assertEquals(result[0]::class, MarkdownEntity.Plain::class)
        assertEquals((result[0] as MarkdownEntity.Plain).contents, "abc")
    }

    @Test
    fun parseOneLineItalicText() {
        val parser = SlideParser()
        val result = parser.parse("*abc*")!!
        assertEquals(1, result.size)
        assertEquals(result[0]::class, MarkdownEntity.Italic::class)

        val nestedContents = (result[0] as MarkdownEntity.Italic).contents
        assertEquals(nestedContents.size, 1)
        assertEquals(nestedContents[0]::class, MarkdownEntity.Plain::class)
        assertEquals((nestedContents[0] as MarkdownEntity.Plain).contents, "abc")
    }

    @Test
    fun parseOneLineHeaderLevel1() {
        val parser = SlideParser()
        val result = parser.parse("# abc")!!
        assertEquals(1, result.size)
        assertEquals(result[0]::class, MarkdownEntity.Header::class)
        assertEquals((result[0] as MarkdownEntity.Header).level, 1)

        val nestedContents = (result[0] as MarkdownEntity.Header).contents
        assertEquals(3, nestedContents.size)
        assertEquals(nestedContents[1]::class, MarkdownEntity.Plain::class)
        assertEquals((nestedContents[1] as MarkdownEntity.Plain).contents, "abc")
    }

    @Test
    fun parseOneLineHeaderLevel3() {
        val parser = SlideParser()
        val result = parser.parse("""### abc""".trimIndent())!!
        assertEquals(1, result.size)
        assertEquals(result[0]::class, MarkdownEntity.Header::class)
        assertEquals((result[0] as MarkdownEntity.Header).level, 3)

        val nestedContents = (result[0] as MarkdownEntity.Header).contents
        assertEquals(3, nestedContents.size)
        assertEquals(nestedContents[1]::class, MarkdownEntity.Plain::class)
        assertEquals((nestedContents[1] as MarkdownEntity.Plain).contents, "abc")
    }

    @Test
    fun parseTwoLineHeader() {
        val parser = SlideParser()
        val result = parser.parse("""
            # abc
            ## def
            """.trimIndent())!!
        assertEquals(3, result.size)
        assertEquals(result[0]::class, MarkdownEntity.Header::class)
        assertEquals((result[0] as MarkdownEntity.Header).level, 1)

        assertEquals(result[2]::class, MarkdownEntity.Header::class)
        assertEquals((result[2] as MarkdownEntity.Header).level, 2)
    }

    @Test
    fun parseTwoLineText() {
        val parser = SlideParser()
        val result = parser.parse("""
            abc
            def
            """.trimIndent())!!
        assertEquals(3, result.size)
        assertEquals(result[0]::class, MarkdownEntity.Plain::class)
        assertEquals(result[1]::class, MarkdownEntity.Plain::class)
        assertEquals(result[2]::class, MarkdownEntity.Plain::class)

        val nestedTextLine1 = (result[0] as MarkdownEntity.Plain).contents
        assertEquals(nestedTextLine1, "abc")

        val nestedTextLine3 = (result[2] as MarkdownEntity.Plain).contents
        assertEquals(nestedTextLine3, "def")
    }

    @Test
    fun parseFourPagesText() {
        val parser = SlideParser()
        val result = parser.parsePages("""
            ---
            abc
            ---
            def
            ---
            *ghi*
            ---
            jkl
            """.trimIndent())!!
        assertEquals(4, result.size)
        assertEquals(result[0]::class, SlideEntity.Page::class)

        val firstPage = result[0] as SlideEntity.Page
        val plainContents = firstPage.contents[1] as MarkdownEntity.Plain
        assertEquals("abc", plainContents.contents)
    }
}