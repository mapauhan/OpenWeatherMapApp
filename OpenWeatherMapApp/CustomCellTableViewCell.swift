//
//  CustomCellTableViewCell.swift
//  OpenWeatherMapApp
//
//  Created by Maria Handschu on 3/26/19.
//  Copyright © 2019 Maria Handschu. All rights reserved.
//

import UIKit

class CustomCellTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dt_timeLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var minTemp: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
