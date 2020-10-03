//
//  File.swift
//  Yelpy
//
//  Created by Memo on 5/21/20.
//  Copyright © 2020 memo. All rights reserved.
//

import Foundation


struct API {
    

    
    static func getRestaurants(completion: @escaping ([[String:Any]]?) -> Void) {
        
        // ––––– TODO: Add your own API key!
        let apikey = "yotXKDM7fvURUlGzS1pkBlshqySmcdqQlWfMK3sTlFC0QG0OW-XsaCmF4PGj2R97asO-v-j9XoGipqil9M7rUBeDmdU0uXHke-xTf5_xrVfGyv3lXJuWH2MWgpluX3Yx"
        
        // Coordinates for San Francisco
        let lat = 42.8017434
        let long = -73.927624
        
        
        let url = URL(string: "https://api.yelp.com/v3/transactions/delivery/search?latitude=\(lat)&longitude=\(long)")!
        
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        // Insert API Key to request
        request.setValue("Bearer \(apikey)", forHTTPHeaderField: "Authorization")
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                
        

                // ––––– TODO: Get data from API and return it using completion
                print(data)
                
                // turning json response into dictionary
                let dataDict = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                // grab the business data and convert it to an array of dictionaries for each restaurent
                
                let restaurants = dataDict["businesses"] as! [[String: Any]]
                
                // completion - escaping method which allows the data to be used outside of the closure
                return completion(restaurants)
                
                }
            }
        
            task.resume()
        
        }
    }

    
