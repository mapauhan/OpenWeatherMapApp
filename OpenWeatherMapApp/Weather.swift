//
//  Weather.swift
//  OpenWeatherMapApp
//
//  Created by Maria Handschu on 3/22/19.
//  Copyright © 2019 Maria Handschu. All rights reserved.
//

import Foundation

class Weather {
    var temp:  String?
    var maxTemp:  String?
    var minTemp:  String?
    var descrip:  String?
    var humidity:  String?
    var windSpeed:  String?
    var windDegree: String?
    var cloudy: String?
    var icon: String?
    var dtTime: String?
    
    
    
    init(_ Data: [String:Any]) {
       //saves data from OpenWeatherMap API
        print ("Data = \(Data)")
        
        let main = Data["main"] as! NSDictionary //retrieves data into a dictionary
        let clouds = Data["clouds"] as! [String:Any]
        
        let wind = Data["wind"] as! [String:Any]
        
        let weatherArray = Data["weather"] as! [[String:Any]]
        let weather = weatherArray[0]["description"] as! String
        let weatherIcon = weatherArray[0]["icon"] as! String
        
        
        let dtTime = Data["dt_txt"] ?? ""
        
        //from Key: Main
        self.temp =  String(Double(truncating: main["temp"] as! NSNumber))
        self.minTemp = String(Double(truncating: main["temp_min"] as! NSNumber))
        self.humidity = String(Int(truncating: main["humidity"] as! NSNumber))
        self.maxTemp = String(Double(truncating: main["temp_max"] as! NSNumber))
        
        //from Key: Clouds
        self.cloudy = String(Int(truncating: clouds["all"] as! NSNumber))
        
        //from Key: Wind
        self.windSpeed = String(Double(truncating: wind["speed"] as! NSNumber))
        
        if wind["deg"] != nil {
            self.windDegree = String(Double(truncating: wind["deg"] as! NSNumber))
        } else {
            self.windDegree = "0"
        }
        
        //from Key: Weather
        self.descrip = weather as String
        self.icon = weatherIcon as String
        
        
        print ("self.icon = \(self.icon!)")
        
        
        
        
    }
}

class Forecast {
    
    var forecastList: [[String:Any]]
    
    init(_ dailyData: [String:Any]) {
        print("dailyData = \(dailyData)")
        self.forecastList = dailyData["list"] as! [[String:Any]]
    }
}
