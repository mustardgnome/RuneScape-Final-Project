//
//  Player.swift
//  RuneScape_finalproject
//
//  Created by Allan Clarke on 4/27/20.
//  Copyright © 2020 Allan Clarke. All rights reserved.
//

import Foundation

class Player
{
    private var _name: String = "Unknown"
 //   private var _combatLevel: Int = 0
    private var _skillsDictionary: NSDictionary = [:]
    // skill order (number starting at 0): 0 Overall, 1 Attack, 2 Defence, 3 Strength, 4 Hitpoints, 5 Ranged, 6 Prayer, 7 Magic, 8 Cooking, 9 Woodcutting, 10 Fletching, 11 Fishing, 12 Firemaking, 13 Crafting, 14 Smithing, 15 Mining, 16 Herblore, 17 Agility, 18 Thieving, 19 Slayer, 20 Farming, 21 Runecrafting, 22 Hunter, 23 Construction
    
    private var _combatLevel:Int?
    
    var overall:Int?
    var overallXP:Int?
    var attack:Int?
    var attackXP:Int?
    var defence:Int?
    var defenceXP:Int?
    var strength:Int?
    var strengthXP:Int?
    var hitpoints:Int?
    var hitpointsXP:Int?
    var ranged:Int?
    var rangedXP:Int?
    var prayer:Int?
    var prayerXP:Int?
    var magic:Int?
    var magicXP:Int?
    var cooking:Int?
    var cookingXP:Int?
    var woodcutting:Int?
    var woodcuttingXP:Int?
    var fletching:Int?
    var fletchingXP:Int?
    var fishing:Int?
    var fishingXP:Int?
    var firemaking:Int?
    var firemakingXP:Int?
    var crafting:Int?
    var craftingXP:Int?
    var smithing:Int?
    var smithingXP:Int?
    var mining:Int?
    var miningXP:Int?
    var herblore:Int?
    var herbloreXP:Int?
    var agility:Int?
    var agilityXP:Int?
    var thieving:Int?
    var thievingXP:Int?
    var slayer:Int?
    var slayerXP:Int?
    var farming:Int?
    var farmingXP:Int?
    var runecrafting:Int?
    var runecraftingXP:Int?
    var hunter:Int?
    var hunterXP:Int?
    var construction:Int?
    var constructionXP:Int?

    var name: String {
        get{
            return self._name
        }
        set (newName) {
            self._name = newName
        }
    }
    
    var skillsDictionary: NSDictionary {
        get{
            return self._skillsDictionary
        }
        set (newSkills) {
            self._skillsDictionary = newSkills
        }
    }
    
    var combatLevel: Int{
        get{
            return self._combatLevel!
        }
        
        set(newCb) {
            self._combatLevel = calculateCombatLevel()
        }
    }
    
    func calculateCombatlevel() -> Int
    {
        
        return 1
    }
    
    init( name: String, skillsDict: NSDictionary){
        self.name = name
        self.skillsDictionary = skillsDict
        setSkills()
        self.combatLevel = calculateCombatLevel()
        
    }
    
    func calculateCombatLevel() -> Int
    {
        print(self.agilityXP!)
        print(self.overall!)

        
        let baseCombat:Double = 0.25*(Double(self.defence!) + Double(self.hitpoints!) + floor(Double(self.prayer!)/2))
        let meleeCombat:Double = 0.325*Double(self.attack! + self.strength!)
        let rangeCombat:Double = 0.325*Double(floor(3*Double(self.ranged!)/2))
        let mageCombat:Double = 0.325*Double(floor(3*Double(self.magic!)/2))
        
        let combats = [meleeCombat, rangeCombat, mageCombat]
        
        let combatLevel = baseCombat + combats.max()!
        
        return Int(combatLevel)
    }
    
    func setSkills()
    {
        let overall = self.skillsDictionary.object(forKey: "0") as! [String]
        let attack = self.skillsDictionary.object(forKey: "1") as! [String]
        let defence = self.skillsDictionary.object(forKey: "2") as! [String]
        let strength = self.skillsDictionary.object(forKey: "3") as! [String]
        let hitpoints = self.skillsDictionary.object(forKey: "4") as! [String]
        let ranged = self.skillsDictionary.object(forKey: "5") as! [String]
        let prayer = self.skillsDictionary.object(forKey: "6") as! [String]
        let magic = self.skillsDictionary.object(forKey: "7") as! [String]
        let cooking = self.skillsDictionary.object(forKey: "8") as! [String]
        let woodcutting = self.skillsDictionary.object(forKey: "9") as! [String]
        let fletching = self.skillsDictionary.object(forKey: "10") as! [String]
        let fishing = self.skillsDictionary.object(forKey: "11") as! [String]
        let firemaking = self.skillsDictionary.object(forKey: "12") as! [String]
        let crafting = self.skillsDictionary.object(forKey: "13") as! [String]
        let smithing = self.skillsDictionary.object(forKey: "14") as! [String]
        let mining = self.skillsDictionary.object(forKey: "15") as! [String]
        let herblore = self.skillsDictionary.object(forKey: "16") as! [String]
        let agility = self.skillsDictionary.object(forKey: "17") as! [String]
        let thieving = self.skillsDictionary.object(forKey: "18") as! [String]
        let slayer = self.skillsDictionary.object(forKey: "19") as! [String]
        let farming = self.skillsDictionary.object(forKey: "20") as! [String]
        let runecrafting = self.skillsDictionary.object(forKey: "21") as! [String]
        let hunter = self.skillsDictionary.object(forKey: "22") as! [String]
        let construction = self.skillsDictionary.object(forKey: "23") as! [String]
        
        self.overall = Int(overall[1])!
        self.overallXP = Int(overall[2])!
        self.attack = Int(attack[1])!
        self.attackXP = Int(attack[2])!
        self.defence = Int(defence[1])!
        self.defenceXP = Int(defence[2])!
        self.strength = Int(strength[1])!
        self.strengthXP = Int(strength[2])!
        self.hitpoints = Int(hitpoints[1])!
        self.hitpointsXP = Int(hitpoints[2])!
        self.ranged = Int(ranged[1])!
        self.rangedXP = Int(ranged[2])!
        self.prayer = Int(prayer[1])!
        self.prayerXP = Int(prayer[2])!
        self.magic = Int(magic[1])!
        self.magicXP = Int(magic[2])!
        self.cooking = Int(cooking[1])!
        self.cookingXP = Int(cooking[2])!
        self.woodcutting = Int(woodcutting[1])!
        self.woodcuttingXP = Int(woodcutting[2])!
        self.fletching = Int(fletching[1])!
        self.fletchingXP = Int(fletching[2])!
        self.fishing = Int(fishing[1])!
        self.fishingXP = Int(fishing[2])!
        self.firemaking = Int(firemaking[1])!
        self.firemakingXP = Int(firemaking[2])!
        self.crafting = Int(crafting[1])!
        self.craftingXP = Int(crafting[2])!
        self.smithing = Int(smithing[1])!
        self.smithingXP = Int(smithing[2])!
        self.mining = Int(mining[1])!
        self.miningXP = Int(mining[2])!
        self.herblore = Int(herblore[1])!
        self.herbloreXP = Int(herblore[2])!
        self.agility = Int(agility[1])!
        self.agilityXP = Int(agility[2])!
        self.thieving = Int(thieving[1])!
        self.thievingXP = Int(thieving[2])!
        self.slayer = Int(slayer[1])!
        self.slayerXP = Int(slayer[2])!
        self.farming = Int(farming[1])!
        self.farmingXP = Int(farming[2])!
        self.runecrafting = Int(runecrafting[1])!
        self.runecraftingXP = Int(runecrafting[2])!
        self.hunter = Int(hunter[1])!
        self.hunterXP = Int(hunter[2])!
        self.construction = Int(construction[1])!
        self.constructionXP = Int(construction[2])!
    }
}
