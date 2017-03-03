//
//  RestaurantViewController.swift
//  FoodPin
//
//  Created by TekUP2 on 17/02/2017.
//  Copyright © 2017 HedhiliMohamed. All rights reserved.
//

import UIKit

class RestaurantViewController: UITableViewController {
    
    var restaurants:[Restaurant] = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong", image: "cafedeadend.jpg", isVisited: false),
            Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image:
                "homei.jpg", isVisited: false),
            Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image:
                "teakha.jpg", isVisited: false),
            Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location:
                "Hong Kong", image: "cafeloisl.jpg", isVisited: false),
            Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong",
                       image: "petiteoyster.jpg", isVisited: false),
            Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Hong Kong", image: "forkeerestaurant.jpg", isVisited: false),
                Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong",
                           image: "posatelier.jpg", isVisited: false),
                Restaurant(name: "Bourke Street Backery", type: "Chocolate", location:
                    "Sydney", image: "bourkestreetbakery.jpg", isVisited: false),
                Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney",
                           image: "haighschocolate.jpg", isVisited: false),
                Restaurant(name: "Palomino Espresso", type: "American / Seafood", location:
                    "Sydney", image: "palominoespresso.jpg", isVisited: false),
                Restaurant(name: "Upstate", type: "American", location: "New York", image:
                    "upstate.jpg", isVisited: false),
                Restaurant(name: "Traif", type: "American", location: "New York", image:
                    "traif.jpg", isVisited: false),
                Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch",
                           location: "New York", image: "grahamavenuemeats.jpg", isVisited: false),
                Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "NewYork", image: "wafflewolf.jpg", isVisited: false),
                    Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York",
                               image: "fiveleaves.jpg", isVisited: false),
                    Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York",
                               image: "cafelore.jpg", isVisited: false),
                    Restaurant(name: "Confessional", type: "Spanish", location: "New York",
                               image: "confessional.jpg", isVisited: false),
                    Restaurant(name: "Barrafina", type: "Spanish", location: "London", image:
                        "barrafina.jpg", isVisited: false),
                    Restaurant(name: "Donostia", type: "Spanish", location: "London", image:
                        "donostia.jpg", isVisited: false),
                    Restaurant(name: "Royal Oak", type: "British", location: "London", image:"royaloak.jpg", isVisited: false),
                    Restaurant(name: "Thai Cafe", type: "Thai", location: "London", image:
                        "thaicafe.jpg", isVisited: false)]
   
            override func viewDidLoad() {
        super.viewDidLoad()
                navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style:
                    .plain, target: nil, action: nil)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurants.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell" , for  :indexPath) as! RestaurantTableViewCell
        cell.labelName.text = restaurants[indexPath.row].name
        cell.imageCell.image = UIImage(named: restaurants[indexPath.row].image)
         cell.labelType.text = restaurants[indexPath.row].type
         cell.labelLocation.text = restaurants[indexPath.row].location

        cell.imageCell.layer.cornerRadius = 30.0
        cell.imageCell.clipsToBounds = true
        
 if restaurants[indexPath.row].isVisited
 {cell.accessoryType = .checkmark}
 else {cell.accessoryType = .none}
    
        return cell

    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
        // Add actions to the menu
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler:
            nil)
        
        let callActionHandler = { (action:UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Service Unavailable", message:
                "Sorry, the call feature is not available yet. Please retry later.",
                                                 preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler:
                nil))
            self.present(alertMessage, animated: true, completion: nil)
        }
        
        let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)",
            style: UIAlertActionStyle.default, handler: callActionHandler)
      
        let isVisitedAction = UIAlertAction(title: "I've been here", style: .default, handler: {(action : UIAlertAction!)-> Void in
        let cell = tableView.cellForRow(at: indexPath)
cell?.accessoryType = .checkmark
            self.restaurants[indexPath.row].isVisited = true
        })
        optionMenu.addAction(isVisitedAction)
        
      optionMenu.addAction(callAction)
        optionMenu.addAction(cancelAction)
        tableView.deselectRow(at: indexPath, animated: true)
        // Display the menu
        self.present(optionMenu, animated: true, completion: nil)
        
        
    }
   
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

  
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
                 restaurants.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        tableView.reloadData()
        print("Total item: \(restaurants.count)")
        for rest in restaurants {
            print(rest.name)
        }
        
    }
    override func tableView(_ tableView: UITableView,
                           editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?
    {
        // Social Sharing Button
        let shareAction = UITableViewRowAction(style:
            UITableViewRowActionStyle.default, title: "Share", handler: { (action,
                indexPath) -> Void in
                let defaultText = "Just checking in at " +
                    self.restaurants[indexPath.row].name
                if let imageToShare = UIImage(named:
                    self.restaurants[indexPath.row].image) {
                    let activityController = UIActivityViewController(activityItems:
                        [defaultText, imageToShare], applicationActivities: nil)
                    self.present(activityController, animated: true,
                                               completion: nil)
                } })
        // Delete button
        let deleteAction = UITableViewRowAction(style:
            UITableViewRowActionStyle.default, title: "Delete",handler: { (action,
                indexPath) -> Void in
                // Delete the row from the data source
                
                self.restaurants.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with:
                    .fade)
        })
        shareAction.backgroundColor = UIColor(red: 28.0/255.0, green: 165.0/255.0,
                                              blue: 253.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 203.0/255.0, alpha: 1.0)
        return [deleteAction, shareAction]
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRestaurantDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as!
                RestaurantDetailsViewController
                destinationController.restaurantImage =
                    restaurants[indexPath.row].image
                destinationController.name = restaurants[indexPath.row].name
                destinationController.location = restaurants [indexPath.row].location
                destinationController.type = restaurants[indexPath.row].type
                  destinationController.isVisited = restaurants[indexPath.row].isVisited
            }
        }
    }
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
