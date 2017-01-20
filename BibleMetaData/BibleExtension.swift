//
//  BibleReferenceTypes.swift
//  BibleMetaData
//
//  Created by Tom Duckering on 08/01/2017.
//  Copyright © 2017 Tom Duckering. All rights reserved.
//

import Foundation

extension BibleBook {
    
    func numberOfChapters() -> Int {
        return chapterAndVerseData().count
    }
    
    func numberOfVerses(forChapter chapter: ChapterNumber) -> Int {
        return chapterAndVerseData()[chapter.index()]
    }
    
    func numberOfVerses() -> Int {
        return chapterAndVerseData().reduce(0,+)
    }
    
    func booksBefore() -> [BibleBook] {
        return (0..<self.rawValue).map { rawValue in return BibleBook(rawValue: rawValue)!}
    }
    
    func versesPriorTo() -> Int {
        let versesInPriorBooks = booksBefore().map { book in return book.numberOfVerses() }
        return versesInPriorBooks.reduce(0,+)
    }
    
    func numberOfVerses(beforeChapter chapter: ChapterNumber) -> Int {
        let verses = (1..<(chapter)).map { chapterNumber in return numberOfVerses(forChapter: chapterNumber)}
        return verses.reduce(0,+)
    }
    
    func startingReference() -> BibleReference {
        return BibleReference(withBook: self)!
    }
    
    func endReference() -> BibleReference {
        return BibleReference(withBook: self, chapter: numberOfChapters(),andVerse: numberOfVerses(forChapter: numberOfChapters()))!
    }
    
    func nextBook() -> BibleBook? {
        return BibleBook(rawValue: self.rawValue + 1)
    }
    
    func previousBook() -> BibleBook? {
        return BibleBook(rawValue: self.rawValue - 1)
    }
    
    func reference(forAbsoluteVerseNumber absoluteVerseNumber: AbsoluteVerseNumber) -> BibleReference? {
        let versesBeforeThisBook = versesPriorTo()
        let internalVerseNumber = absoluteVerseNumber - versesBeforeThisBook
        
        var first = 1
        let verseRanges = chapterAndVerseData().map { numberOfVerses -> (CountableClosedRange<Int>) in
            let last = first + numberOfVerses - 1
            let range = (first...last)
            first = last + 1
            return range
        }
        
        guard let chapterIndex = verseRanges.index(where:{ verseRange in verseRange ~= internalVerseNumber })
            else {
                return nil
        }
        
        
        let chapterNumber = chapterIndex + 1
        let verseNumber = internalVerseNumber - numberOfVerses(beforeChapter: chapterNumber)
        return BibleReference(withBook: self, chapter: chapterNumber, andVerse: verseNumber)
    }
    
    func isLast(verse: VerseNumber, inChapter chapter: ChapterNumber) -> Bool {
        return verse == chapterAndVerseData()[chapter-1]
    }
    
    func isFirst(verse: VerseNumber, inChapter chapter: ChapterNumber) -> Bool {
        return verse == 1
    }
    
    func isFirst(chapter: ChapterNumber) -> Bool {
        return chapter == 1
    }
    
    func isLast(chapter: ChapterNumber) -> Bool {
        return chapter == numberOfChapters()
    }
    
    static func reference(withAbsoluteVerseNumber absoluteVerseNumber: AbsoluteVerseNumber) -> BibleReference? {
        let bookContainingAbsoluteVerse = BibleBook.allBooks().filter { book in
            let startingAbsoluteVerseNumber = book.startingReference().absoluteVerseNumber()
            let endingAbsoluteVerseNumber = book.endReference().absoluteVerseNumber()
            
            return startingAbsoluteVerseNumber...endingAbsoluteVerseNumber ~= absoluteVerseNumber
            }.first
        
        return bookContainingAbsoluteVerse?.reference(forAbsoluteVerseNumber: absoluteVerseNumber)
    }
    
    static func findBook(withName name: String) -> BibleBook? {
        return BibleBook.allBooks().filter { book in book.name() == name }.first
    }
    
    static func getBooks(whereNameStartsWith prefix: String) -> [BibleBook] {
        return BibleBook.allBooks().filter { book in book.name().hasPrefix(prefix) }
    }
    
    static func getBook(whereNameStartsWith prefix: String) -> BibleBook? {
        let matchingBooks = getBooks(whereNameStartsWith: prefix)
        if matchingBooks.count > 1 {
            return nil
        } else {
            return matchingBooks.first
        }
    }
}



