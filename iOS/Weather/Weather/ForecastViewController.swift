//
//  ForecastViewController.swift
//  Weather
//
//  Created by Damodar on 28/02/15.
//  Copyright (c) 2015 itsdamslife. All rights reserved.
//

import UIKit

class ForecastViewController: UITableViewController, WeatherDataManagerDelegate {

    var forecastlist: [Weather!]!
    var city: City!
    
    var dataMgr: WeatherDataManager = WeatherDataManager.sharedInstance
    
    var cityName: String?
    var numberOfDays: UInt?
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        cityName = "Bengaluru"
        numberOfDays = 5
        
        // TODO: - Thread this whole stuff up
        fetchForecastData()
        
    }

    func fetchForecastData() {
        
        dataMgr.delegate = self
        dataMgr.fetchForecast(cityName, numberOfDays: numberOfDays)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let fl = forecastlist {
            return forecastlist.count
        }
        return 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("forecastcell", forIndexPath: indexPath) as ForecastViewCell

        
        let weatherDetails = forecastlist[indexPath.row] as Weather!
        
        // Configure the cell...
        cell.summary!.text = "\(weatherDetails.mainStatus!)"
        cell.desc!.text = "\(weatherDetails.desc!)"
        
        let imagePath = "http://openweathermap.org/img/w/\(weatherDetails.icon!).png"
        let url = NSURL(string: imagePath)
        let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
        cell.icon!.image = UIImage(data: data!) as UIImage!
        
        if indexPath.row == 0 {
            cell.day!.text = "Today"
        }
        else if indexPath.row == 1 {
            cell.day!.text = "Tomorrow"
        }
        else {
            
            let week = getDayFor(indexPath.row)
            cell.day!.text = "\(week)"
        }
        
        return cell
    }
    

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "dayDetail" {
            var destVC: DayViewController! = segue.destinationViewController as DayViewController
            
            var selectedRow: NSIndexPath! = self.tableView.indexPathForSelectedRow()
            
            destVC.city = city
            destVC.weather = forecastlist[selectedRow.row]
            
            var cell: ForecastViewCell! = self.tableView.cellForRowAtIndexPath(selectedRow) as ForecastViewCell!
            
            destVC.day = cell.day?.text
        }
    }

    // MARK: - Action methods

    @IBAction func refreshData(sender: UIBarButtonItem) {
        fetchForecastData()
    }

    // MARK: - Day / Date calculation methods
    
    func getDayFor(rowIndex: Int) -> String! {
        var ti = 60 * 60 * 24
        let timeInt = rowIndex * ti
        
        let now = NSDate()
        let futureDate = now.dateByAddingTimeInterval(NSTimeInterval(timeInt))

        return getDayOfWeek(futureDate)
    }
    
    func getDayOfWeek(today:NSDate!) -> String! {
        
        var returnString: String! = ""
        if let todayDate = today {
            let myCalendar = NSCalendar(calendarIdentifier: NSGregorianCalendar)
            let myComponents = myCalendar!.components(.WeekdayCalendarUnit, fromDate: todayDate)
            let weekDay = myComponents.weekday
            
            switch weekDay {
            case 1:
                returnString = "Sunday"
                break
            case 2:
                returnString = "Monday"
                break
            case 3:
                returnString = "Tuesday"
                break
            case 4:
                returnString = "Wednesday"
                break
            case 5:
                returnString = "Thursday"
                break
            case 6:
                returnString = "Friday"
                break
            case 7:
                returnString = "Saturday"
                break
            default:
                returnString = ""
                break
            }
            
            return returnString
        }
        
        return returnString
    }

    // MARK: - Data manager delegates
    func dataDownloadedSuccessfully(city: City, weatherForecast: [Weather]) {
        
        self.city = city
        self.forecastlist = weatherForecast
        
        dispatch_async(dispatch_get_main_queue(), {
            
            self.navigationItem.title = "\(self.city.name!), \(self.city.country!)"
            self.tableView.reloadData()
        })
        dataMgr.delegate = nil
    }
    
    func dataDownloadedFailed(error: NSError) {
        println(error.description)
        dataMgr.delegate = nil
    }

    // Unwinding from About
    @IBAction func unWind(sender: UIStoryboardSegue) {
        
        var abtVC: AboutViewController = sender.sourceViewController as AboutViewController
        
        if !abtVC.cityNameField.text.isEmpty {
            self.cityName = abtVC.cityNameField.text
        }
        else {
            self.cityName = "Bengaluru"
        }
        
        if !abtVC.numberOfDaysField.text.isEmpty{
            
            if let numOfDays = abtVC.numberOfDaysField.text.toInt() {
                self.numberOfDays = UInt(abtVC.numberOfDaysField.text.toInt()!)
            }
            else {
                self.numberOfDays = 7
            }

        }
        else {
            self.numberOfDays = 7
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        self.fetchForecastData()
    }

}
