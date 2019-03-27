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
    @IBOutlet weak var icon: UIImageView!
    
    
    @IBOutlet weak var imgIcon: UIImageView!
    
    let BASE_URL = "http://api.openweathermap.org/data/2.5/weather"
    let IMAGE_URL = "http://openweathermap.org/img/w/"
    var API_KEY = "a10dbba30194931c77982e032457ec48"
    
    var selectedCity: String?
    var selectedCountry: String?
    var iconId: String?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToForecast" {
            let destinationVC = segue.destination as! WeatherForecastViewController
            destinationVC.selectedCity = self.selectedCity ?? ""
            destinationVC.selectedCountry = self.selectedCountry ?? ""
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // This URL creates the URL for each city clicked on the tableview
        print(selectedCity)
        var city = selectedCity!
        if city != nil {
            city = selectedCity!.replacingOccurrences(of: " ", with:"%20")
        }
        let url = "\(String(describing: BASE_URL))?q=\(String(describing: city)),\(String(describing: selectedCountry!))&units=imperial&apikey=\(String(describing: API_KEY))"
        
        print(url)
        
        
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
                self.iconId = selection.icon!
                
                
                
                let url = "\(String(describing: self.IMAGE_URL))\(String(describing:self.iconId!)).png"
                print(url)
          
                Alamofire.request(url).responseImage { response in
                    debugPrint(response)
                    
                    if let image = response.result.value {
                        DispatchQueue.main.async {
                            print("image downloaded: \(type(of: image))")
                            self.icon.image = image
                        }
                       
                }
            }

                
            }
            
        }
    
    }
}




