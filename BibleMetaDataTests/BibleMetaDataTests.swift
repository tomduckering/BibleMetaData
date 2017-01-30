//
//  BibleMetaDataTests.swift
//  BibleMetaData
//
//  Created by Tom Duckering on 08/01/2017.
//  Copyright © 2017 Tom Duckering. All rights reserved.
//

import XCTest
@testable import BibleMetrics

class BibleMetaDataTests: XCTestCase {

    func testCanListAllBooksOfTheBible() {
        let books: [BibleBook] = BibleBook.allBooks()
        XCTAssertEqual(books.count, 66)
    }

    func testCanListAllNewTestamentBooksOfTheBible() {
        let newTestamentbooks: [BibleBook] = BibleBook.newTestamentBooks()

        XCTAssertEqual(newTestamentbooks.count, 27)
    }

    func testCanGetBooksBeforeAGivenBook() {
        let expectedBooksBeforeDeut: [BibleBook] = [.Genesis, .Exodus, .Leviticus, .Numbers]

        let booksBeforeDeut = BibleBook.Deuteronomy.booksBefore()

        XCTAssertEqual(booksBeforeDeut, expectedBooksBeforeDeut)
    }

    func testCanGetNumberOfPriorVerses() {
        let expectedNumberOfVersesInGenesisAndExodus = 1533 + 1213

        let numberOfVersesBeforeLeviticus = BibleBook.Leviticus.versesPriorTo()

        XCTAssertEqual(numberOfVersesBeforeLeviticus, expectedNumberOfVersesInGenesisAndExodus)
    }

    func testCanGetNumberOfPriorVersesInABook() {
        let expectNumberOfVersesInFirst9ChaptersOfGenesis = 31  + 25  + 24  + 26  + 32  + 22  + 24  + 22  + 29

        let numberOfVersesPriorToChapter10OfGenesis = BibleBook.Genesis.numberOfVerses(beforeChapter: 10)

        XCTAssertEqual(numberOfVersesPriorToChapter10OfGenesis, expectNumberOfVersesInFirst9ChaptersOfGenesis)
    }

    func testCanGetAbsoluteVerseNumberForGenesis1v1() {
        let expectedAbsoluteVerseNumberForStartOfBible = 1

        let startOfBible = BibleReference(withBook: .Genesis, chapter:1, andVerse: 1)!

        let absoluteVerseNumber = startOfBible.absoluteVerseNumber()

        XCTAssertEqual(absoluteVerseNumber, expectedAbsoluteVerseNumberForStartOfBible)
    }

    func testCanGiveMeTheStartOfTheBible() {
        let startOfBible = BibleReference.startOfBible()

        XCTAssertEqual(startOfBible.book, BibleBook.Genesis)
        XCTAssertEqual(startOfBible.chapterNumber, 1)
        XCTAssertEqual(startOfBible.verseNumber, 1)
    }

    func testCanGiveMeTheEndOfTheBible() {
        let endOfBible = BibleReference.endOfBible()

        XCTAssertEqual(endOfBible.book, BibleBook.Revelation)
        XCTAssertEqual(endOfBible.chapterNumber, 22)
        XCTAssertEqual(endOfBible.verseNumber, 21)
    }

    func testCanGetNextBookOfTheBible() {
        let genesis = BibleBook.Genesis
        let expectedNextBook = BibleBook.Exodus

        XCTAssertEqual(genesis.nextBook(), expectedNextBook)
    }

    func testCanGetNextBookOfTheBibleWhenThereIsNoNextBook() {
        let revelation = BibleBook.Revelation

        XCTAssertNil(revelation.nextBook())
    }

    func testCanGetPreviousBookOfTheBible() {
        let revelation = BibleBook.Revelation
        let expectedPreviousBook = BibleBook.Jude

        XCTAssertEqual(revelation.previousBook(), expectedPreviousBook)
    }

    func testCanGetPreviousBookOfTheBibleWhenThereIsNoPreviousBook() {
        let genesis = BibleBook.Genesis

        XCTAssertNil(genesis.previousBook())
    }

    func testCanGetGenesis1v1FromAbsoluteVerseNumber() {
        let absoluteVerseNumber: AbsoluteVerseNumber = 1

        let reference = BibleBook.reference(withAbsoluteVerseNumber: absoluteVerseNumber)

        XCTAssertEqual(reference?.book, BibleBook.Genesis)
        XCTAssertEqual(reference?.chapterNumber, 1)
        XCTAssertEqual(reference?.verseNumber, 1)
    }

    func testCanGetGenesis2v1FromAbsoluteVerseNumber() {
        let absoluteVerseNumber: AbsoluteVerseNumber = 32

        let reference = BibleBook.reference(withAbsoluteVerseNumber: absoluteVerseNumber)

        XCTAssertEqual(reference?.book, BibleBook.Genesis)
        XCTAssertEqual(reference?.chapterNumber, 2)
        XCTAssertEqual(reference?.verseNumber, 1)
    }

    func testCanGetGenesis50v26FromAbsoluteVerseNumber() {
        let absoluteVerseNumber: AbsoluteVerseNumber = 1533

        let reference = BibleBook.reference(withAbsoluteVerseNumber: absoluteVerseNumber)

        XCTAssertEqual(reference?.book, BibleBook.Genesis)
        XCTAssertEqual(reference?.chapterNumber, 50)
        XCTAssertEqual(reference?.verseNumber, 26)
    }

    func testThatEstherIsSeventeenthBookOfBible() {
        XCTAssertEqual(BibleBook.allBooks()[16], BibleBook.Esther)
        XCTAssertEqual(BibleBook.allBooks()[21], BibleBook.Song_of_Solomon)
        XCTAssertEqual(BibleBook.allBooks()[26], BibleBook.Daniel)
        XCTAssertEqual(BibleBook.allBooks()[38], BibleBook.Malachi)
    }

    func testThatEstherHasTenChapters() {
        XCTAssertEqual(BibleBook.Esther.numberOfChapters(), 10)
    }

    func testThatDanielHasTwelveChapters() {
        XCTAssertEqual(BibleBook.Daniel.numberOfChapters(), 12)
    }

    func testThatTheRightNumberOfChaptersInTheBible() {
        let numberOfChaptersInTheBible = BibleBook.allBooks().map { book in book.numberOfChapters() }.reduce(0, +)

        let expectedNumberOfChaptersInTheBible = 1189

        XCTAssertEqual(numberOfChaptersInTheBible, expectedNumberOfChaptersInTheBible)
    }

    func testThatTheRightNumberOfVersesInTheOldTestament() {
        let numberOfVersesInTheOldTestament = BibleBook.oldTestamentBooks().map { book in book.numberOfVerses() }.reduce(0, +)
        let expectedNumberOfVersesInTheOldTestament = 23145

        XCTAssertEqual(numberOfVersesInTheOldTestament, expectedNumberOfVersesInTheOldTestament)
    }

    func testThatTheRightNumberOfVersesInTheBible() {
        let numberOfVersesInTheOldTestament = BibleBook.allBooks().map { book in book.numberOfVerses() }.reduce(0, +)
        let expectedNumberOfVersesInTheOldTestament = 31088

        XCTAssertEqual(numberOfVersesInTheOldTestament, expectedNumberOfVersesInTheOldTestament)
    }

    func testRightNumberOfChaptersInEachBook() {
        XCTAssertEqual(BibleBook.Genesis.numberOfChapters(), 50)
        XCTAssertEqual(BibleBook.Exodus.numberOfChapters(), 40)
        XCTAssertEqual(BibleBook.Leviticus.numberOfChapters(), 27)
        XCTAssertEqual(BibleBook.Numbers.numberOfChapters(), 36)
        XCTAssertEqual(BibleBook.Deuteronomy.numberOfChapters(), 34)
        XCTAssertEqual(BibleBook.Joshua.numberOfChapters(), 24)
        XCTAssertEqual(BibleBook.Judges.numberOfChapters(), 21)
        XCTAssertEqual(BibleBook.Ruth.numberOfChapters(), 4)
        XCTAssertEqual(BibleBook.First_Samuel.numberOfChapters(), 31)
        XCTAssertEqual(BibleBook.Second_Samuel.numberOfChapters(), 24)
        XCTAssertEqual(BibleBook.First_Kings.numberOfChapters(), 22)
        XCTAssertEqual(BibleBook.Second_Kings.numberOfChapters(), 25)
        XCTAssertEqual(BibleBook.First_Chronicles.numberOfChapters(), 29)
        XCTAssertEqual(BibleBook.Second_Chronicles.numberOfChapters(), 36)
        XCTAssertEqual(BibleBook.Ezra.numberOfChapters(), 10)
        XCTAssertEqual(BibleBook.Nehemiah.numberOfChapters(), 13)
        XCTAssertEqual(BibleBook.Esther.numberOfChapters(), 10)
        XCTAssertEqual(BibleBook.Job.numberOfChapters(), 42)
        XCTAssertEqual(BibleBook.Psalms.numberOfChapters(), 150)
        XCTAssertEqual(BibleBook.Proverbs.numberOfChapters(), 31)
        XCTAssertEqual(BibleBook.Ecclesiastes.numberOfChapters(), 12)
        XCTAssertEqual(BibleBook.Song_of_Solomon.numberOfChapters(), 8)
        XCTAssertEqual(BibleBook.Isaiah.numberOfChapters(), 66)
        XCTAssertEqual(BibleBook.Jeremiah.numberOfChapters(), 52)
        XCTAssertEqual(BibleBook.Lamentations.numberOfChapters(), 5)
        XCTAssertEqual(BibleBook.Ezekiel.numberOfChapters(), 48)
        XCTAssertEqual(BibleBook.Daniel.numberOfChapters(), 12)
        XCTAssertEqual(BibleBook.Hosea.numberOfChapters(), 14)
        XCTAssertEqual(BibleBook.Joel.numberOfChapters(), 3)
        XCTAssertEqual(BibleBook.Amos.numberOfChapters(), 9)
        XCTAssertEqual(BibleBook.Obadiah.numberOfChapters(), 1)
        XCTAssertEqual(BibleBook.Jonah.numberOfChapters(), 4)
        XCTAssertEqual(BibleBook.Micah.numberOfChapters(), 7)
        XCTAssertEqual(BibleBook.Nahum.numberOfChapters(), 3)
        XCTAssertEqual(BibleBook.Habakkuk.numberOfChapters(), 3)
        XCTAssertEqual(BibleBook.Zephaniah.numberOfChapters(), 3)
        XCTAssertEqual(BibleBook.Haggai.numberOfChapters(), 2)
        XCTAssertEqual(BibleBook.Zechariah.numberOfChapters(), 14)
        XCTAssertEqual(BibleBook.Malachi.numberOfChapters(), 4)

        XCTAssertEqual(BibleBook.Matthew.numberOfChapters(), 28)
        XCTAssertEqual(BibleBook.Mark.numberOfChapters(), 16)
        XCTAssertEqual(BibleBook.Luke.numberOfChapters(), 24)
        XCTAssertEqual(BibleBook.John.numberOfChapters(), 21)

        XCTAssertEqual(BibleBook.Acts.numberOfChapters(), 28)
        XCTAssertEqual(BibleBook.Romans.numberOfChapters(), 16)
        XCTAssertEqual(BibleBook.Mark.numberOfChapters(), 16)
        XCTAssertEqual(BibleBook.First_Corinthians.numberOfChapters(), 16)
        XCTAssertEqual(BibleBook.Second_Corinthians.numberOfChapters(), 13)
        XCTAssertEqual(BibleBook.Galatians.numberOfChapters(), 6)
        XCTAssertEqual(BibleBook.Ephesians.numberOfChapters(), 6)
        XCTAssertEqual(BibleBook.Philippians.numberOfChapters(), 4)
        XCTAssertEqual(BibleBook.Colossians.numberOfChapters(), 4)
        XCTAssertEqual(BibleBook.First_Thessalonians.numberOfChapters(), 5)
        XCTAssertEqual(BibleBook.Second_Thessalonians.numberOfChapters(), 3)
        XCTAssertEqual(BibleBook.First_Timothy.numberOfChapters(), 6)
        XCTAssertEqual(BibleBook.Second_Timothy.numberOfChapters(), 4)
        XCTAssertEqual(BibleBook.Titus.numberOfChapters(), 3)
        XCTAssertEqual(BibleBook.Philemon.numberOfChapters(), 1)
        XCTAssertEqual(BibleBook.Hebrews.numberOfChapters(), 13)
        XCTAssertEqual(BibleBook.James.numberOfChapters(), 5)
        XCTAssertEqual(BibleBook.First_Peter.numberOfChapters(), 5)
        XCTAssertEqual(BibleBook.Second_Peter.numberOfChapters(), 3)
        XCTAssertEqual(BibleBook.First_John.numberOfChapters(), 5)
        XCTAssertEqual(BibleBook.Second_John.numberOfChapters(), 1)
        XCTAssertEqual(BibleBook.Third_John.numberOfChapters(), 1)
        XCTAssertEqual(BibleBook.Jude.numberOfChapters(), 1)
        XCTAssertEqual(BibleBook.Revelation.numberOfChapters(), 22)
    }

    func testRightNumberOfVersesInEachBook() {
        XCTAssertEqual(BibleBook.Genesis.numberOfVerses(), 1533)
        XCTAssertEqual(BibleBook.Exodus.numberOfVerses(), 1213)
        XCTAssertEqual(BibleBook.Leviticus.numberOfVerses(), 859)
        XCTAssertEqual(BibleBook.Numbers.numberOfVerses(), 1288)
        XCTAssertEqual(BibleBook.Deuteronomy.numberOfVerses(), 959)
        XCTAssertEqual(BibleBook.Joshua.numberOfVerses(), 658)
        XCTAssertEqual(BibleBook.Judges.numberOfVerses(), 618)
        XCTAssertEqual(BibleBook.Ruth.numberOfVerses(), 85)
        XCTAssertEqual(BibleBook.First_Samuel.numberOfVerses(), 810)
        XCTAssertEqual(BibleBook.Second_Samuel.numberOfVerses(), 695)
        XCTAssertEqual(BibleBook.First_Kings.numberOfVerses(), 816)
        XCTAssertEqual(BibleBook.Second_Kings.numberOfVerses(), 719)
        XCTAssertEqual(BibleBook.First_Chronicles.numberOfVerses(), 942)
        XCTAssertEqual(BibleBook.Second_Chronicles.numberOfVerses(), 822)
        XCTAssertEqual(BibleBook.Ezra.numberOfVerses(), 280)
        XCTAssertEqual(BibleBook.Nehemiah.numberOfVerses(), 406)
        XCTAssertEqual(BibleBook.Esther.numberOfVerses(), 167)
        XCTAssertEqual(BibleBook.Job.numberOfVerses(), 1070)
        XCTAssertEqual(BibleBook.Psalms.numberOfVerses(), 2461)
        XCTAssertEqual(BibleBook.Proverbs.numberOfVerses(), 915)
        XCTAssertEqual(BibleBook.Ecclesiastes.numberOfVerses(), 222)
        XCTAssertEqual(BibleBook.Song_of_Solomon.numberOfVerses(), 117)
        XCTAssertEqual(BibleBook.Isaiah.numberOfVerses(), 1292)
        XCTAssertEqual(BibleBook.Jeremiah.numberOfVerses(), 1364)
        XCTAssertEqual(BibleBook.Lamentations.numberOfVerses(), 154)
        XCTAssertEqual(BibleBook.Ezekiel.numberOfVerses(), 1273)
        XCTAssertEqual(BibleBook.Daniel.numberOfVerses(), 357)
        XCTAssertEqual(BibleBook.Hosea.numberOfVerses(), 197)
        XCTAssertEqual(BibleBook.Joel.numberOfVerses(), 73)
        XCTAssertEqual(BibleBook.Amos.numberOfVerses(), 146)
        XCTAssertEqual(BibleBook.Obadiah.numberOfVerses(), 21)
        XCTAssertEqual(BibleBook.Jonah.numberOfVerses(), 48)
        XCTAssertEqual(BibleBook.Micah.numberOfVerses(), 105)
        XCTAssertEqual(BibleBook.Nahum.numberOfVerses(), 47)
        XCTAssertEqual(BibleBook.Habakkuk.numberOfVerses(), 56)
        XCTAssertEqual(BibleBook.Zephaniah.numberOfVerses(), 53)
        XCTAssertEqual(BibleBook.Haggai.numberOfVerses(), 38)
        XCTAssertEqual(BibleBook.Zechariah.numberOfVerses(), 211)
        XCTAssertEqual(BibleBook.Malachi.numberOfVerses(), 55)
    }

    func testCanGetMalachi4v24FromAbsoluteVerseNumber() {
        let absoluteVerseNumber: AbsoluteVerseNumber = 23145

        let reference = BibleBook.reference(withAbsoluteVerseNumber: absoluteVerseNumber)

        XCTAssertEqual(reference?.book, BibleBook.Malachi)
        XCTAssertEqual(reference?.chapterNumber, 4)
        XCTAssertEqual(reference?.verseNumber, 6)
    }

    func testCanGetRevelation22v21FromAbsoluteVerseNumber() {
        let absoluteVerseNumber: AbsoluteVerseNumber = 31088

        let reference = BibleBook.reference(withAbsoluteVerseNumber: absoluteVerseNumber)

        XCTAssertEqual(reference?.book, BibleBook.Revelation)
        XCTAssertEqual(reference?.chapterNumber, 22)
        XCTAssertEqual(reference?.verseNumber, 21)
    }

    func testCanGetNameForBook() {
        let expectedBookName = "Genesis"

        XCTAssertEqual(BibleBook.Genesis.name(), expectedBookName)
    }

    func testCanGetBookWithName() {
        XCTAssertEqual(BibleBook.findBook(withName: "Genesis"), BibleBook.Genesis)
    }

    func testCanGetNilWhenNameIsGarbage() {
        XCTAssertNil(BibleBook.findBook(withName: "Thomas"))
    }

    func testCanGetBooksWithShortenedName() {
        XCTAssertEqual(BibleBook.getBook(whereNameStartsWith: "Ge"), BibleBook.Genesis)
    }

    func testGetsNilWhenUsingAmbiguousPrefix() {
        XCTAssertNil(BibleBook.getBook(whereNameStartsWith: "G"))
    }

    func testCanGetNumberOfVersesInPassage() {
        let expectedPassageLengthInVerses = 5
        let start = BibleReference(withBook:.Genesis, chapter:1, andVerse:1)!
        let end = BibleReference(withBook:.Genesis, chapter:1, andVerse:5)!
        let passage = BiblePassage(start: start, end: end)

        let passageLengthInVerses = passage.numberOfVerses()

        XCTAssertEqual(passageLengthInVerses, expectedPassageLengthInVerses)
    }

}
