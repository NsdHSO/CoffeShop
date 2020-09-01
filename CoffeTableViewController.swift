//
//  CoffeTableViewController.swift
//  CoffePin
//
//  Created by Sami David on 22/08/2020.
//  Copyright © 2020 Sami David. All rights reserved.
//

import UIKit

class CoffeTableViewController: UITableViewController {
    var coffeShop = ["Cafe CERDACA", "Homei", "Expresso", "Tej", "Arabica", "Café Américain", "Pastelaria-Padaria Sao Roque, Lisbon", "Bar Italia, London Expresso", "Algerian Coffee Stores, London", "Caffè Gambrinus, Naples",
                     "Breizh Cafe, Paris", "Majestic, Porto", "Café Montmartre, Prague", "Konditori Ritorno,Stockholm","Kardomah,Swansea", "Caffè San Marco, Trieste", "Caffè al Bicerin, Turin","Braunerhof, Vienna",
    ]
    var nameImage =  ["homei.jpg", "teakha.jpg", "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg", "confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "caskpubkitchen.jpg",]
    var location = ["Roma", "Malaga", "Arabia", "Dubai", "Emiratele Arabe", "Sudan", "India", "Madagascar", "USA", "Vienna", "Turin", "London", "Americain", "Naples", "Paris", "Porto", "Prague","Bucuresti", "Arad", "Cluj", "Voineasa", "Brasov"]
    
//    let activityController = UIActivityViewController(activityItems:  [defaultText, nameImage], applicationActivities: nil)
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        // Button Scocial
        
        let social = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Share", handler: {(action, indexPath) ->
            Void in
            
            let defaultText = "This is first MY App" + self.coffeShop[indexPath.row]
            
            if let imageToShare = UIImage(named: self.nameImage[indexPath.row]){
            let activityController = UIActivityViewController(activityItems : [defaultText, imageToShare], applicationActivities:nil)
            self.present(activityController, animated: true, completion: nil)
            }})
        // Button Delete
        let delete = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Delete", handler: {(action, indexPath) ->
            Void in
            
            self.coffeShop.remove(at: indexPath.row)
            self.location.remove(at: indexPath.row)
            self.nameImage.remove(at: indexPath.row)
            self.tableView.reloadData()
            
        })
        social.backgroundColor = UIColor(red: 0/256, green: 62/255, blue: 31/255, alpha: 1)
        delete.backgroundColor = UIColor(red: 167/255, green: 171/255,blue: 221/255, alpha: 1)
        return [social,delete]
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = Array(repeating: false, count:34)
        let optionMenu = UIAlertController(title: nil, message: "Hey ce faci", preferredStyle: .actionSheet)
                let close = UIAlertAction(title:"cancel", style:.cancel, handler: nil)
                optionMenu.addAction(close)
                present(optionMenu, animated:true, completion:nil)
        
        let callActionHandler = { (action:UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title:"Service Unavailable" ,message: "Sorry this number is not valid", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title:"OK", style: .default, handler: nil))
            self.present(alertMessage, animated: true, completion: nil)
            
        }
        let callAction = UIAlertAction(title: "Call" + "123-000 \(indexPath.row)", style: .default, handler: callActionHandler)
        optionMenu.addAction(callAction)

        let checkInAction =  UIAlertAction(title: "CHECK IN", style: .default, handler:{
            
            (action:UIAlertAction!) -> Void in
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark
            
        })
        optionMenu.addAction(checkInAction)
    }
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//            // Code
//        let optionMenu = UIAlertController(title: nil, message: "Hey ce faci", preferredStyle: .actionSheet)
//        let close = UIAlertAction(title:"cancel", style:.cancel, handler: nil)
//        optionMenu.addAction(close)
//        present(optionMenu, animated:true, completion:nil)
//
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coffeShop.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CoffeTableViewCell
        
        // Configure the cell...
        
        cell.nameLabel.text = coffeShop[indexPath.row]
        

        cell.thumbnailImageView.image = UIImage(named: nameImage[indexPath.row])
        // cell.thumbnailImageView.layer.cornerRadius = 30.0
        cell.thumbnailImageView.clipsToBounds = true
        cell.locationLabel.text = location[indexPath.row]

        return cell
        
        
        
    }
    
    

}
