//
//  Location.swift
//  Sunshine
//
//  Created by Damodar on 16/11/14.
//  Copyright (c) 2014 itsdamslife. All rights reserved.
//

import Foundation
import CoreData

class Location: NSManagedObject {

    @NSManaged var cityName: String
    @NSManaged var lat: String
    @NSManaged var locationSetting: String
    @NSManaged var long: String

}
