//
//  ViewController.swift
//  OpenWeatherMapApp
//
//  Created by Maria Handschu on 3/20/19.
//  Copyright © 2019 Maria Handschu. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    let BASE_URL = "http://api.openweathermap.org/data/2.5/weather"
    let API_KEY = "a10dbba30194931c77982e032457ec48"
    
    let data = AppData().cities
    var countries = [String]() //THIS IS HOW YOU GET A KEY FROM A DICTIONARY
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries.append(contentsOf: data.keys)
        print(data)
        
        print(countries)
        
        let parameters: Parameters = [
            "cities" : data
        ]
        
   
//        AF.request("https://my-json-server.typicode.com/typicode/demo/posts", method: .get, parameters: parameters, encoding: JSONEncoding.default, headers: nil, interceptor: nil)
        
        
    }
    
    //data divided into two (2) sections Country and City
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

   func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = self.countries.description
        label.backgroundColor = UIColor.darkGray
        return label
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //this is where data is added to the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let countries = self.countries[indexPath.row] //prints data to tableview
        cell.textLabel?.text = countries
        
        cell.textLabel?.text = "\(countries) Section:\(indexPath.section) Row:\(indexPath.row)"
    
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    //this is where data gets sent back.
}

