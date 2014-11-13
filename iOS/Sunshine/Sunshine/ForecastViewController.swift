//
//  ForecastViewController.swift
//  Sunshine
//
//  Created by Damodar on 12/11/14.
//  Copyright (c) 2014 itsdamslife. All rights reserved.
//

import UIKit

class ForecastViewController: UITableViewController
{
    
    @IBOutlet weak var forecastTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cellIdentifier :NSString! = "Cell"
        var cell :UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as UITableViewCell
        
        if(cell == nil)
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle , reuseIdentifier: cellIdentifier)
        }
        
        var str = "Row number \(indexPath.row)"
        cell.textLabel.text = str
        str = "Section# \(indexPath.section)"
        cell.detailTextLabel?.text = str
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        println("Cell # \(indexPath.row) tapped!")
        let str = "Row number \(indexPath.row) from Section \(indexPath.section)"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        println("===========preparing Segue===========")
        
        if(segue.identifier == "showdetail")
        {
            println("Segue prepared!")
            
            var dvc :DetailViewController! = segue.destinationViewController as DetailViewController
            
            if(sender != nil) {
                let cell = sender as UITableViewCell!
                dvc.forecastString = cell.textLabel.text
            }
        }
    }
    
}

