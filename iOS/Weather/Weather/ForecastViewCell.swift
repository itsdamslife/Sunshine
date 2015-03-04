//
//  ForecastViewCell.swift
//  Weather
//
//  Created by Damodar on 01/03/15.
//  Copyright (c) 2015 itsdamslife. All rights reserved.
//

import UIKit

class ForecastViewCell: UITableViewCell {

    @IBOutlet var summary: UILabel?
    @IBOutlet var desc: UILabel?
    @IBOutlet var day: UILabel?
    @IBOutlet var icon: UIImageView?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
