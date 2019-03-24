//
//  weather.swift
//  OpenWeatherMapApp
//
//  Created by Lorena Handschu on 3/23/19.
//  Copyright © 2019 Maria Handschu. All rights reserved.
//

import Foundation

class weather {
    var temperature: String
    var low: String
    var high: String
    var humidity: String
    
    var cloudy: String
    var speed: String
    var visibility: String
    var description: String
    
    init(_ data:[String:Any]) {
        
        let main = data["main"] as! NSDictionary
        let clouds = data["clouds"] as! [String:Any]
        let wind = data["wind"] as! [String:Any]
        let weatherArray = data["weather"] as! NSArray
        let weather = weatherArray[0] as! [String:Any]
        
        self.temperature = String(Double(truncating: main["temp"] as! NSNumber))
        self.low = String(Double(truncating: main["temp_min"] as! NSNumber))
        self.high = String(Double(truncating: main["temp_max"] as! NSNumber))
        self.humidity = String(Int(truncating: main["humidity"] as! NSNumber))
        self.cloudy = String(Int(truncating: clouds["all"] as! NSNumber))
        self.speed = String(Double(truncating: wind["speed"] as! NSNumber))
        self.visibility = String(Double(truncating: data["visibility"] as! NSNumber))
        self.description = String(weather["description"] as! NSString).uppercased()

    }
}
//{"coord":{"lon":-80.84,"lat":35.23},
//"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01n"}],
//    "base":"stations",
//    "main":{"temp":281.47,"pressure":1025,"humidity":56,"temp_min":278.15,"temp_max":284.26},
//    "visibility":16093,
//    "wind":{"speed":1.76,"deg":41.502},
//    "clouds":{"all":1},
//    "dt":1553392820,
//    "sys":{"type":1,"id":4538,"message":0.0084,"country":"US","sunrise":1553340182,"sunset":1553384210},
//    "id":4460243,
//    "name":"Charlotte",
//    "cod":200}
