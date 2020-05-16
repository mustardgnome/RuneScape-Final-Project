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
        self.tableView.backgroundColor = UIColor.brown
        let playerName = (player!.value(forKey: "name") as? String)!
        self.title =   "\(playerName) Stats"
        
        skillNames = ["overall","attack","defence","strength","hitpoints","ranged","prayer","magic","cooking","woodcutting","fletching","fishing","firemaking","crafting","smithing","mining","herblore","agility"
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

  //      print(skillNames![indexPath.row])
        let level = player!.value(forKey: skillNames![indexPath.row])
        let currXP = player!.value(forKey: (skillNames![indexPath.row]+"XP"))
        
        if ("\(currXP!)" != "-1" && indexPath.row != 0){
            let curSkill = skillNames![indexPath.row]
            cell.skillName.text = curSkill.uppercased()
            cell.skillLevel.text = "Level: \(level!)"
            cell.currentXP.text = "Experience: \(currXP!)"
            cell.skillImage.image = UIImage(named: curSkill)
            }
        
        else {
            cell.isHidden = true
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let currXP = player!.value(forKey: (skillNames![indexPath.row]+"XP"))
 //       print(String(describing: currXP!))
        if(String(describing: currXP!) == "-1" || indexPath.row == 0){
            return 0.0
        }
        return UITableView.automaticDimension
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "singleSegue") {
            let indexPath = tableView.indexPathForSelectedRow!.row
            let vc = segue.destination as! SkillProgressVC
            vc.player = player!
            vc.skill = skillNames![indexPath]
        }
    }
    
}
