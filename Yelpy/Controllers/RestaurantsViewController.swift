//
//  ViewController.swift
//  Yelpy
//
//  Created by Memo on 5/21/20.
//  Copyright © 2020 memo. All rights reserved.
//

import UIKit
import AlamofireImage

class RestaurantsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    // ––––– TODO: Add storyboard Items (i.e. tableView + Cell + configurations for Cell + cell outlets)
    // ––––– TODO: Next, place TableView outlet here
    
    @IBOutlet weak var tableView: UITableView!
    
    // –––––– TODO: Initialize restaurantsArray
    
    var restaurantsArray: [[String:Any?]] = []
    
    
    
    
    // ––––– TODO: Add tableView datasource + delegate
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        super.viewDidLoad()
        getAPIData()

    }
    
    
    // ––––– TODO: Get data from API helper and retrieve restaurants
    
    func getAPIData(){
        API.getRestaurants() { (restaurants) in
            guard let restaurants = restaurants else {
                return
            }
            self.restaurantsArray = restaurants
            self.tableView.reloadData() // reload data
        }
        
    }
    
    // How many cells there will be
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantsArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurentCell", for: indexPath) as! RestaurentCell
        let restaurant = restaurantsArray[indexPath.row]
        
        cell.labelTextField.text = restaurant["name"] as? String ?? ""
        cell.phoneLabel.text = restaurant["display_phone"] as? String ?? ""
        
        cell.priceLabel.text = restaurant["price"] as? String ?? ""
        
        // Set Image of Restaurant
        if let imageURLString = restaurant["image_url"] as? String {
            let imageURL = URL(string: imageURLString)
            cell.posterView.af.setImage(withURL: imageURL!)
        }
        return cell
        
    }
    

}

// ––––– TODO: Create tableView Extension and TableView Functionality


