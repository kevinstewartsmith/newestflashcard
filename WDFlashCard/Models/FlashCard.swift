//
//  FlashCard.swift
//  WDFlashCard
//
//  Created by Kevin Smith on 6/10/20.
//  Copyright © 2020 Vladimir Dinic. All rights reserved.
//

import Foundation


class FlashCard {
    
    var frontTextViet: String
    var backTextEng: String
    var flashCardTitle: String
    init(frontText: String, backText: String){
        frontTextViet = frontText
        backTextEng = backText
        flashCardTitle = "\(frontTextViet) - \(backTextEng)"
    }
    
}
