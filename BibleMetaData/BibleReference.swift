//
//  BibleReference.swift
//  BibleMetaData
//
//  Created by Tom Duckering on 11/01/2017.
//  Copyright © 2017 Tom Duckering. All rights reserved.
//

import Foundation

struct BibleReference {
    
    let book: BibleBook
    let chapterNumber: ChapterNumber
    let verseNumber: VerseNumber
    
    init?(withBook book: BibleBook, chapter: ChapterNumber = 1, andVerse verse: VerseNumber = 1) {
        
        self.book = book
        self.chapterNumber = chapter
        self.verseNumber = verse
        
        
        if chapterNumber > book.numberOfChapters() {
            return nil
        }
        
        if verseNumber > book.numberOfVerses(forChapter: chapterNumber) {
            return nil
        }
    }
    
    init?(fromString string: String) {
        
        let regexPattern = "(\\d?[a-zA-Z ]*[a-zA-Z]) ?(?:(\\d{1,3})(?::(\\d{1,3}))?)?"
        
        let captures = string.capturedGroups(withRegex: regexPattern)
        
        switch captures.count {
        case 0:
            return nil
        case 1:
            guard let book = BibleBook.findBook(withName: captures[0])
                else {
                    return nil
            }
            self.init(withBook: book,chapter: 1,andVerse: 1)
        case 2:
            guard let book = BibleBook.findBook(withName: captures[0])
                else {
                    return nil
            }
            guard let chapterNumber = Int(captures[1]) else {
                return nil
            }
            self.init(withBook: book,chapter: chapterNumber, andVerse: 1)
        case 3:
            guard let book = BibleBook.findBook(withName: captures[0])
                else {
                    return nil
            }
            guard let chapterNumber = Int(captures[1]) else {
                return nil
            }
            
            guard let verseNumber = Int(captures[2]) else {
                return nil
            }
            self.init(withBook: book,chapter: chapterNumber,andVerse: verseNumber)
        default:
            return nil
        }
    }
    
    static func startOfBible() -> BibleReference {
        let firstBook = BibleBook(rawValue: 0)!
        return firstBook.startingReference()
    }
    
    static func endOfBible() -> BibleReference {
        let lastBook = BibleBook.allBooks().last!
        return lastBook.endReference()
    }
    
    
    func absoluteVerseNumber() -> Int {
        return book.versesPriorTo() + book.numberOfVerses(beforeChapter: chapterNumber) + verseNumber
    }
    
    func distanceTo(other: BibleReference) -> Int {
        return other.absoluteVerseNumber() - absoluteVerseNumber()
    }
    
    let BOOK_TO_CHAPTER_DELIMITER = " "
    let CHAPTER_TO_VERSE_DELIMITER = ":"
    
    func formatAsString() -> String {
        return book.name() + BOOK_TO_CHAPTER_DELIMITER + String(chapterNumber) + CHAPTER_TO_VERSE_DELIMITER + String(verseNumber)
    }
    
}
