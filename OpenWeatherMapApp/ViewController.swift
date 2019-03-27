//
//  ViewController.swift
//  OpenWeatherMapApp
//
//  Created by Maria Handschu on 3/20/19.
//  Copyright © 2019 Maria Handschu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?q=Charlotte,us&units=imperial&appid=a10dbba30194931c77982e032457ec48"
//    let API_KEY = "a10dbba30194931c77982e032457ec48"
    
    let data = AppData().cities
    var countries = [String]() //THIS IS HOW YOU GET A KEY FROM A DICTIONARY
    
    var selectedCountry: String?
    var selectedCity: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries.append(contentsOf: data.keys)
        print(data)
        
        print(countries)
        
        
    }

        //data divided into two (2) sections Country and City
        func numberOfSections(in tableView: UITableView) -> Int {
            
            return countries.count
        }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let country = countries[section]
        let label = UILabel()
        label.backgroundColor = UIColor.lightGray
        return country
    }
    
}

    
    extension ViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            let country = countries[section]
            return data[country]!.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            //this is where data is added to the cell
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let country = self.countries[indexPath.section]//prints data to tableview
            let cities = data[country]
            let city = cities![indexPath.row]
            
            cell.textLabel?.text = city
            
           // cell.textLabel?.text = "\(countries) Section:\(indexPath.section) Row:\(indexPath.row)"
            
            return cell
        }
        
    }
    
    extension ViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            selectedCountry = countries[indexPath.section] //what country
            
            let cityData = data[selectedCountry!]
            
            selectedCity = cityData![indexPath.row]
            
        performSegue(withIdentifier: "currentWeatherSegue", sender: nil)
    }
        
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "currentWeatherSegue" {
                let destinationVC = segue.destination as! CurrentWeatherViewController
                destinationVC.selectedCity = self.selectedCity
                destinationVC.selectedCountry = self.selectedCountry

            }
    }

}
