//
//  Bible.swift
//  BibleMetaData
//
//  Created by Tom Duckering on 11/01/2017.
//  Copyright © 2017 Tom Duckering. All rights reserved.
//

import Foundation

enum Bible: Int {
    case Genesis
    case Exodus
    case Leviticus
    case Numbers
    case Deuteronomy
    case Joshua
    case Judges
    case Ruth
    case First_Samuel
    case Second_Samuel
    case First_Kings
    case Second_Kings
    case First_Chronicles
    case Second_Chronicles
    case Ezra
    case Nehemiah
    case Esther
    case Job
    case Psalms
    case Proverbs
    case Ecclesiastes
    case Song_of_Solomon
    case Isaiah
    case Jeremiah
    case Lamentations
    case Ezekiel
    case Daniel
    case Hosea
    case Joel
    case Amos
    case Obadiah
    case Jonah
    case Micah
    case Nahum
    case Habakkuk
    case Zephaniah
    case Haggai
    case Zechariah
    case Malachi
    
    case Matthew
    case Mark
    case Luke
    case John
    case Acts
    case Romans
    case First_Corinthians
    case Second_Corinthians
    case Galatians
    case Ephesians
    case Philippians
    case Colossians
    case First_Thessalonians
    case Second_Thessalonians
    case First_Timothy
    case Second_Timothy
    case Titus
    case Philemon
    case Hebrews
    case James
    case First_Peter
    case Second_Peter
    case First_John
    case Second_John
    case Third_John
    case Jude
    case Revelation
    
    static func allBooks() -> [Bible] {
        return (0..<66).map { rawValue in
            return Bible(rawValue: rawValue)!
        }
    }
}
