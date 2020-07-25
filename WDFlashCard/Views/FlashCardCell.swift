//
//  FlashCardCell.swift
//  WDFlashCard
//
//  Created by Kevin Smith on 6/27/20.
//  Copyright © 2020 Vladimir Dinic. All rights reserved.
//

import UIKit

class FlashCardCell: UITableViewCell {
    @IBOutlet weak var frontFCLabel: UILabel!
    
    @IBOutlet weak var backFCLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setFlashCard(flashCard: FlashCard) {
      let front = flashCard.frontTextViet ?? "front"
      let back = flashCard.backTextEng ?? "Back"
    print("\(front) - \(back)")
      frontFCLabel.text = front
      //backFCLabel.text = back
        backFCLabel.text = back
        
        
        
    }
    
}
