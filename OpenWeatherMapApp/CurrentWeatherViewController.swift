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
    @IBOutlet weak var lblHumy: UILabel!
    @IBOutlet weak var lblDescrip: UILabel!
    @IBOutlet weak var lblVisib: UILabel!
    @IBOutlet weak var lblSpeed: UILabel!
    @IBOutlet weak var lblCloud: UILabel!
    @IBOutlet weak var lblHigh: UILabel!
    @IBOutlet weak var lblLow: UILabel!
    
    var selectedCountry: String?
    var selectedCity: String?
    var BASE_URL: String?
    var API_KEY: String?

  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = BASE_URL! //?? ""
        let city = selectedCity! //?? ""
        let apiKey = API_KEY! //?? ""
        let country = selectedCountry! //?? ""
        
        let uri = "\(String(describing: url))?q=\(String(describing: city)),\(String(describing: country))&APIKEY=\(String(describing: apiKey))"
        
        
        print(uri)
        
        AF.request(uri, method: HTTPMethod.post, encoding: URLEncoding.default).responseJSON { response in
            
            print(response.result.value)
            let data = response.result.value as? [String: Any]
            if data != nil {
                let selection = weather(data!)
                self.lblTemp.text = selection.temperature
                self.lblLow.text = selection.low
                self.lblHigh.text = selection.high
                self.lblHumy.text = selection.humidity
                self.lblCloud.text = selection.cloudy
                self.lblSpeed.text = selection.speed
                self.lblVisib.text = selection.visibility
 //               self.lblDescrip.text = selection.description
            }
        }

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
