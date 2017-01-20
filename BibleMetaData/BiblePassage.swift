//
//  BiblePassage.swift
//  BibleMetaData
//
//  Created by Tom Duckering on 11/01/2017.
//  Copyright © 2017 Tom Duckering. All rights reserved.
//

import Foundation

struct BiblePassage {
    let start: BibleReference
    let end: BibleReference
    
    func numberOfVerses() -> Int {
        return start.distanceTo(other: end) + 1
    }
}


