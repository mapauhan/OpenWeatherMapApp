//
//  CurrentWeatherViewController.swift
//  OpenWeatherMapApp
//
//  Created by Maria Handschu on 3/21/19.
//  Copyright © 2019 Maria Handschu. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class CurrentWeatherViewController: UIViewController {
    
    //data labels
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var minTemp: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    @IBOutlet weak var windDegree: UILabel!
    @IBOutlet weak var cloudyLabel: UILabel!
    
    @IBOutlet weak var imgIcon: UIImageView!
    
    let BASE_URL = "http://api.openweathermap.org/data/2.5/weather"
    let IMAGE_URL = "http://openweathermap.org/img/w/"
    var API_KEY = "a10dbba30194931c77982e032457ec48"
    
    var selectedCity: String?
    var selectedCountry: String?
    var iconId: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // This URL creates the URL for each city clicked on the tableview
        let city = selectedCity!.replacingOccurrences(of: " ", with:"%20")
        
        let url = "\(String(describing: BASE_URL))?q=\(String(describing: city)),\(String(describing: selectedCountry!))&units=imperial&apikey=\(String(describing: API_KEY))"
        
        Alamofire.request(url, method: HTTPMethod.post).responseJSON { response in
            
            let weatherData = response.result.value as? [String:Any]
            self.locationLabel.text = "\(self.selectedCity!), \(self.selectedCountry!)"
            if weatherData != nil{
                let selection = Weather(weatherData!) 
                self.tempLabel.text = "\(String(describing: selection.temp!))F"
                self.maxTemp.text = "\(String(describing: selection.maxTemp!))F"
                self.minTemp.text = "\(String(describing: selection.minTemp!))F"
                self.humidity.text = "\(String(describing: selection.humidity!))%"
                self.descLabel.text = selection.descrip
                self.windSpeed.text = "\(String(describing: selection.windSpeed!))m/hr"
                self.windDegree.text = "\(selection.windDegree!)Degrees"
                self.cloudyLabel.text = "\(String(describing: selection.cloudy!))%"
                self.iconId = selection.icon ?? "01d"
                
            }
            
            let urlString = "\(String(describing: self.IMAGE_URL))\(String(describing: self.iconId!)).png?apikey=\(self.API_KEY)"
            
            Alamofire.request(urlString).responseImage { response in
                debugPrint(response)
                
                if let image = response.result.value {
                    DispatchQueue.main.async {
                        self.imgIcon.image = image
                    }
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! WeatherForecastViewController
        dest.selectedCity = self.selectedCity ?? ""
        dest.selectedCountry = self.selectedCountry ?? ""
        
    }
    
}
