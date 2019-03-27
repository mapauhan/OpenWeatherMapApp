//
//  Forecast.swift
//  OpenWeatherMapApp
//
//  Created by Maria Handschu on 3/26/19.
//  Copyright © 2019 Maria Handschu. All rights reserved.
//

import Foundation

class Forecast {
    var dt_time: String?
    var temp: String?
    var maxTemp: String?
    var minTemp: String?
    var humidity: String?
    var descrip: String?
    var icon: String?
    var cloudy: String?
    
    init(_ dailyData: [String:Any]) {
            //saves data from OpenWeatherMap API
        
        let list = dailyData["list"] as! [[String:Any]]
            let main = list[0]["main"] as! [String:Any] //retrieves data into a dictionary
            let clouds = list[0]["clouds"] as! [String:Any]
           // let dtTxt = list[0]["dt_txt"] as! [String:Any]
        
            let weatherArray = list[0]["weather"] as! [[String:Any]]
            let weather = weatherArray[0]["description"] as! String
            let weatherIcon = weatherArray[0]["icon"] as! String
            
            
            
            //from Key: Main
            self.temp =  String(Double(truncating: main["temp"] as! NSNumber))
            self.minTemp = String(Double(truncating: main["temp_min"] as! NSNumber))
            self.humidity = String(Int(truncating: main["humidity"] as! NSNumber))
            self.maxTemp = String(Double(truncating: main["temp_max"] as! NSNumber))
            
            //from Key: Clouds
            self.cloudy = String(Int(truncating: clouds["all"] as! NSNumber))
        
            //from Key: Weather
         //   self.descrip = weather["description"] as! String
          //  self.icon = weatherIcon["icon"] as! String
            
        
    }
}
