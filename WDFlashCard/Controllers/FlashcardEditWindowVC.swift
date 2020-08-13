//
//  FlashCardTableViewController.swift
//  WDFlashCard
//
//  Created by Kevin Smith on 6/22/20.
//  Copyright © 2020 Vladimir Dinic. All rights reserved.
//

import UIKit

class FlashCardTableViewController: UIViewController, UITableViewDelegate {
    
    var flashCardArray : [FlashCard] = [FlashCard]()
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
        var randoFlashCard = FlashCard(frontText: "What time is it?", backText: "Flashcard Time")
        flashCardArray.append(randoFlashCard)
        print("FlashCardArray Length: \(flashCardArray.count)")
        
        tableView.register(UINib(nibName: "FlashCardCell", bundle: nil), forCellReuseIdentifier: "FlashCardCellID")
    }
}

extension FlashCardTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flashCardArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let flashCardLocal = flashCardArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlashCardCellID") as! FlashCardCell
        cell.setFlashCard(flashCard: flashCardLocal)
        
        
        return cell
        
    }
    //Returns a UISwipeConfiguration, which is a container for swipe actions.
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let delete = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction, view, actionPerformed: @escaping (Bool) -> Void) in
        
                let alert = UIAlertController(title: "Delete Flash Card", message: "Are you sure you want to delete this flashcard? ", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (alertAction) in
                    actionPerformed(false)
                }))
                
                alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (alertAction) in
                     //perform delete
                               self.flashCardArray.remove(at: indexPath.row)
                               tableView.deleteRows(at: [indexPath], with: .automatic)
                               //tableView.reloadData()
                               actionPerformed(true)
                }))
                let row = indexPath.row
                //self.flashCardArray.remove(at: row)
                self.present(alert, animated:  true)
        }
         
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = UIContextualAction(style: .normal, title: "Edit") { (contextualAction, view,  actionPerformed: (Bool) -> Void) in
            self.performSegue(withIdentifier: "toFlashCardEdit", sender: nil)
        }
        return UISwipeActionsConfiguration(actions: [edit])
    }
    

    
     
}
