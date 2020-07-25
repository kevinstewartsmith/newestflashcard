//
//  AddWordsVC.swift
//  WDFlashCard
//
//  Created by Kevin Smith on 6/13/20.
//  Copyright © 2020 Vladimir Dinic. All rights reserved.
//

import UIKit

class AddWordsVC: UIViewController, UINavigationControllerDelegate {

    var flashCardArray : [FlashCard] = [FlashCard]()
    
    
    override func viewDidLoad() {
        print("Flash card array length upon opening: \(flashCardArray.count)")
        //vietTextBox.text = ""
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        print("ADD Word VC Flash Card Array Length upon opening: \(self.flashCardArray.count)")
        navigationController?.delegate = self
        //vietTextboxObject.keyboardType = .
        
    }
    
    @IBOutlet weak var vietTextboxObject: UITextField!
    
    
    
    @IBOutlet weak var makeCFButton: UIButton!
    var vietText : String = ""
    var engText : String = ""
    @IBOutlet weak var vietWordDisplay: UILabel!
    @IBOutlet weak var englishWordDisplay: UILabel!
    @IBOutlet weak var vietTextBox: UITextField!
    @IBOutlet weak var englishWordBox: UITextField!
    var newFlashCardCount = 0
    
    
    
    
    @IBAction func makeFCButtonPressed(_ sender: UIButton) {
//        vietWordDisplay.text = "\(vietWordDisplay.text) \n\(vietTextBox.text)"
//        englishWordDisplay.text = englishWordBox.text
    
        print("new flash card count button: \(newFlashCardCount)")
        if newFlashCardCount < 5 {
            print("vietTextBox.text : \(vietTextBox.text)")
//            vietText = vietTextBox.text ?? "front"
//            engText = englishWordBox.text ?? "Back"
            
            let newFlashCard: FlashCard? = FlashCard(frontText: vietTextBox.text ?? "Front" , backText: englishWordBox.text ?? "Back")
            flashCardArray.append(newFlashCard ?? FlashCard(frontText: "Fuck", backText: "You"))
           print("FlashCard Array Length: \(flashCardArray.count)")
           var newVietText: String = newFlashCard?.frontTextViet ?? "Hello"
           var newEngText : String = newFlashCard?.backTextEng ?? "Goodbye"
        
           vietText =  "\(vietText) \n \(newVietText)"
           engText = "\(engText) \n \(newEngText)"
        
        
           vietWordDisplay.text =  vietText
           englishWordDisplay.text = engText
           newFlashCardCount += 1
           print("new flash card count button: \(newFlashCardCount)")
            
            vietTextBox.text = ""
            englishWordBox.text = ""
           
        }
        
        if newFlashCardCount >= 5 {
            makeCFButton.isEnabled = false
            makeCFButton.setTitleColor(UIColor.darkGray, for: .normal)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? FlashCardTableViewController
        vc?.flashCardArray = self.flashCardArray
    }
}

extension AddWordsVC {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        (viewController as? ViewController)?.flashCardArray = self.flashCardArray // Here you pass the to your original view controller
        print("navigation function engaged!")
    }
}

