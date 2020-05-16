//
//  SkillProgressVC.swift
//  RuneScape_finalproject
//
//  Created by Allan Clarke on 4/27/20.
//  Copyright © 2020 Allan Clarke. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class SkillProgressVC: UIViewController
{
    @IBOutlet weak var skillImage: UIImageView!
    @IBOutlet weak var xpProgressView: UIProgressView!
    @IBOutlet weak var remainingXP: UILabel!
    @IBOutlet weak var currentXP: UILabel!
    @IBOutlet weak var skillLevel: UILabel!
    
    var player : NSManagedObject?
    var skill: String?
    
    override func viewDidLoad()
    {
        self.remainingXP.isHidden = true
        
        self.title = skill!.capitalized
        
        let level = (player!.value(forKey: (skill!)) as? Int)!
        let currXP = (player!.value(forKey: (skill! + "XP")) as? Int)!

        self.skillLevel.text = "Level: \(String(describing: level))"
        self.currentXP.text = "Current XP: \(String(describing: currXP))"
        
        self.skillImage.image = UIImage(named: skill!)
        
        self.xpProgressView.transform = xpProgressView.transform.scaledBy(x: 1, y: 20)
        let progress = Float(Float(currXP) / Float(13034431))
        self.xpProgressView.progress = progress
        
        if level < 99 {
             self.remainingXP.isHidden = false

            let nextLevel = level + 1
            let xpLeft = calcXPForLevel(x: (nextLevel))
            self.remainingXP.text = "XP to next level: \(xpLeft)"
        }
    }

    func calcXPForLevel(x:Int) -> Int
    {
        let xp = (Decimal(x - 1) + 300*pow(2, (x-1)/7 )  )/4
 //       print(xp)
        let result = NSDecimalNumber(decimal: xp)
        return result.intValue
    }
    
}
