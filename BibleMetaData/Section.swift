//
//  Section.swift
//  BibleMetaData
//
//  Created by Tom Duckering on 11/01/2017.
//  Copyright © 2017 Tom Duckering. All rights reserved.
//

import Foundation

enum Section: String {
    case ThePentateuch
    case HistoricalBooks
    case WisdomBooks
    case MajorProphets
    case MinorProphets
    case Gospels
    case SynopticGospels
    case ApostolicHistory
    case PaulineEpistles
    case GeneralEpistles
    case PastoralEpistles
    case Apocalyptic
}

extension Bible {
    //TODO - need to complete the categorisation
    func categories() -> [Section] {
        switch self {
        //Old Testament
        case .Genesis,.Exodus,.Leviticus,.Numbers,.Deuteronomy:
            return [.ThePentateuch]
        case .Joshua, .Judges, .Ruth, .First_Samuel, .Second_Samuel, .First_Kings,.Second_Kings,.First_Chronicles, .Second_Chronicles, .Ezra, .Nehemiah, .Esther:
            return [.HistoricalBooks]
        case  .Job, .Psalms, .Proverbs, .Ecclesiastes, .Song_of_Solomon:
            return [.WisdomBooks]
        case .Isaiah, .Jeremiah, .Lamentations, .Ezekiel, .Daniel:
            return [.MajorProphets]
        case .Hosea, .Joel, .Amos, .Obadiah, .Jonah, .Micah, .Nahum, .Habakkuk, .Zephaniah, .Haggai, .Zechariah, .Malachi:
            return [.MinorProphets]
            
        //New Testament
        case .Matthew, .Mark, .Luke:
            return [.Gospels,.SynopticGospels]
        case .John:
            return [.Gospels]
        case .Romans,.First_Corinthians,.Second_Corinthians, .Galatians,.Ephesians,.Philippians,.Colossians,.First_Thessalonians,.Second_Thessalonians:
            return [.PaulineEpistles]
        case .Acts:
            return [.ApostolicHistory]
        case .Hebrews,.James,.First_Peter,.Second_Peter,.First_John,.Second_John,.Third_John,.Jude:
            return [.GeneralEpistles]
        case .First_Timothy,.Second_Timothy,.Titus,.Philemon:
            return [.PastoralEpistles,.PaulineEpistles]
        case .Revelation:
            return [.Apocalyptic]
        }
    }
}
    
