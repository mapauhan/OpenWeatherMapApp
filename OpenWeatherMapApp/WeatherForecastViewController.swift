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
    
    @IBOutlet weak var tableview: UITableView!
    
    
    let BASE_URL = "http://api.openweathermap.org/data/2.5/forecast"
    let IMAGE_URL = "http://openweathermap.org/img/w/"
    var API_KEY = "a10dbba30194931c77982e032457ec48"
    
    
    var selectedCity: String?
    var selectedCountry: String?
    var fc: Forecast?
    var imgIcon: UIImage!
    var iconId: String!
    
    func getForecast(completion: @escaping (Array<Dictionary<String, AnyObject>>) -> ())  {
        
        var result = [[String:AnyObject]]()
        // preparing and settig request
        let city = selectedCity!.replacingOccurrences(of: " ", with:"%20")
        let url = "\(String(describing: BASE_URL))?q=\(String(describing: city)),\(String(describing: selectedCountry!))&units=imperial&apikey=\(String(describing: API_KEY))"
        
        let img_url = "\(String(describing: IMAGE_URL))?apikey=\(String(describing: API_KEY))"
        
        
        Alamofire.request(url, method: HTTPMethod.post)
            .responseJSON { (response) -> Void in
                if((response.result.value) != nil) {
                    
                    let rs = response.result.value as! [String:Any]
                    self.fc = Forecast(rs)
                    
                    if self.fc != nil{
                        
                        print(self.fc.debugDescription)
                        
                    }
                    completion(result)
                }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let celNib = UINib(nibName: "CustomCell1", bundle: nil)
        tableview.register(celNib, forCellReuseIdentifier: "CustomCell1")
        
//        self.getForecast() { (result) -> () in
//            print(result)
//        }
        
                // preparing and settig request
                let city = selectedCity!.replacingOccurrences(of: " ", with:"%20")
                let url = "\(String(describing: BASE_URL))?q=\(String(describing: city)),\(String(describing: selectedCountry!))&units=imperial&apikey=\(String(describing: API_KEY))"
        
                let img_url = "\(String(describing: IMAGE_URL))?apikey=\(String(describing: API_KEY))"
        
                print("url : \(url)")
                print("img_url : \(img_url)")
        
        
        
                Alamofire.request(url, method: HTTPMethod.post ).responseJSON { response in
        
                    let rs = response.result.value as! [String:Any]
                    self.fc = Forecast(rs)
        
                    if self.fc != nil{
        
                        print("fc \(self.fc!.forecastList)")
                        self.tableview.reloadData()
        
                    }
                    //                self.tempLabel.text = "\(String(describing: selection.temp!))F"
                    //                self.maxTemp.text = "\(String(describing: selection.maxTemp!))F"
                    //                self.minTemp.text = "\(String(describing: selection.minTemp!))F"
                    //                self.humidity.text = "\(String(describing: selection.humidity!))%"
                    //                self.descLabel.text = selection.descrip
                    //                self.windSpeed.text = "\(String(describing: selection.windSpeed!))m/hr"
                    //                self.windDegree.text = "\(selection.windDegree!)Degrees"
                    //                self.cloudyLabel.text = "\(String(describing: selection.cloudy!))%"
                    //                self.iconId = selection.icon ?? "01d"
                    
                    //                Alamofire.request(img_url).responseImage { response in
                    //                    debugPrint(response)
                    //
                    //                    if let image = response.result.value {
                    //                        DispatchQueue.main.async {
                    //                            self.imgIcon.image = image
                    //                        }
                    //                    }

                }
    
    
    
    
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



extension WeatherForecastViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.fc == nil {
            return 0
        } else {
            return self.fc!.forecastList.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell1",
                                                 for: indexPath) as! CustomCell1
        let list = Weather(self.fc!.forecastList[indexPath.row])
        // print("list = \(list)")
        
        cell.lblTemp.text = "\(String(describing: list.temp!))F"
        cell.lblMax.text = "\(String(describing: list.maxTemp!))F"
        cell.lblMin.text = "\(String(describing: list.minTemp!))F"
        cell.lblHumidity.text = "\(String(describing: list.humidity!))%"
        cell.lblDate.text = "\(String(describing: list.dtTime ?? ""))"
        cell.lblCloudy.text = "\(String(describing: list.descrip!))"
        
        self.iconId = list.icon ?? "01d"
        
        let urlString = "\(String(describing: self.IMAGE_URL))\(String(describing: self.iconId!)).png?apikey=\(self.API_KEY)"
        
        Alamofire.request(urlString).responseImage { response in
            // debugPrint(response)
            
            if let image = response.result.value {
                DispatchQueue.main.async {
                    cell.imgIcon.image = image
                }
            }
        }

        
        return cell
    }
    
    
    
}

extension WeatherForecastViewController: UITableViewDelegate {
    
}
