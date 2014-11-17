//
//  Weather.swift
//  Sunshine
//
//  Created by Damodar on 16/11/14.
//  Copyright (c) 2014 itsdamslife. All rights reserved.
//

import Foundation
import CoreData

class Weather: NSManagedObject {

    @NSManaged var date: NSDate
    @NSManaged var degrees: String
    @NSManaged var humidity: String
    @NSManaged var max: String
    @NSManaged var min: String
    @NSManaged var pressure: String
    @NSManaged var shortDesc: String
    @NSManaged var weatherId: String
    @NSManaged var windSpeed: String
    @NSManaged var locationId: Location
    @NSManaged var details: NSManagedObject

}
