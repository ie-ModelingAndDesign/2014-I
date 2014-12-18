//
//  ViewController.swift
//  Modeling
//
//  Created by haruki sakamoto on 2014/11/20.
//  Copyright (c) 2014年 haruki sakamoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func changeDatePicker(sender: UIDatePicker) {
        let df = NSDateFormatter()
        df.dateFormat = "yyyy/MM/dd HH:mm:ss"
        var dateStr = df.stringFromDate(sender.date)
        println(dateStr)
    }
    
    
}


