//
//  BiblePassageTests.swift
//  BibleMetrics
//
//  Created by Tom Duckering on 30/01/2017.
//  Copyright © 2017 Tom Duckering. All rights reserved.
//

import XCTest
@testable import BibleMetrics

class BiblePassageTests: XCTestCase {

    func testCanParseFullBookPassageFromString() {

        let inputString = "Genesis"

        guard let passage = BiblePassage(from: inputString)
            else {
                XCTFail("Bible passage was not initialised from a string")
                return
        }

        XCTAssertEqual(passage.start.book, BibleBook.Genesis)
        XCTAssertEqual(passage.start.book, BibleBook.Genesis)

        XCTAssertEqual(passage.start.chapterNumber, 1)
        XCTAssertEqual(passage.start.verseNumber, 1)

        XCTAssertEqual(passage.end.chapterNumber, 50)
        XCTAssertEqual(passage.end.verseNumber, 26)
    }

    func testCanParseFullChapterPassageFromString() {

        let inputString = "Genesis 1"

        guard let passage = BiblePassage(from: inputString)
            else {
                XCTFail("Bible passage was not initialised from a string")
                return
        }

        XCTAssertEqual(passage.start.book, BibleBook.Genesis)
        XCTAssertEqual(passage.start.book, BibleBook.Genesis)

        XCTAssertEqual(passage.start.chapterNumber, 1)
        XCTAssertEqual(passage.start.verseNumber, 1)

        XCTAssertEqual(passage.end.chapterNumber, 1)
        XCTAssertEqual(passage.end.verseNumber, 31)
    }

    func testCanParseSingleVersePassageFromString() {

        let inputString = "Genesis 1:14"

        guard let passage = BiblePassage(from: inputString)
            else {
                XCTFail("Bible passage was not initialised from a string")
                return
        }

        XCTAssertEqual(passage.start.book, BibleBook.Genesis)
        XCTAssertEqual(passage.start.book, BibleBook.Genesis)

        XCTAssertEqual(passage.start.chapterNumber, 1)
        XCTAssertEqual(passage.start.verseNumber, 14)

        XCTAssertEqual(passage.end.chapterNumber, 1)
        XCTAssertEqual(passage.end.verseNumber, 14)
    }

    func testCanParseBasicPassageFromString() {

        let inputString = "Genesis 1:14-25"

        guard let passage = BiblePassage(from: inputString)
            else {
                XCTFail("Bible passage was not initialised from a string")
                return
        }

        XCTAssertEqual(passage.start.book, BibleBook.Genesis)
        XCTAssertEqual(passage.start.book, BibleBook.Genesis)

        XCTAssertEqual(passage.start.chapterNumber, 1)
        XCTAssertEqual(passage.start.verseNumber, 14)

        XCTAssertEqual(passage.end.chapterNumber, 1)
        XCTAssertEqual(passage.end.verseNumber, 25)
    }

    func testCanParseBasicChapterSpanningPassageFromString() {

        let inputString = "Genesis 1:14-2:3"

        guard let passage = BiblePassage(from: inputString)
            else {
                XCTFail("Bible passage was not initialised from a string")
                return
        }

        XCTAssertEqual(passage.start.book, BibleBook.Genesis)
        XCTAssertEqual(passage.start.book, BibleBook.Genesis)

        XCTAssertEqual(passage.start.chapterNumber, 1)
        XCTAssertEqual(passage.start.verseNumber, 14)

        XCTAssertEqual(passage.end.chapterNumber, 2)
        XCTAssertEqual(passage.end.verseNumber, 3)
    }
    
}
