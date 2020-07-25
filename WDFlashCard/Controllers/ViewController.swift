//
//  ViewController.swift
//  WDFlashCard
//
//  Created by Vladimir Dinic on 7/22/17.
//  Copyright © 2017 Vladimir Dinic. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WDFlashCardDelegate {
    @IBAction func nextFlashCardButtonPressed(_ sender: UIButton) {
        presentNewFlashCard()
        
    }
    
    
    var flashCardArray : [FlashCard] = [FlashCard]()
    var randomFlashCard: FlashCard?
    
    @IBAction func nextFlashCard(_ sender: UIButton) {
        presentNewFlashCard()
    }
    
    @IBOutlet weak var flashCardFront: UILabel!
    @IBOutlet weak var flashCardBack: UILabel!
    @IBAction func addWordsPressed(_ sender: UIButton) {
        print("add words pressed. ")
        performSegue(withIdentifier: "addWords", sender: self)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? AddWordsVC
        vc?.flashCardArray = self.flashCardArray
    }
    override func viewDidAppear(_ animated: Bool) {
        print("VC flashcard array count: \(flashCardArray.count)")
    }
    @IBOutlet weak var toggleTapToFlipButton: UIButton!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var frontView: UIView!
    @IBOutlet weak var flashCard: WDFlashCard!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        flashCard.duration = 2.0
        flashCard.flipAnimation = .flipFromLeft
        print("VC flashcard array count: \(flashCardArray.count)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func flipPressed(_ sender: Any)
    {
        flashCard.flip()
    }
    
    @IBAction func disableTapToFlipPressed(_ sender: Any)
    {
        flashCard.disableTouchToFlipFesture = !flashCard.disableTouchToFlipFesture
        toggleTapToFlipButton.setTitle("\(flashCard.disableTouchToFlipFesture ? "Enable" : "Disable") tap to flip", for: .normal)
    }
    //MARK: WDFlashCardDelegate methods
    
    func flipBackView(forFlashCard flashCardView: WDFlashCard) -> UIView {
        return backView
    }
    
    func flipFrontView(forFlashCard flashCardView: WDFlashCard) -> UIView {
        return frontView
    }
    
    func flashCardWillFlip(forFlashCard flashCardView: WDFlashCard) {
        print("Flash card will flip")
    }
    
    func flashCardFlipped(forFlashCard flashCardView: WDFlashCard) {
        print("Flash card flipped")
    }
    
    func pickRandomFlashCardFromFCArray() -> FlashCard {
        print("flashCardArray.count: \(flashCardArray.count)")
        let flashCardArrayLength = flashCardArray.count
        var randoFlash : FlashCard?
        if flashCardArrayLength > 0 {
            randoFlash = flashCardArray[Int.random(in: 0 ... flashCardArrayLength - 1)]
        }
        return randoFlash ?? FlashCard(frontText: "front", backText: "back")
    }
    
    func presentNewFlashCard(){
        randomFlashCard = pickRandomFlashCardFromFCArray()
        flashCardFront.text = randomFlashCard?.frontTextViet
        flashCardBack.text = randomFlashCard?.backTextEng
        
    }
}

//THINGS THAT GOTTA HAPPEN:
// Flash cards must be saved on firebase
// the flash cards gotta get thrown around.
// Customize flashcard size.
//Flash card collects.
