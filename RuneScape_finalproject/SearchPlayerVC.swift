//
//  SearchPlayerVC.swift
//  RuneScape_finalproject
//
//  Created by Allan Clarke on 4/27/20.
//  Copyright © 2020 Allan Clarke. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import os.log


class SearchPlayerVC: UIViewController,  DataProtocol {
   
    
    var allData : NSDictionary?
    var name : String?
    var playerFound:Bool = false
    
    var session = DataSession()
    @IBOutlet weak var playerName: UITextField!
    @IBOutlet weak var updateLabel: UILabel!
    @IBOutlet weak var saveData: UIButton!
    
    var player: Player?
    
    override func viewDidLoad() {
        self.session.delegate = self
        self.updateLabel.text = "Enter a valid player"
    }
    
    @IBAction func checkPlayer(_ sender: Any) {
        name = playerName.text!.replacingOccurrences(of: " ", with: "%20")
        self.updateLabel.text = "Searching for player..."
        self.session.retrieveData(name: name!)

    }
    
    func responseDataHandler(data: NSDictionary)
    {
        allData = data
        DispatchQueue.main.async {
            self.updateLabel.text = "Player found!"
            self.playerFound = true
        }
    }
    
    func responseError(message: String) {
        DispatchQueue.main.async {
            self.updateLabel.text = "Player not found."
        }
    }
    
    @IBAction func savePress(_ sender: Any)
    {
        if playerFound
        {
            addPlayer()
            self.dismiss(animated: true, completion: nil)
        }
        
        else
        {
            self.updateLabel.text = "Can't add invalid player."
        }
    }
    
    func addPlayer()
    {
        name = name!.replacingOccurrences(of: "%20", with: " ")

        self.player = Player(name: name!, skillsDict: allData!)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity = NSEntityDescription.entity(forEntityName: "RunescapePlayer", in: managedContext)
        let corePlayer = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        corePlayer.setValue(player?.overall!, forKey: "overall")
        corePlayer.setValue(player?.overallXP!, forKey: "overallXP")
        
        corePlayer.setValue(player?.attack!, forKey: "attack")
        corePlayer.setValue(player?.attackXP!, forKey: "attackXP")
        
        corePlayer.setValue(player?.strength!, forKey: "strength")
        corePlayer.setValue(player?.strengthXP!, forKey: "strengthXP")
        
        corePlayer.setValue(player?.defence!, forKey: "defence")
        corePlayer.setValue(player?.defenceXP!, forKey: "defenceXP")

        corePlayer.setValue(player?.hitpoints!, forKey: "hitpoints")
        corePlayer.setValue(player?.hitpointsXP!, forKey: "hitpointsXP")

        corePlayer.setValue(player?.ranged!, forKey: "ranged")
        corePlayer.setValue(player?.rangedXP!, forKey: "rangedXP")

        corePlayer.setValue(player?.prayer!, forKey: "prayer")
        corePlayer.setValue(player?.prayerXP!, forKey: "prayerXP")
        
        corePlayer.setValue(player?.magic!, forKey: "magic")
        corePlayer.setValue(player?.magicXP!, forKey: "magicXP")
        
        corePlayer.setValue(player?.cooking!, forKey: "cooking")
        corePlayer.setValue(player?.cookingXP!, forKey: "cookingXP")

        corePlayer.setValue(player?.woodcutting!, forKey: "woodcutting")
        corePlayer.setValue(player?.woodcuttingXP!, forKey: "woodcuttingXP")

        corePlayer.setValue(player?.fletching!, forKey: "fletching")
        corePlayer.setValue(player?.fletchingXP!, forKey: "fletchingXP")
        
        corePlayer.setValue(player?.fishing!, forKey: "fishing")
        corePlayer.setValue(player?.fishingXP!, forKey: "fishingXP")

        corePlayer.setValue(player?.firemaking!, forKey: "firemaking")
        corePlayer.setValue(player?.firemakingXP!, forKey: "firemakingXP")
        
        corePlayer.setValue(player?.crafting!, forKey: "crafting")
        corePlayer.setValue(player?.craftingXP!, forKey: "craftingXP")
        
        corePlayer.setValue(player?.smithing!, forKey: "smithing")
        corePlayer.setValue(player?.smithingXP!, forKey: "smithingXP")

        corePlayer.setValue(player?.mining!, forKey: "mining")
        corePlayer.setValue(player?.miningXP!, forKey: "miningXP")

        corePlayer.setValue(player?.herblore!, forKey: "herblore")
        corePlayer.setValue(player?.herbloreXP!, forKey: "herbloreXP")

        corePlayer.setValue(player?.agility!, forKey: "agility")
        corePlayer.setValue(player?.agilityXP!, forKey: "agilityXP")

        corePlayer.setValue(player?.thieving!, forKey: "thieving")
        corePlayer.setValue(player?.thievingXP!, forKey: "thievingXP")
        
        corePlayer.setValue(player?.slayer!, forKey: "slayer")
        corePlayer.setValue(player?.slayerXP!, forKey: "slayerXP")
        
        corePlayer.setValue(player?.farming!, forKey: "farming")
        corePlayer.setValue(player?.farmingXP!, forKey: "farmingXP")
        
        corePlayer.setValue(player?.runecrafting!, forKey: "runecrafting")
        corePlayer.setValue(player?.runecraftingXP!, forKey: "runecraftingXP")
        
        corePlayer.setValue(player?.hunter!, forKey: "hunter")
        corePlayer.setValue(player?.hunterXP!, forKey: "hunterXP")
        
        corePlayer.setValue(player?.construction!, forKey: "construction")
        corePlayer.setValue(player?.constructionXP!, forKey: "constructionXP")

        corePlayer.setValue(player?.name, forKey: "name")
        corePlayer.setValue(player?.combatLevel, forKey: "combatLevel")

        do {
            try managedContext.save()
        }
        
        catch {
            let nserror = error as NSError
            NSLog("Unable to save \(nserror), \(nserror.userInfo)")
            abort()
        }

    }
           
    @IBAction func cancel(_ sender: UIBarButtonItem) {
            dismiss(animated: true, completion: nil)
    }
}
