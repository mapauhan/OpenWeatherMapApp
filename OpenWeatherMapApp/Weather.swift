//
//  Weather.swift
//  OpenWeatherMapApp
//
//  Created by Maria Handschu on 3/22/19.
//  Copyright © 2019 Maria Handschu. All rights reserved.
//

import Foundation
import UIKit

class Weather {
    var temp:  String?
    var maxTemp:  String?
    var minTemp:  String?
    var descrip:  String?
    var humidity:  String?
    var windSpeed:  String?
    var windDegree:  String?
    var cloudy: String?
    var icon: String?
    
    
    init(_ Data: [String:Any]) {
       //saves data from OpenWeatherMap API
        
        let main = Data["main"] as! NSDictionary //retrieves data into a dictionary
        let clouds = Data["clouds"] as! [String:Any]
        
        let wind = Data["wind"] as! [String:Any]
        
        let weatherArray = Data["weather"] as! [[String:Any]]
        let weather = weatherArray[0]["description"] as! String
        let id = weatherArray[0]["icon"] as! String
        
       
        
        //from Key: Main
        self.temp =  String(Double(truncating: main["temp"] as! NSNumber))
        self.minTemp = String(Double(truncating: main["temp_min"] as! NSNumber))
        self.humidity = String(Int(truncating: main["humidity"] as! NSNumber))
        self.maxTemp = String(Double(truncating: main["temp_max"] as! NSNumber))
        
        //from Key: Clouds
        self.cloudy = String(Int(truncating: clouds["all"] as! NSNumber))
        
        //from Key: Wind
        self.windSpeed = String(Double(truncating: wind["speed"] as! NSNumber))
        
        self.windDegree = String(Double(truncating: wind["deg"]! as! NSNumber))
        
        //from Key: Weather
        self.descrip = weather
        self.icon = id
        
        
        
        
    }
}
