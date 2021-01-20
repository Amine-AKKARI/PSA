//
//  DailyCell.swift
//  WeatherDemoApp
//
//  Created by Amine on 1/18/21.
//  Copyright © 2021 Amine. All rights reserved.
//

import UIKit
import WeatherFramework

class DailyCell: UITableViewCell {

    @IBOutlet var dailyDateLabel: UILabel!
    @IBOutlet var dailyTemperaturesLabel: UILabel!
    @IBOutlet var dailyMainLabel: UILabel!
    @IBOutlet var dailyIconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureWith(dailyViewModel: DailyViewModel) {
        dailyDateLabel.text = dailyViewModel.date
        dailyTemperaturesLabel.text = "\(dailyViewModel.tempMin) / \(dailyViewModel.tempMax)"
        dailyMainLabel.text = dailyViewModel.weather[0].description
        dailyIconImageView.image = dailyViewModel.weather[0].icon
    }
}
