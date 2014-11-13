//
//  DetailViewController.swift
//  Sunshine
//
//  Created by Damodar on 13/11/14.
//  Copyright (c) 2014 itsdamslife. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{
   
    @IBOutlet weak var forecastText: UILabel!
    
    var forecastString :String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        forecastText.text = forecastString
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
