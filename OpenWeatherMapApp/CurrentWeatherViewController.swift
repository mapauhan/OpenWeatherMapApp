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
    var iconId: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // This URL creates the URL for each city clicked on the tableview
        let city = selectedCity!.replacingOccurrences(of: " ", with:"%20")
        
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
                
                self.iconId = selection.icon ?? "20n"
                
                
                
                
                
                
                
                //            }
                //
                //            let main = weatherData["main"] as! [String:Any]
                //
                //            //key: main for values temp, maxTemp, minTemp, humidity
                //            let temp = main["temp"]!
                //            print(temp)
                //
                //
                //            let wind = weatherData["wind"] as! [String:Any]
                //
                //            let windData = wind["speed"]!
                //                            wind["deg"]
                
                //let clouds = weatherData["clouds"] as [String:Any]
                
                // let cloudy = clouds["all"]
                
                // self.tempLabel.text = temp as! String
                
                //            self.maxTemp.text = (main["temp_max"]! as! String)
                //            self.minTemp.text = (main["temp_min"]! as! String)
                //            self.humidity.text = (main["humidity"]! as! String)
                //
            }
            
        }

        
        let imageCache = AutoPurgingImageCache()
        //let urlString = "http://openweathermap.org/img/w/10d.png"
        
        let urlString = "\(String(describing: IMAGE_URL))\(self.iconId).png"
        
        //let urlRequest = URLRequest(url: URL(urlString))
        
        print(urlString)
        
        // Add
        //imageCache.add(avatarImage, for: urlRequest, withIdentifier: "circle")
        
        // Fetch
        //let cachedAvatarImage = imageCache.image(for: urlRequest, withIdentifier: "circle")
        
        
        Alamofire.request(urlString).responseImage { response in
            debugPrint(response)
            
            if let image = response.result.value {
                //DispatchQueue.main.async {
                    print("image downloaded: \(type(of: image))")
                    self.imgIcon.image = image
                //}
                
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let dest = segue.destination as! WeatherForecastViewController
        dest.selectedCity = self.selectedCity ?? ""
        dest.selectedCountry = self.selectedCountry ?? ""
        
    }
    
}
