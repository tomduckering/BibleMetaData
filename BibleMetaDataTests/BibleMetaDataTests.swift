//
//  BibleMetaDataTests.swift
//  BibleMetaData
//
//  Created by Tom Duckering on 08/01/2017.
//  Copyright © 2017 Tom Duckering. All rights reserved.
//

import XCTest
@testable import BibleMetaData

class BibleMetaDataTests: XCTestCase {
    
    func testCanCreateBibleReference() {
        let matthew_one_one = BibleReference(withBook: .Matthew, chapter: 1, andVerse: 1)!
        
        XCTAssertEqual(matthew_one_one.book,Bible.Matthew)
        XCTAssertEqual(matthew_one_one.chapterNumber,1)
        XCTAssertEqual(matthew_one_one.verseNumber, 1)
    }
    
    func testCanCreateBibleReferenceWithNoVerse() {
        let matt_chapter_one = BibleReference(withBook: .Matthew, chapter:1)!
        
        XCTAssertEqual(matt_chapter_one.book,Bible.Matthew)
        XCTAssertEqual(matt_chapter_one.chapterNumber,1)
        XCTAssertEqual(matt_chapter_one.verseNumber, 1)
    }
    
    func testCanCreateBibleReferenceWithNoChapterOrVerse() {
        let matt_chapter_one = BibleReference(withBook: .Matthew)!
        
        XCTAssertEqual(matt_chapter_one.book,Bible.Matthew)
        XCTAssertEqual(matt_chapter_one.chapterNumber,1)
        XCTAssertEqual(matt_chapter_one.verseNumber, 1)
    }
    
    func testCanNotCreateInvalidBibleReferenceChapters() {
        let revelation_chapter_23 = BibleReference(withBook: .Revelation, chapter: 23)
        
        XCTAssertNil(revelation_chapter_23)
    }
    
    func testCanNotCreateInvalidBibleReferenceVerses() {
        let revelation_chapter_22_22 = BibleReference(withBook: .Revelation, chapter: 22, andVerse: 22)
        
        XCTAssertNil(revelation_chapter_22_22)
    }
    
    func testCanListAllBooksOfTheBible() {
        let books: [Bible] = Bible.allBooks()
        XCTAssertEqual(books.count,66)
    }
    
    func testCanListAllNewTestamentBooksOfTheBible() {
        let newTestamentbooks: [Bible] = Bible.newTestamentBooks()
        
        XCTAssertEqual(newTestamentbooks.count, 27)
    }
    
    func testCanGetBooksBeforeAGivenBook() {
        let expectedBooksBeforeDeut: [Bible] = [.Genesis, .Exodus,.Leviticus,.Numbers]
        
        let booksBeforeDeut = Bible.Deuteronomy.booksBefore()
        
        XCTAssertEqual(booksBeforeDeut, expectedBooksBeforeDeut)
    }
    
    func testCanGetNumberOfPriorVerses() {
        let expectedNumberOfVersesInGenesisAndExodus = 1533 + 1213
        
        let numberOfVersesBeforeLeviticus = Bible.Leviticus.versesPriorTo()
        
        XCTAssertEqual(numberOfVersesBeforeLeviticus, expectedNumberOfVersesInGenesisAndExodus)
    }
    
    func testCanGetNumberOfPriorVersesInABook() {
        let expectNumberOfVersesInFirst9ChaptersOfGenesis = 31  + 25  + 24  + 26  + 32  + 22  + 24  + 22  + 29
        
        let numberOfVersesPriorToChapter10OfGenesis = Bible.Genesis.numberOfVerses(beforeChapter: 10)
        
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
        
        XCTAssertEqual(startOfBible.book, Bible.Genesis)
        XCTAssertEqual(startOfBible.chapterNumber, 1)
        XCTAssertEqual(startOfBible.verseNumber, 1)
    }
    
    func testCanGiveMeTheEndOfTheBible() {
        let endOfBible = BibleReference.endOfBible()
        
        XCTAssertEqual(endOfBible.book, Bible.Revelation)
        XCTAssertEqual(endOfBible.chapterNumber, 22)
        XCTAssertEqual(endOfBible.verseNumber, 21)
    }
    
    func testCanGetNextBookOfTheBible() {
        let genesis = Bible.Genesis
        let expectedNextBook = Bible.Exodus
        
        XCTAssertEqual(genesis.nextBook(), expectedNextBook)
    }
    
    func testCanGetNextBookOfTheBibleWhenThereIsNoNextBook() {
        let revelation = Bible.Revelation
        
        XCTAssertNil(revelation.nextBook())
    }
    
    func testCanGetPreviousBookOfTheBible() {
        let revelation = Bible.Revelation
        let expectedPreviousBook = Bible.Jude
        
        XCTAssertEqual(revelation.previousBook(), expectedPreviousBook)
    }
    
    func testCanGetPreviousBookOfTheBibleWhenThereIsNoPreviousBook() {
        let genesis = Bible.Genesis
        
        XCTAssertNil(genesis.previousBook())
    }
    
    func testCanGetGenesis1v1FromAbsoluteVerseNumber() {
        let absoluteVerseNumber:AbsoluteVerseNumber = 1
        
        let reference = Bible.reference(withAbsoluteVerseNumber: absoluteVerseNumber)
        
        XCTAssertEqual(reference?.book, Bible.Genesis)
        XCTAssertEqual(reference?.chapterNumber,1)
        XCTAssertEqual(reference?.verseNumber, 1)
    }
    
    func testCanGetGenesis2v1FromAbsoluteVerseNumber() {
        let absoluteVerseNumber:AbsoluteVerseNumber = 32
        
        let reference = Bible.reference(withAbsoluteVerseNumber: absoluteVerseNumber)
        
        XCTAssertEqual(reference?.book, Bible.Genesis)
        XCTAssertEqual(reference?.chapterNumber,2)
        XCTAssertEqual(reference?.verseNumber, 1)
    }
    
    func testCanGetGenesis50v26FromAbsoluteVerseNumber() {
        let absoluteVerseNumber:AbsoluteVerseNumber = 1533
        
        let reference = Bible.reference(withAbsoluteVerseNumber: absoluteVerseNumber)
        
        XCTAssertEqual(reference?.book, Bible.Genesis)
        XCTAssertEqual(reference?.chapterNumber,50)
        XCTAssertEqual(reference?.verseNumber, 26)
    }
    
    func testThatEstherIsSeventeenthBookOfBible() {
        XCTAssertEqual(Bible.allBooks()[16], Bible.Esther)
        XCTAssertEqual(Bible.allBooks()[21], Bible.Song_of_Solomon)
        XCTAssertEqual(Bible.allBooks()[26], Bible.Daniel)
        XCTAssertEqual(Bible.allBooks()[38], Bible.Malachi)
    }
    
    func testThatEstherHasTenChapters() {
        XCTAssertEqual(Bible.Esther.numberOfChapters(), 10)
    }
    
    func testThatDanielHasTwelveChapters() {
        XCTAssertEqual(Bible.Daniel.numberOfChapters(), 12)
    }
    
    func testThatTheRightNumberOfChaptersInTheBible() {
        let numberOfChaptersInTheBible = Bible.allBooks().map {book in book.numberOfChapters()}.reduce(0,+)
        
        let expectedNumberOfChaptersInTheBible = 1189
        
        XCTAssertEqual(numberOfChaptersInTheBible, expectedNumberOfChaptersInTheBible)
    }
    
    func testThatTheRightNumberOfVersesInTheOldTestament() {
        let numberOfVersesInTheOldTestament = Bible.oldTestamentBooks().map { book in book.numberOfVerses()}.reduce(0,+)
        let expectedNumberOfVersesInTheOldTestament = 23145
        
        XCTAssertEqual(numberOfVersesInTheOldTestament, expectedNumberOfVersesInTheOldTestament)
    }
    
    func testThatTheRightNumberOfVersesInTheBible() {
        let numberOfVersesInTheOldTestament = Bible.allBooks().map { book in book.numberOfVerses()}.reduce(0,+)
        let expectedNumberOfVersesInTheOldTestament = 31088
        
        XCTAssertEqual(numberOfVersesInTheOldTestament, expectedNumberOfVersesInTheOldTestament)
    }
    
    func testRightNumberOfChaptersInEachBook() {
        XCTAssertEqual(Bible.Genesis.numberOfChapters(), 50)
        XCTAssertEqual(Bible.Exodus.numberOfChapters(), 40)
        XCTAssertEqual(Bible.Leviticus.numberOfChapters(), 27)
        XCTAssertEqual(Bible.Numbers.numberOfChapters(), 36)
        XCTAssertEqual(Bible.Deuteronomy.numberOfChapters(), 34)
        XCTAssertEqual(Bible.Joshua.numberOfChapters(), 24)
        XCTAssertEqual(Bible.Judges.numberOfChapters(), 21)
        XCTAssertEqual(Bible.Ruth.numberOfChapters(), 4)
        XCTAssertEqual(Bible.First_Samuel.numberOfChapters(), 31)
        XCTAssertEqual(Bible.Second_Samuel.numberOfChapters(), 24)
        XCTAssertEqual(Bible.First_Kings.numberOfChapters(), 22)
        XCTAssertEqual(Bible.Second_Kings.numberOfChapters(), 25)
        XCTAssertEqual(Bible.First_Chronicles.numberOfChapters(), 29)
        XCTAssertEqual(Bible.Second_Chronicles.numberOfChapters(), 36)
        XCTAssertEqual(Bible.Ezra.numberOfChapters(), 10)
        XCTAssertEqual(Bible.Nehemiah.numberOfChapters(), 13)
        XCTAssertEqual(Bible.Esther.numberOfChapters(), 10)
        XCTAssertEqual(Bible.Job.numberOfChapters(), 42)
        XCTAssertEqual(Bible.Psalms.numberOfChapters(), 150)
        XCTAssertEqual(Bible.Proverbs.numberOfChapters(), 31)
        XCTAssertEqual(Bible.Ecclesiastes.numberOfChapters(), 12)
        XCTAssertEqual(Bible.Song_of_Solomon.numberOfChapters(), 8)
        XCTAssertEqual(Bible.Isaiah.numberOfChapters(), 66)
        XCTAssertEqual(Bible.Jeremiah.numberOfChapters(), 52)
        XCTAssertEqual(Bible.Lamentations.numberOfChapters(), 5)
        XCTAssertEqual(Bible.Ezekiel.numberOfChapters(), 48)
        XCTAssertEqual(Bible.Daniel.numberOfChapters(), 12)
        XCTAssertEqual(Bible.Hosea.numberOfChapters(), 14)
        XCTAssertEqual(Bible.Joel.numberOfChapters(), 3)
        XCTAssertEqual(Bible.Amos.numberOfChapters(), 9)
        XCTAssertEqual(Bible.Obadiah.numberOfChapters(), 1)
        XCTAssertEqual(Bible.Jonah.numberOfChapters(), 4)
        XCTAssertEqual(Bible.Micah.numberOfChapters(), 7)
        XCTAssertEqual(Bible.Nahum.numberOfChapters(), 3)
        XCTAssertEqual(Bible.Habakkuk.numberOfChapters(), 3)
        XCTAssertEqual(Bible.Zephaniah.numberOfChapters(), 3)
        XCTAssertEqual(Bible.Haggai.numberOfChapters(), 2)
        XCTAssertEqual(Bible.Zechariah.numberOfChapters(), 14)
        XCTAssertEqual(Bible.Malachi.numberOfChapters(), 4)
        
        XCTAssertEqual(Bible.Matthew.numberOfChapters(), 28)
        XCTAssertEqual(Bible.Mark.numberOfChapters(), 16)
        XCTAssertEqual(Bible.Luke.numberOfChapters(), 24)
        XCTAssertEqual(Bible.John.numberOfChapters(), 21)
        
        XCTAssertEqual(Bible.Acts.numberOfChapters(), 28)
        XCTAssertEqual(Bible.Romans.numberOfChapters(), 16)
        XCTAssertEqual(Bible.Mark.numberOfChapters(), 16)
        XCTAssertEqual(Bible.First_Corinthians.numberOfChapters(), 16)
        XCTAssertEqual(Bible.Second_Corinthians.numberOfChapters(), 13)
        XCTAssertEqual(Bible.Galatians.numberOfChapters(), 6)
        XCTAssertEqual(Bible.Ephesians.numberOfChapters(), 6)
        XCTAssertEqual(Bible.Philippians.numberOfChapters(), 4)
        XCTAssertEqual(Bible.Colossians.numberOfChapters(), 4)
        XCTAssertEqual(Bible.First_Thessalonians.numberOfChapters(), 5)
        XCTAssertEqual(Bible.Second_Thessalonians.numberOfChapters(), 3)
        XCTAssertEqual(Bible.First_Timothy.numberOfChapters(), 6)
        XCTAssertEqual(Bible.Second_Timothy.numberOfChapters(), 4)
        XCTAssertEqual(Bible.Titus.numberOfChapters(), 3)
        XCTAssertEqual(Bible.Philemon.numberOfChapters(), 1)
        XCTAssertEqual(Bible.Hebrews.numberOfChapters(), 13)
        XCTAssertEqual(Bible.James.numberOfChapters(), 5)
        XCTAssertEqual(Bible.First_Peter.numberOfChapters(), 5)
        XCTAssertEqual(Bible.Second_Peter.numberOfChapters(), 3)
        XCTAssertEqual(Bible.First_John.numberOfChapters(), 5)
        XCTAssertEqual(Bible.Second_John.numberOfChapters(), 1)
        XCTAssertEqual(Bible.Third_John.numberOfChapters(), 1)
        XCTAssertEqual(Bible.Jude.numberOfChapters(), 1)
        XCTAssertEqual(Bible.Revelation.numberOfChapters(), 22)
    }
    
    func testRightNumberOfVersesInEachBook() {
        XCTAssertEqual(Bible.Genesis.numberOfVerses(), 1533)
        XCTAssertEqual(Bible.Exodus.numberOfVerses(), 1213)
        XCTAssertEqual(Bible.Leviticus.numberOfVerses(), 859)
        XCTAssertEqual(Bible.Numbers.numberOfVerses(), 1288)
        XCTAssertEqual(Bible.Deuteronomy.numberOfVerses(), 959)
        XCTAssertEqual(Bible.Joshua.numberOfVerses(), 658)
        XCTAssertEqual(Bible.Judges.numberOfVerses(), 618)
        XCTAssertEqual(Bible.Ruth.numberOfVerses(), 85)
        XCTAssertEqual(Bible.First_Samuel.numberOfVerses(), 810)
        XCTAssertEqual(Bible.Second_Samuel.numberOfVerses(), 695)
        XCTAssertEqual(Bible.First_Kings.numberOfVerses(), 816)
        XCTAssertEqual(Bible.Second_Kings.numberOfVerses(), 719)
        XCTAssertEqual(Bible.First_Chronicles.numberOfVerses(), 942)
        XCTAssertEqual(Bible.Second_Chronicles.numberOfVerses(), 822)
        XCTAssertEqual(Bible.Ezra.numberOfVerses(), 280)
        XCTAssertEqual(Bible.Nehemiah.numberOfVerses(), 406)
        XCTAssertEqual(Bible.Esther.numberOfVerses(), 167)
        XCTAssertEqual(Bible.Job.numberOfVerses(), 1070)
        XCTAssertEqual(Bible.Psalms.numberOfVerses(), 2461)
        XCTAssertEqual(Bible.Proverbs.numberOfVerses(), 915)
        XCTAssertEqual(Bible.Ecclesiastes.numberOfVerses(), 222)
        XCTAssertEqual(Bible.Song_of_Solomon.numberOfVerses(), 117)
        XCTAssertEqual(Bible.Isaiah.numberOfVerses(), 1292)
        XCTAssertEqual(Bible.Jeremiah.numberOfVerses(), 1364)
        XCTAssertEqual(Bible.Lamentations.numberOfVerses(), 154)
        XCTAssertEqual(Bible.Ezekiel.numberOfVerses(), 1273)
        XCTAssertEqual(Bible.Daniel.numberOfVerses(), 357)
        XCTAssertEqual(Bible.Hosea.numberOfVerses(), 197)
        XCTAssertEqual(Bible.Joel.numberOfVerses(), 73)
        XCTAssertEqual(Bible.Amos.numberOfVerses(), 146)
        XCTAssertEqual(Bible.Obadiah.numberOfVerses(), 21)
        XCTAssertEqual(Bible.Jonah.numberOfVerses(), 48)
        XCTAssertEqual(Bible.Micah.numberOfVerses(), 105)
        XCTAssertEqual(Bible.Nahum.numberOfVerses(), 47)
        XCTAssertEqual(Bible.Habakkuk.numberOfVerses(), 56)
        XCTAssertEqual(Bible.Zephaniah.numberOfVerses(), 53)
        XCTAssertEqual(Bible.Haggai.numberOfVerses(), 38)
        XCTAssertEqual(Bible.Zechariah.numberOfVerses(), 211)
        XCTAssertEqual(Bible.Malachi.numberOfVerses(), 55)
    }
    
    
    func testCanGetMalachi4v24FromAbsoluteVerseNumber() {
        let absoluteVerseNumber:AbsoluteVerseNumber = 23145
        
        let reference = Bible.reference(withAbsoluteVerseNumber: absoluteVerseNumber)
        
        XCTAssertEqual(reference?.book, Bible.Malachi)
        XCTAssertEqual(reference?.chapterNumber,4)
        XCTAssertEqual(reference?.verseNumber, 6)
    }
    
    func testCanGetRevelation22v21FromAbsoluteVerseNumber() {
        let absoluteVerseNumber:AbsoluteVerseNumber = 31088
        
        let reference = Bible.reference(withAbsoluteVerseNumber: absoluteVerseNumber)
        
        XCTAssertEqual(reference?.book, Bible.Revelation)
        XCTAssertEqual(reference?.chapterNumber,22)
        XCTAssertEqual(reference?.verseNumber, 21)
    }
    
    func testCanGetNameForBook() {
        let expectedBookName = "Genesis"
        
        XCTAssertEqual(Bible.Genesis.name(), expectedBookName)
    }
    
    func testCanGenerateStringFromBibleReference() {
        
        let expectedString = "Genesis 1:4"
        let reference = BibleReference(withBook: .Genesis,chapter:1,andVerse: 4)
        
        let string = reference?.formatAsString()
        
        XCTAssertEqual(string, expectedString)
    }
    
    
    
    func testCanCreateBiblePassageFromBibleReferences() {
        let start = BibleReference(withBook:.Genesis)!
        let end = BibleReference(withBook: .Revelation,chapter:22, andVerse:21)!
        
        let passage = BiblePassage(start: start,end: end)
        
        XCTAssertNotNil(passage)
    }
    
    func testCanGenerateStringFromBiblePassage() {
        let expectedString = "Genesis 1:4-5"
        
        let start = BibleReference(withBook:.Genesis,chapter:1, andVerse:4)!
        let end = BibleReference(withBook:.Genesis,chapter:1, andVerse:5)!
        let passage = BiblePassage(start: start, end: end)
        
        let formatter = BasicBiblePassageStringFormatter()
        
        let passageString = formatter.string(from: passage)
        
        XCTAssertEqual(passageString, expectedString)
    }
    
    func testCanGenerateStringFromChapterSpanningBiblePassage() {
        let expectedString = "Genesis 1:4-2:5"
        
        let start = BibleReference(withBook:.Genesis,chapter:1, andVerse:4)!
        let end = BibleReference(withBook:.Genesis,chapter:2, andVerse:5)!
        let passage = BiblePassage(start: start, end: end)
        
        let formatter = BasicBiblePassageStringFormatter()
        
        let passageString = formatter.string(from: passage)
        
        XCTAssertEqual(passageString, expectedString)
    }
    
    func testCanGenerateStringFromBookSpanningBiblePassage() {
        let expectedString = "Genesis 1:4-Exodus 2:5"
        
        let start = BibleReference(withBook:.Genesis,chapter:1, andVerse:4)!
        let end = BibleReference(withBook:.Exodus,chapter:2, andVerse:5)!
        let passage = BiblePassage(start: start, end: end)
        
        let formatter = BasicBiblePassageStringFormatter()
        
        let passageString = formatter.string(from: passage)
        
        XCTAssertEqual(passageString, expectedString)
    }
    
    func testCanGenerateStringFromWholeBiblePassage() {
        let expectedString = "Genesis 1:1-Revelation 22:21"
        
        let start = BibleReference(withBook:.Genesis)!
        let end = BibleReference(withBook:.Revelation,chapter:22, andVerse:21)!
        let passage = BiblePassage(start: start, end: end)
        
        let formatter = BasicBiblePassageStringFormatter()
        
        let passageString = formatter.string(from: passage)
        
        XCTAssertEqual(passageString, expectedString)
    }
    
    func testCanGenerateStringFromWholeChapterPassage() {
        let expectedString = "Genesis 1"
        
        let start = BibleReference(withBook:.Genesis)!
        let end = BibleReference(withBook:.Genesis,chapter:1, andVerse:31)!
        let passage = BiblePassage(start: start, end: end)
        
        let formatter = BasicBiblePassageStringFormatter()
        
        let passageString = formatter.string(from: passage)
        
        XCTAssertEqual(passageString, expectedString)
    }
    
    func testCanGenerateStringFromWholeBookPassage() {
        let expectedString = "Genesis"
        
        let start = BibleReference(withBook:.Genesis)!
        let end = BibleReference(withBook:.Genesis,chapter:50, andVerse:26)!
        let passage = BiblePassage(start: start, end: end)
        
        let formatter = BasicBiblePassageStringFormatter()
        
        let passageString = formatter.string(from: passage)
        
        XCTAssertEqual(passageString, expectedString)
    }
    
    func testCanGetBookWithName() {
        XCTAssertEqual(Bible.findBook(withName: "Genesis"), Bible.Genesis)
    }
    
    func testCanGetNilWhenNameIsGarbage() {
        XCTAssertNil(Bible.findBook(withName: "Thomas"))
    }
    
    func testCanGetBooksWithShortenedName() {
        XCTAssertEqual(Bible.getBook(whereNameStartsWith: "Ge"), Bible.Genesis)
    }
    
    func testGetsNilWhenUsingAmbiguousPrefix() {
        XCTAssertNil(Bible.getBook(whereNameStartsWith: "G"))
    }
    
    func testCanGetNumberOfVersesInPassage() {
        let expectedPassageLengthInVerses = 5
        let start = BibleReference(withBook:.Genesis,chapter:1, andVerse:1)!
        let end = BibleReference(withBook:.Genesis,chapter:1, andVerse:5)!
        let passage = BiblePassage(start: start, end: end)
        
        let passageLengthInVerses = passage.numberOfVerses()
        
        XCTAssertEqual(passageLengthInVerses, expectedPassageLengthInVerses)
    }
    
    func testCanCreateBibleReferenceFromBasicString() {
        let inputString = "Genesis 1:1"
        
        guard let parsedReference = BibleReference(fromString: inputString)
            else {
                XCTFail("unable to parse reference")
                return
        }
        
        XCTAssertEqual(parsedReference.book,Bible.Genesis)
        XCTAssertEqual(parsedReference.chapterNumber,1)
        XCTAssertEqual(parsedReference.verseNumber,1)
    }
    
    func testCanCreateBibleReferenceFromStringMissingVerse() {
        let inputString = "Genesis 1"
        
        guard let parsedReference = BibleReference(fromString: inputString)
            else {
                XCTFail("unable to parse reference")
                return
        }
        
        XCTAssertEqual(parsedReference.book,Bible.Genesis)
        XCTAssertEqual(parsedReference.chapterNumber,1)
        XCTAssertEqual(parsedReference.verseNumber,1)
    }
    
    
}
