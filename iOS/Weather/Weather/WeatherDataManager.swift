//
//  WeatherDataManager.swift
//  Weather
//
//  Created by Damodar on 28/02/15.
//  Copyright (c) 2015 itsdamslife. All rights reserved.
//

// Singleton in Swift : http://code.martinrue.com/posts/the-singleton-pattern-in-swift

import UIKit

protocol WeatherDataManagerDelegate {
    
    func dataDownloadedSuccessfully(city: City, weatherForecast: [Weather])
    func dataDownloadedFailed(error: NSError)
}

class WeatherDataManager: NSObject, WeatherDataRequestDelegate {
    
    var dataRequest: WeatherDataRequest = WeatherDataRequest()
    var dataParser: WeatherDataParser = WeatherDataParser()
    
     // Having a delegate for a singleton class is VERY VERY bad design. Lets go for now
    var delegate: WeatherDataManagerDelegate? // TODO: - Design alternative
    
    /* Singleton Shared Instance */
    class var sharedInstance: WeatherDataManager {
        struct Static {
            static var instance: WeatherDataManager?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = WeatherDataManager()
        }
        
        return Static.instance!
    }
    
    
    func fetchForecast(cityName: String!, numberOfDays: UInt!) {
//        let data = NSMutableData() as NSMutableData!
        
        // TODO: - Fetch data from internet if connectivity available
        dataRequest.delegate = self
        dataRequest.requestForData(cityName, numberOfDays: numberOfDays)
        
//        return dataParser.parseData(data)
    }
    
    // MARK: - Data request delegates
    func dataDownloadedSuccessfully(data: NSData!) {
        
        let parsedData = dataParser.parseData(data)
        if let dlgt = delegate {
            delegate!.dataDownloadedSuccessfully(parsedData.city, weatherForecast: parsedData.weatherForecast)
        }
        dataRequest.delegate = nil
    }
    
    func dataDownloadedFailed(error: NSError) {
        if let dlgt = delegate {
            delegate!.dataDownloadedFailed(error)
        }
        dataRequest.delegate = nil
    }

}

