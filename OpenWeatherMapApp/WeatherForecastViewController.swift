//
//  WeatherForecastViewController.swift
//  OpenWeatherMapApp
//
//  Created by Maria Handschu on 3/25/19.
//  Copyright © 2019 Maria Handschu. All rights reserved.
//

import UIKit

class WeatherForecastViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "forecastCell", for: indexPath)
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
