//
//  BiblePassageFormatterTests.swift
//  BibleMetaData
//
//  Created by Tom Duckering on 20/01/2017.
//  Copyright © 2017 Tom Duckering. All rights reserved.
//

import XCTest
@testable import BibleMetrics

class BiblePassageFormatterTests: XCTestCase {

    func testCanGenerateStringFromBibleReference() {

        let expectedString = "Genesis 1:4"
        let reference = BibleReference(withBook: .Genesis, chapter:1, andVerse: 4)

        let string = reference?.formatAsString()

        XCTAssertEqual(string, expectedString)
    }

    func testCanCreateBiblePassageFromBibleReferences() {
        let start = BibleReference(withBook:.Genesis)!
        let end = BibleReference(withBook: .Revelation, chapter:22, andVerse:21)!

        let passage = BiblePassage(start: start, end: end)

        XCTAssertNotNil(passage)
    }

    func testCanGenerateStringFromBiblePassage() {
        let expectedString = "Genesis 1:4-5"

        let start = BibleReference(withBook:.Genesis, chapter:1, andVerse:4)!
        let end = BibleReference(withBook:.Genesis, chapter:1, andVerse:5)!
        let passage = BiblePassage(start: start, end: end)

        let formatter = BasicBiblePassageStringFormatter()

        let passageString = formatter.string(from: passage)

        XCTAssertEqual(passageString, expectedString)
    }

    func testCanGenerateStringFromChapterSpanningBiblePassage() {
        let expectedString = "Genesis 1:4-2:5"

        let start = BibleReference(withBook:.Genesis, chapter:1, andVerse:4)!
        let end = BibleReference(withBook:.Genesis, chapter:2, andVerse:5)!
        let passage = BiblePassage(start: start, end: end)

        let formatter = BasicBiblePassageStringFormatter()

        let passageString = formatter.string(from: passage)

        XCTAssertEqual(passageString, expectedString)
    }

    func testCanGenerateStringFromBookSpanningBiblePassage() {
        let expectedString = "Genesis 1:4-Exodus 2:5"

        let start = BibleReference(withBook:.Genesis, chapter:1, andVerse:4)!
        let end = BibleReference(withBook:.Exodus, chapter:2, andVerse:5)!
        let passage = BiblePassage(start: start, end: end)

        let formatter = BasicBiblePassageStringFormatter()

        let passageString = formatter.string(from: passage)

        XCTAssertEqual(passageString, expectedString)
    }

    func testCanGenerateStringFromWholeBiblePassage() {
        let expectedString = "Genesis 1:1-Revelation 22:21"

        let start = BibleReference(withBook:.Genesis)!
        let end = BibleReference(withBook:.Revelation, chapter:22, andVerse:21)!
        let passage = BiblePassage(start: start, end: end)

        let formatter = BasicBiblePassageStringFormatter()

        let passageString = formatter.string(from: passage)

        XCTAssertEqual(passageString, expectedString)
    }

    func testCanGenerateStringFromWholeChapterPassage() {
        let expectedString = "Genesis 1"

        let start = BibleReference(withBook:.Genesis)!
        let end = BibleReference(withBook:.Genesis, chapter:1, andVerse:31)!
        let passage = BiblePassage(start: start, end: end)

        let formatter = BasicBiblePassageStringFormatter()

        let passageString = formatter.string(from: passage)

        XCTAssertEqual(passageString, expectedString)
    }

    func testCanGenerateStringFromWholeBookPassage() {
        let expectedString = "Genesis"

        let start = BibleReference(withBook:.Genesis)!
        let end = BibleReference(withBook:.Genesis, chapter:50, andVerse:26)!
        let passage = BiblePassage(start: start, end: end)

        let formatter = BasicBiblePassageStringFormatter()

        let passageString = formatter.string(from: passage)

        XCTAssertEqual(passageString, expectedString)
    }

}
