//
//  BibleReferenceFromString.swift
//  BibleMetrics
//
//  Created by Tom Duckering on 30/01/2017.
//  Copyright © 2017 Tom Duckering. All rights reserved.
//

import Foundation

extension BibleReference {

    public init?(fromString string: String) {

        let regexPattern = "(\\d?[a-zA-Z ]*[a-zA-Z]) ?(?:(\\d{1,3})(?::(\\d{1,3}))?)?"

        let captures = string.capturedGroups(withRegex: regexPattern)

        switch captures.count {
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
}
