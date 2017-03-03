//
//  RestaurantDetailsViewController.swift
//  FoodPin
//
//  Created by TekUP2 on 24/02/2017.
//  Copyright © 2017 HedhiliMohamed. All rights reserved.
//

import UIKit

class RestaurantDetailsViewController: UIViewController , UITableViewDataSource ,UITableViewDelegate {
    @IBOutlet weak var tableInformation: UITableView!
 
   
    @IBOutlet weak var RestaurentImage: UIImageView!
    var restaurantImage = ""
var  location  =  ""
    var  name =  ""
    var type = ""
    var  isVisited =  false
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
RestaurentImage.image = UIImage(named: restaurantImage)
       tableInformation.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue:
            240.0/255.0, alpha: 0.2)
        // tableInformation.tableFooterView = UIView(frame: self)
        tableInformation.separatorColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue:
            240.0/255.0, alpha: 0.8)
         
       title = name
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier :"Cell", for  :indexPath) as! RestaurentDetailTableViewCell
        
       
        // Configure the cell...
       switch indexPath.row {
        case 0:
            cell.LabelField.text = "Name"
            cell.LabelValue.text = name
        case 1:
           cell.LabelField.text = "Type"
            cell.LabelValue.text =  type
        case 2:
            cell.LabelField.text = "Location"
            cell.LabelValue.text = location
        case 3:
            cell.LabelField.text = "Been here"
            cell.LabelValue.text = (isVisited) ? "Yes, I've been here before" : "No"
        
        default:
            cell.LabelField.text = ""
            cell.LabelValue.text = ""
        }
        cell.backgroundColor = UIColor.clear
        return cell
    }

}
