//
//  SkillsTableVC.swift
//  RuneScape_finalproject
//
//  Created by Allan Clarke on 4/27/20.
//  Copyright © 2020 Allan Clarke. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import os.log

class SkillsTableVC: UITableViewController {
    
    var player : NSManagedObject?
    
    override func viewDidLoad() {
        print(player!.value(forKey: "name")!)
    }
    
    
}
