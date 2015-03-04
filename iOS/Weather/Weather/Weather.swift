//
//  Weather.swift
//  Weather
//
//  Created by Damodar on 01/03/15.
//  Copyright (c) 2015 itsdamslife. All rights reserved.
//

import UIKit

class Weather: NSObject {
    
    var weatherId: UInt
    var mainStatus: String?

    var desc: String?
    
    var icon: String?

    var temp: Double = 0.0
    var temp_min: Double = 0.0
    var temp_max: Double = 0.0
    var humidity: Double = 0.0
    
    override init() {
        weatherId = 0
        mainStatus = "No Data"
        desc = "No Data Available!"
        icon = "01d"
        
        super.init()
    }
    
}
