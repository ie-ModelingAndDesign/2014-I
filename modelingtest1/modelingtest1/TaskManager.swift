//
//  TaskManager.swift
//  modelingtest1
//
//  Created by yuta touyama on 2014/12/17.
//  Copyright (c) 2014年 yuta touyama. All rights reserved.
//

import Foundation
import UIKit

var taskMgr: TaskManager = TaskManager()

struct task {
    var name = "Un-Named"
    var desc = "Un-Described"
}

class TaskManager: NSObject {
    
    var tasks : [task] = []
    
    func addTask(name : String, desc: String){
        tasks.append(task(name: name, desc: desc))
    }
}
