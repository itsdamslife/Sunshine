//
//  City.swift
//  Weather
//
//  Created by Damodar on 01/03/15.
//  Copyright (c) 2015 itsdamslife. All rights reserved.
//

import UIKit

class City: NSObject {
    
    var id: Int
    var name: String?
    var country: String?
    
    override init() {
        
        id = 0
        name = "No Data Available!"
        country = "01d"
        super.init()
    }

}
