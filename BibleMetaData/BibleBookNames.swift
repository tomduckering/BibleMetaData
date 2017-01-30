//
//  BibleBookNames.swift
//  BibleMetaData
//
//  Created by Tom Duckering on 11/01/2017.
//  Copyright © 2017 Tom Duckering. All rights reserved.
//

import Foundation

extension BibleBook {
    func name() -> String {
        switch self {
        case .Genesis:
            return "Genesis"
        case .Exodus:
            return "Exodus"
        case .Leviticus:
            return "Leviticus"
        case .Numbers:
            return "Numbers"
        case .Deuteronomy:
            return "Deuteronomy"
        case .Joshua:
            return "Joshua"
        case .Judges:
            return "Judges"
        case .Ruth:
            return "Ruth"
        case .First_Samuel:
            return "1 Samuel"
        case .Second_Samuel:
            return "2 Samuel"
        case .First_Kings:
            return "1 Kings"
        case .Second_Kings:
            return "2 Kings"
        case .First_Chronicles:
            return "1 Chronicles"
        case .Second_Chronicles:
            return "2 Chronicles"
        case .Ezra:
            return "Ezra"
        case .Nehemiah:
            return "Nehemiah"
        case .Esther:
            return "Esther"
        case .Job:
            return "Job"
        case .Psalms:
            return "Psalms"
        case .Proverbs:
            return "Proverbs"
        case .Ecclesiastes:
            return "Ecclesiastes"
        case .Song_of_Solomon:
            return "Song of Solomon"
        case .Isaiah:
            return "Isaiah"
        case .Jeremiah:
            return "Jeremiah"
        case .Lamentations:
            return "Lamentations"
        case .Ezekiel:
            return "Ezekiel"
        case .Daniel:
            return "Daniel"
        case .Hosea:
            return "Hosea"
        case .Joel:
            return "Joel"
        case .Amos:
            return "Amos"
        case .Obadiah:
            return "Obadiah"
        case .Jonah:
            return "Jonah"
        case .Micah:
            return "Micah"
        case .Nahum:
            return "Nahum"
        case .Habakkuk:
            return "Habakkuk"
        case .Zephaniah:
            return "Zephaniah"
        case .Haggai:
            return "Haggai"
        case .Zechariah:
            return "Zechariah"
        case .Malachi:
            return "Malachi"
            
        case .Matthew:
            return "Matthew"
        case .Mark:
            return "Mark"
        case .Luke:
            return "Luke"
        case .John:
            return "John"
        case .Acts:
            return "Acts"
        case .Romans:
            return "Romans"
        case .First_Corinthians:
            return "1 Corinthians"
        case .Second_Corinthians:
            return "2 Corinthians"
        case .Galatians:
            return "Galatians"
        case .Ephesians:
            return "Ephesians"
        case .Philippians:
            return "Philippians"
        case .Colossians:
            return "Colossians"
        case .First_Thessalonians:
            return "1 Thessalonians"
        case .Second_Thessalonians:
            return "2 Thessalonians"
        case .First_Timothy:
            return "1 Timothy"
        case .Second_Timothy:
            return "2 Timothy"
        case .Titus:
            return "Titus"
        case .Philemon:
            return "Philemon"
        case .Hebrews:
            return "Hebrews"
        case .James:
            return "James"
        case .First_Peter:
            return "1 Peter"
        case .Second_Peter:
            return "2 Peter"
        case .First_John:
            return "1 John"
        case .Second_John:
            return "2 John"
        case .Third_John:
            return "3 John"
        case .Jude:
            return "Jude"
        case .Revelation:
            return "Revelation"
        }
    }

    func alternativeNames() -> [String] {
        switch self {
        case .Song_of_Solomon:
            return [self.name(), "Song of Songs"]
        default:
            return [self.name()]
        }
    }
}
