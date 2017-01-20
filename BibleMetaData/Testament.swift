//
//  Testament.swift
//  BibleMetaData
//
//  Created by Tom Duckering on 11/01/2017.
//  Copyright © 2017 Tom Duckering. All rights reserved.
//

import Foundation

enum Testament:String {
    case Old
    case New
}

extension Bible {
    func testament() -> Testament {
        switch self {
        case .Genesis, .Exodus, .Leviticus, .Numbers, .Deuteronomy, .Joshua, .Judges, .Ruth, .First_Samuel, .Second_Samuel, .First_Kings, .Second_Kings, .First_Chronicles, .Second_Chronicles, .Ezra, .Nehemiah, .Esther, .Job, .Psalms, .Proverbs, .Ecclesiastes, .Song_of_Solomon, .Isaiah, .Jeremiah, .Lamentations, .Ezekiel, .Daniel, .Hosea, .Joel, .Amos, .Obadiah, .Jonah, .Micah, .Nahum, .Habakkuk, .Zephaniah, .Haggai, .Zechariah, .Malachi:
            return .Old
        case .Matthew, .Mark, .Luke, .John, .Acts, .Romans, .First_Corinthians, .Second_Corinthians, .Galatians, .Ephesians, .Philippians, .Colossians, .First_Thessalonians, .Second_Thessalonians, .First_Timothy, .Second_Timothy, .Titus, .Philemon, .Hebrews, .James, .First_Peter, .Second_Peter, .First_John, .Second_John, .Third_John, .Jude, .Revelation:
            return .New
        }
    }
    
    static func newTestamentBooks() -> [Bible] {
        return allBooks().filter { book in book.testament() == .New }
    }
    
    static func oldTestamentBooks() -> [Bible] {
        return allBooks().filter { book in book.testament() == .Old }
    }
    
}
