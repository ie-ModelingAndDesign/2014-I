//
//  ViewController.swift
//  modelingtest1
//
//  Created by yuta touyama on 2014/11/19.
//  Copyright (c) 2014年 yuta touyama. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myButton.setTitle("通知したい日時を設定する", forState: UIControlState.Normal)
        
        var calenderView:CalenderView = CalenderView(frame: CGRectMake(0, 20,
        UIScreen.mainScreen().bounds.size.width, 500));
        self.view.addSubview(calenderView)
    }
    
   
    @IBAction func TapButton(sender: AnyObject) {
        println("Hoge")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func returnMenu(segue: UIStoryboardSegue){
    }
}

