//
//  BibleReferenceTests.swift
//  BibleMetaData
//
//  Created by Tom Duckering on 20/01/2017.
//  Copyright © 2017 Tom Duckering. All rights reserved.
//

import XCTest
@testable import BibleMetaData

class BibleReferenceTests: XCTestCase {
    
    func testCanCreateBibleReference() {
        let matthew_one_one = BibleReference(withBook: .Matthew, chapter: 1, andVerse: 1)!
        
        XCTAssertEqual(matthew_one_one.book,BibleBook.Matthew)
        XCTAssertEqual(matthew_one_one.chapterNumber,1)
        XCTAssertEqual(matthew_one_one.verseNumber, 1)
    }
    
    func testCanCreateBibleReferenceWithNoVerse() {
        let matt_chapter_one = BibleReference(withBook: .Matthew, chapter:1)!
        
        XCTAssertEqual(matt_chapter_one.book,BibleBook.Matthew)
        XCTAssertEqual(matt_chapter_one.chapterNumber,1)
        XCTAssertEqual(matt_chapter_one.verseNumber, 1)
    }
    
    func testCanCreateBibleReferenceWithNoChapterOrVerse() {
        let matt_chapter_one = BibleReference(withBook: .Matthew)!
        
        XCTAssertEqual(matt_chapter_one.book,BibleBook.Matthew)
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
    
    func testCanCreateBibleReferenceFromBasicString() {
        let inputString = "Genesis 1:1"
        
        guard let parsedReference = BibleReference(fromString: inputString)
            else {
                XCTFail("unable to parse reference")
                return
        }
        
        XCTAssertEqual(parsedReference.book,BibleBook.Genesis)
        XCTAssertEqual(parsedReference.chapterNumber,1)
        XCTAssertEqual(parsedReference.verseNumber,1)
    }
    
    func testCanCreateBibleReferenceFromBasicStringWithNonSingluarVerse() {
        let inputString = "Genesis 1:12"
        
        guard let parsedReference = BibleReference(fromString: inputString)
            else {
                XCTFail("unable to parse reference")
                return
        }
        
        XCTAssertEqual(parsedReference.book,BibleBook.Genesis)
        XCTAssertEqual(parsedReference.chapterNumber,1)
        XCTAssertEqual(parsedReference.verseNumber,12)
    }
    
    func testCanCreateBibleReferenceFromStringMissingVerse() {
        let inputString = "Genesis 1"
        
        guard let parsedReference = BibleReference(fromString: inputString)
            else {
                XCTFail("unable to parse reference")
                return
        }
        
        XCTAssertEqual(parsedReference.book,BibleBook.Genesis)
        XCTAssertEqual(parsedReference.chapterNumber,1)
        XCTAssertEqual(parsedReference.verseNumber,1)
    }


    func testCannotCreateBibleReferenceFromInvalidString() {
        let inputString = "garbage"
        XCTAssertNil(BibleReference(fromString: inputString))        
    }
    
    func testCannotCreateBibleReferenceFromNonsenseReference() {
        let inputString = "Revelation 25:34"
        XCTAssertNil(BibleReference(fromString: inputString))
    }
    
    func testCanCreateBibleRefererenceWithNumberedBook() {
        let inputString = "1 Kings 1:12"
        
        guard let parsedReference = BibleReference(fromString: inputString)
            else {
                XCTFail("unable to parse reference")
                return
        }
        
        XCTAssertEqual(parsedReference.book, BibleBook.First_Kings)
        XCTAssertEqual(parsedReference.chapterNumber, 1)
        XCTAssertEqual(parsedReference.verseNumber,12)
    }
}
