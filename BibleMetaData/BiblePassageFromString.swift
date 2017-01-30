//
//  BiblePassageFromString.swift
//  BibleMetrics
//
//  Created by Tom Duckering on 30/01/2017.
//  Copyright © 2017 Tom Duckering. All rights reserved.
//

import Foundation

extension BiblePassage {

    public init?(from string: String) {

        let regexPattern = "(\\d?[a-zA-Z ]*[a-zA-Z]) ?(?:(\\d{1,3})(?::(\\d{1,3}))?)?-?(?:(\\d{1,3})(?::(\\d{1,3}))?)?"

        let captures = string.capturedGroups(withRegex: regexPattern)

        if captures.count == 1 {
            guard let book = BibleBook.findBook(withName: captures[0])
                else {
                    return nil
            }
            self.start = book.startingReference()
            self.end = book.endReference()
        } else if captures.count == 2 {
            guard let book = BibleBook.findBook(withName: captures[0]),
            let chapterNumber = ChapterNumber(captures[1]),
            let startRef = BibleReference(withBook: book, chapter: chapterNumber, andVerse: VerseNumber(1)),
            let endRef = BibleReference(withBook: book, chapter: chapterNumber, andVerse: book.numberOfVerses(forChapter: chapterNumber))
                else {
                    return nil
            }
            self.start = startRef
            self.end = endRef

        } else if captures.count == 3 {
            guard let book = BibleBook.findBook(withName: captures[0]),
                let chapterNumber = ChapterNumber(captures[1]),
                let verseNumber = VerseNumber(captures[2]),
                let startRef = BibleReference(withBook: book, chapter: chapterNumber, andVerse: verseNumber)
                else {
                    return nil
            }
            self.start = startRef
            self.end = self.start
        } else if captures.count == 4 {
            guard let book = BibleBook.findBook(withName: captures[0]),
                let chapterNumber = ChapterNumber(captures[1]),
                let startVerseNumber = VerseNumber(captures[2]),
                let endVerseNumber = VerseNumber(captures[3]),
                let startRef = BibleReference(withBook: book, chapter: chapterNumber, andVerse: startVerseNumber),
                let endRef = BibleReference(withBook: book, chapter: chapterNumber, andVerse: endVerseNumber)
                else {
                    return nil
            }
            self.start = startRef
            self.end = endRef
        } else if captures.count == 5 {
            guard let book = BibleBook.findBook(withName: captures[0]),
                let chapterNumber = ChapterNumber(captures[1]),
                let startVerseNumber = VerseNumber(captures[2]),
                let endChapterNumber = ChapterNumber(captures[3]),
                let endVerseNumber = VerseNumber(captures[4]),
                let startRef = BibleReference(withBook: book, chapter: chapterNumber, andVerse: startVerseNumber),
                let endRef = BibleReference(withBook: book, chapter: endChapterNumber, andVerse: endVerseNumber)
                else {
                    return nil
            }
            self.start = startRef
            self.end = endRef
        } else {
            return nil
        }
    }
}
