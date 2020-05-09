//
//  PlayerTableVC.swift
//  RuneScape_finalproject
//
//  Created by Allan Clarke on 4/27/20.
//  Copyright © 2020 Allan Clarke. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import os.log

class PlayerTableVC: UITableViewController {
    
    var players = [NSManagedObject]()

    override func viewWillAppear(_ animated: Bool) {
        //load data from core data
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"RunescapePlayer")
        var fetchedResults:[NSManagedObject]? = nil
        
        do
        {
            try fetchedResults = managedContext.fetch(fetchRequest) as? [NSManagedObject]
        }
        
        catch
        {
            let nserror = error as NSError
            NSLog("Unable to fetch \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        if let results = fetchedResults
        {
            players = results
        }
        
        self.tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.

        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerCell
        
        // Fetches the appropriate player for the data source layout.
        let player = players[indexPath.row]
        
        cell.playerName.text = "Name: " + (player.value(forKey: "name") as? String)!
        cell.totalLevel.text = "Total level: " + String(describing: player.value(forKey: "overall")!)
        cell.combatLevel.text = "Combat level: " + String(describing: player.value(forKey: "combatLevel")!)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"RunescapePlayer")
        var fetchedResults:[NSManagedObject]? = nil
        
        do
        {
            try fetchedResults = managedContext.fetch(fetchRequest) as? [NSManagedObject]
        }
        
        catch
        {
            let nserror = error as NSError
            NSLog("Unable to fetch \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        if let results = fetchedResults
        {
            players = results
        }
        
        self.tableView.reloadData()
        
        
        if editingStyle == .delete {

            let deletedObject = players[indexPath.row]
            self.players.remove(at: indexPath.row)
            managedContext.delete(deletedObject)
    
            do{
                try managedContext.save()
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            catch let error{
                print("Could not save Deletion \(error)")
            }
        }

    }
}


