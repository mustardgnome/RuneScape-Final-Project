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
    
    var skillNames : Array<String>?

    override func viewDidLoad() {
        print(player!.value(forKey: "name")!)
//        player!.value(forKey: "")
        skillNames = ["overall","attack","defence","strength","hitpoints","ranged","prayer","magic","cooking"
        ,"woodcutting","fletching","fishing","firemaking","crafting","smithing","mining","herblore","agility"
            ,"thieving","slayer","farming","runecrafting","hunter","construction"]
        
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return skillNames!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "skillCell", for: indexPath) as! SkillCell

        print(skillNames![indexPath.row])
        let level = player!.value(forKey: skillNames![indexPath.row])
        let currXP = player!.value(forKey: (skillNames![indexPath.row]+"XP"))
        
        cell.skillName.text = skillNames![indexPath.row].uppercased()
        cell.skillLevel.text = "\(level!)"
        cell.currentXP.text = "\(currXP!)"
        

        return cell
    }
    
}
