//
//  CurrentWeatherViewController.swift
//  OpenWeatherMapApp
//
//  Created by Maria Handschu on 3/21/19.
//  Copyright © 2019 Maria Handschu. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeatherViewController: UIViewController {
    
    @IBOutlet weak var lblTemp: UILabel!
    
    var selectedCountry: String?
    var selectedCity: String?
    var BASE_URL: String?
    var API_KEY: String?

  
    override func viewDidLoad() {
        super.viewDidLoad()

//        let parameters: Parameters = [
//            "country": self.selectedCountry,
//            "city": self.selectedCity,
//            "app_key": self.API_KEY
//        ]
        
        let url = BASE_URL! //?? ""
        let city = selectedCity! //?? ""
        let apiKey = API_KEY! //?? ""
        let country = selectedCountry! //?? ""
        
        let uri = "\(String(describing: url))?q=\(String(describing: city)),\(String(describing: country))&APIKEY=\(String(describing: apiKey))"
        
        
        print(uri)
        
        AF.request(uri, method: HTTPMethod.post).responseJSON { response in
            
            print(response.result.value)
            
            let data = response.result.value as! [String: Any]
            
            let main = data["main"] as! [String:Any]
            
            let temp = main["temp"] as! NSNumber
            
            self.lblTemp.text = String(Double(truncating: temp))
            print(temp)
            
        }
        //a10dbba30194931c77982e032457ec48
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
