//
//  DayViewController.swift
//  Weather
//
//  Created by Damodar on 28/02/15.
//  Copyright (c) 2015 itsdamslife. All rights reserved.
//

import UIKit

class DayViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var summary: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var tempLow: UILabel!
    @IBOutlet weak var tempHigh: UILabel!
    @IBOutlet weak var humidity: UILabel!
    
    var city: City!
    var weather: Weather!
    var day: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let imagePath = "http://openweathermap.org/img/w/\(weather.icon!).png"
        let url = NSURL(string: imagePath)
        let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
        imageView.image = UIImage(data: data!) as UIImage!
        
        summary.text = weather.mainStatus
        desc.text = weather.desc
        tempLow.text = "\(weather.temp_min - 273.15)°C"
        tempHigh.text = "\(weather.temp_max - 273.15)°C"
        humidity.text = "\(weather.humidity) %"
        
        self.navigationItem.title = day
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
