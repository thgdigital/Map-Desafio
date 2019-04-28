//
//  WeatherTableViewCell.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 28/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import UIKit
import SDWebImage

class WeatherTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    
    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var minLabel: UILabel!
    
    @IBOutlet weak var maxLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupDisplay(display: WeatherDisplayList){
        nameLabel.text = display.name
        tempLabel.text = display.temp
        minLabel.text = display.tempMin
        maxLabel.text = display.tempMax
        messageLabel.text = display.message
        iconImageView.sd_setImage(with: URL(string: display.icon), placeholderImage: UIImage())

    }
    
}
