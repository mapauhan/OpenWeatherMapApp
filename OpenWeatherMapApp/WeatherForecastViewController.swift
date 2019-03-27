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

class WeatherForecastViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let BASE_URL = "http://api.openweathermap.org/data/2.5/forecast"
    let IMAGE_URL = "https://httpbin.org/image/png"
    var API_KEY = "a10dbba30194931c77982e032457ec48"
    
    
    var selectedCity: String?
    var selectedCountry: String?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "forecastCell", for: indexPath)
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // preparing and settig request
        let city = selectedCity!.replacingOccurrences(of: " ", with:"%20")
        let url = "\(String(describing: BASE_URL))?q=\(String(describing: city)),\(String(describing: selectedCountry!))&units=imperial&apikey=\(String(describing: API_KEY))"
        
        let img_url = "\(String(describing: IMAGE_URL))?apikey=\(String(describing: API_KEY))"
        
        print("url : \(url)")
        print("img_url : \(img_url)")
        
        
        
        Alamofire.request(img_url).responseImage { response in
            debugPrint(response)
            
            if let image = response.result.value {
                print("image downloaded: \(type(of: image))")
            }
        }
//
//        let imageCache = AutoPurgingImageCache()
//
//        let urlRequest = URLRequest(url: URL(string: "https://httpbin.org/image/png")!)
//        let avatarImage = UIImage(named: "avatar")!.af_imageRoundedIntoCircle()
//
//        // Add
//        imageCache.add(avatarImage, for: urlRequest, withIdentifier: "circle")
//
//        // Fetch
//        let cachedAvatarImage = imageCache.image(for: urlRequest, withIdentifier: "circle")
        
        
        
        Alamofire.request(url, method: HTTPMethod.post).responseJSON { response in
            
            let weatherData = response.result.value as? [String:Any]
            
//            let avatar = imageCache.image(withIdentifier: "avatar")
            
            //var weatherIcon: UIImage(
            print(weatherData)
            //            self.locationLabel.text = "\(self.selectedCity!), \(self.selectedCountry!)"
            //            if weatherData != nil{
            //                let selection = Weather(weatherData!)
            //                self.tempLabel.text = "\(String(describing: selection.temp!))F"
            //                self.maxTemp.text = "\(String(describing: selection.maxTemp!))F"
            //                self.minTemp.text = "\(String(describing: selection.minTemp!))F"
            //                self.humidity.text = "\(String(describing: selection.humidity!))%"
            //                self.descLabel.text = selection.descrip
            //                self.windSpeed.text = "\(String(describing: selection.windSpeed!))m/hr"
            //                self.windDegree.text = "\(selection.windDegree!)Degrees"
            //                self.cloudyLabel.text = "\(String(describing: selection.cloudy!))%"
            //
            //
            
            
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
}


