//
//  AboutViewController.swift
//  Weather
//
//  Created by Damodar on 01/03/15.
//  Copyright (c) 2015 itsdamslife. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var cityNameField: UITextField!
    @IBOutlet weak var numberOfDaysField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        var tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "goBack:")
//        self.view.addGestureRecognizer(tapGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

//    @IBAction func goBack(sender: UIButton) {
//        
//        dismissViewControllerAnimated(true, completion: nil)
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
