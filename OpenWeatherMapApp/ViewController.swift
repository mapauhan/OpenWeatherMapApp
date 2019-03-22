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
    
    @IBOutlet weak var citiesList: UITableView!
    
    let BASE_URL = "http://api.openweathermap.org/data/2.5/weather"
    let API_KEY = "a10dbba30194931c77982e032457ec48"
    
    let data = AppData().cities
    var countries = [String]() //THIS IS HOW YOU GET A KEY FROM A DICTIONARY
    
    var selectedCountry:String?
    var selectedCity:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries.append(contentsOf: data.keys)
        //print("countries: \(countries)")
        
        
        let parameters: Parameters = [
            "cities" : data
        ]
        let uri = "\(BASE_URL)?APP_ID=\(API_KEY)"
        AF.request(uri, method: HTTPMethod.post).responseJSON { response in
            
            print(response.description)
            
        }
        
        //        AF.request("https://my-json-server.typicode.com/typicode/demo/posts", method: .get, parameters: parameters, encoding: JSONEncoding.default, headers: nil, interceptor: nil)
        
        
    }
    
}
    
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // what country?
        let country = countries[section]
        
        return (data[country]?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //this is where data is added to the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // what country?
        let country = countries[indexPath.section]
        //cities in country
        let citiesInCountry = data[country]
        //what city?
        let city = citiesInCountry![indexPath.row] //prints data to tableview

        cell.textLabel?.text = city
        
        //cell.textLabel?.text = "\(countries) Section:\(indexPath.section) Row:\(indexPath.row)"
        
        return cell
    }
    
    //data divided into two (2) sections Country and City
    func numberOfSections(in tableView: UITableView) -> Int {
        return countries.count
    }
    

}
    
extension ViewController: UITableViewDelegate {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "currentWeatherSegue" {
            let destinationVC = segue.destination as! CurrentWeatherViewController
            
            
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // what country?
        selectedCountry = countries[indexPath.section]
        //cities in country
        let citiesInCountry = data[selectedCountry!]
        //what city?
        selectedCity = citiesInCountry![indexPath.row] //prints data to tableview
        print("Selected row\(selectedCountry, selectedCity)")
//        performSegue(withIdentifier: "currentWeatherSegue", sender: nil)
        
        let selectedRow = indexPath.row
        
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let country = countries[section]
        switch country {
        case "UK":
            return "United Kingdom"
        case "US":
            return "United States"
        case "JP":
            return "Japan"
        default:
            return "Arab Emirates"
        }
        
    }
        


}
