//
//  CustomCell1.swift
//  OpenWeatherMapApp
//
//  Created by joseph on 3/27/19.
//  Copyright © 2019 Maria Handschu. All rights reserved.
//

import UIKit

class CustomCell1: UITableViewCell {

    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblTemp: UILabel!
    @IBOutlet weak var lblMax: UILabel!
    @IBOutlet weak var lblMin: UILabel!
    @IBOutlet weak var lblHumidity: UILabel!
    @IBOutlet weak var lblCloudy: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("in CustomCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
