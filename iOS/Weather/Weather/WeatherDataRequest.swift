//
//  WeatherDataRequest.swift
//  Weather
//
//  Created by Damodar on 28/02/15.
//  Copyright (c) 2015 itsdamslife. All rights reserved.
//

import UIKit

protocol WeatherDataRequestDelegate {
    
    func dataDownloadedSuccessfully(data: NSData!)
    func dataDownloadedFailed(error: NSError)
}


class WeatherDataRequest: NSObject, NSURLConnectionDataDelegate {
   
    var data: NSMutableData! = NSMutableData()
    var delegate: WeatherDataRequestDelegate?
    
    func requestForData(cityName: String!, numberOfDays: UInt!) {
        
        let urlPath: String = "http://api.openweathermap.org/data/2.5/forecast/daily?q=\(cityName)&cnt=\(numberOfDays)&mode=json"

        var url: NSURL = NSURL(string: urlPath)!
        var request: NSURLRequest = NSURLRequest(URL: url)
        
        // For NSMutableURLRequest
//        request.HTTPBody
//        request.addValue(...)
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("application/json", forHTTPHeaderField: "Accept")

        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {(response, data, error) in
            
            if data?.length != 0 {
                println(NSString(data: data, encoding: NSUTF8StringEncoding))
                if let del = self.delegate {
                    self.delegate?.dataDownloadedSuccessfully(data)
                }
            }
            else {
                if let del = self.delegate {
                    self.delegate?.dataDownloadedFailed(error)
                }
            }
        }
    
    }
}

// network library in swift - swiftHTTP : https://github.com/daltoniam/swiftHTTP
