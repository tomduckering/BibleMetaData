//
//  PassageFormatter.swift
//  BibleMetaData
//
//  Created by Tom Duckering on 20/01/2017.
//  Copyright © 2017 Tom Duckering. All rights reserved.
//

import Foundation

protocol BiblePassageStringFormatter {
    func string(from: BiblePassage) -> String
}

class BasicBiblePassageStringFormatter: BiblePassageStringFormatter {
    
    var bookToNumbers = " "
    var chapterToVerse = ":"
    var range = "-"
    
    func string(from passage: BiblePassage) -> String {
        
        if passage.start.book == passage.end.book {
            if passage.start.chapterNumber == passage.end.chapterNumber {
                if passage.start.verseNumber == passage.end.verseNumber {
                    return passage.start.formatAsString()
                } else {
                    if passage.start.book.isFirst(verse: passage.start.verseNumber, inChapter: passage.start.chapterNumber) && passage.start.book.isLast(verse: passage.end.verseNumber, inChapter: passage.end.chapterNumber) {
                        return passage.start.book.name() + bookToNumbers + String(passage.start.chapterNumber)
                    } else {
                        return passage.start.book.name() + bookToNumbers + String(passage.start.chapterNumber) + chapterToVerse + String(passage.start.verseNumber) + range + String(passage.end.verseNumber)
                    }
                }
            } else {
                if passage.start.book.isFirst(chapter: passage.start.chapterNumber) && passage.start.book.isLast(chapter: passage.end.chapterNumber) {
                    return passage.start.book.name()
                } else {
                    return passage.start.book.name() + bookToNumbers + String(passage.start.chapterNumber) + chapterToVerse + String(passage.start.verseNumber) + range + String(passage.end.chapterNumber) + chapterToVerse + String(passage.end.verseNumber)
                }
            }
        } else {
            return passage.start.formatAsString() + range + passage.end.formatAsString()
        }
    }
}
