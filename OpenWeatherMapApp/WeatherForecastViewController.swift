//
//  WeatherForecastViewController.swift
//  OpenWeatherMapApp
//
//  Created by Maria Handschu on 3/25/19.
//  Copyright © 2019 Maria Handschu. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class WeatherForecastViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var selectedCountry: String?
    var selectedCity: String = ""
    var data: [DailyData] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //cellNib
        let cellNib = UINib.init(nibName: "CustomCellTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "forecastCell" )
        tableView.reloadData()
        
        // let BASE_URL = "http://api.openweathermap.org/data/2.5/weather"
        let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast"
        let IMG_URL = "http://openweathermap.org/img/w/"
        var API_KEY = "a10dbba30194931c77982e032457ec48"
        
        let city = selectedCity
        if city != nil {
            selectedCity.replacingOccurrences(of: " ", with:"%20")
        }
        let url = "\(String(describing: FORECAST_URL))?q=\(String(describing: city)),\(String(describing: selectedCountry!))&units=imperial&apikey=\(String(describing: API_KEY))"
        
        Alamofire.request(url, method: .post, parameters: nil).responseJSON { response in
            let forecastData = response.result.value as? [String:Any]
            print(forecastData)
            // self.locationLabelF.text = "\(self.selectedCity!), \(self.selectedCountry!)"
            if forecastData != nil {
                let selection = Forecast(forecastData!)
                print(selection)
//                self.tempLabel.text = "\(String(describing: selection.temp!))F"
//                self.maxTemp.text = "\(String(describing: selection.maxTemp!))F"
//                self.minTemp.text = "\(String(describing: selection.minTemp!))F"
//                self.humidity.text = "\(String(describing: selection.humidity!))%"
//                self.descLabel.text = selection.descrip
            }
        }
        
        Alamofire.request(IMG_URL).responseImage { (response) in
            debugPrint(response)
            print(response.request)
            print(response.result)
            
        }
        
        
    }
}
    
    
    extension WeatherForecastViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 5
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "forecastCell", for: indexPath) as! CustomCellTableViewCell
            
            return cell
        }
}
        
        extension WeatherForecastViewController: UITableViewDelegate {
            func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                
                //            selectedCountry = countries[indexPath.section] //what country
                //
                //            let cityData = data[selectedCountry!]
                //
                //            selectedCity = cityData![indexPath.row]
                
                performSegue(withIdentifier: "segueToForecast", sender: nil)
}


}

