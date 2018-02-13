//
//  CoopTableViewController.swift
//  Chicken Coop Attendant
//
//  Created by Kediel on 2/3/18.
//  Copyright © 2018 riOS. All rights reserved.
//

import UIKit

class CoopTableViewController: UITableViewController {
    
    // Mark: Properties
    
    let coopStats = [Coop]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Load coop statistics.
        loadCoopStats()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return coopStats.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "CoopTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CoopTableViewCell else {
            fatalError("The dequeued cell is not an instance of CoopTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let stat = coopStats[indexPath.row]
        
        
        // Configure the cell
        cell.statName.text = stat.name
        cell.status.text = stat.status

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    private func loadCoopStats() {
        
        // variables that will hold boolean value and translate that to on/off based on electric current in PI.
        let status1 = UILabel(named: "currentState")
        let status2 = UILabel(named: "currentState")
        let status3 = UILabel(named: "currentState")
        let status4 = UILabel(named: "currentState")
        let status5 = UILabel(named: "currentState")
        let status6 = UILabel(named: "currentState")
        let status7 = UILabel(named: "currentState")
        let status8 = UILabel(named: "currentState")
        let status9 = UILabel(named: "currentState")
        let status10 = UILabel(named: "currentState")
        let status11 = UILabel(named: "currentState")
        
        /*
        if data == true {
            
            let status1 = UILabel(named: "on/off" = "on")
            
        } else {
            
            let status1 = UILabel(named: "on/off" = "off")
        }
        */
        
        guard let stat1 = Coop(name: "Door Automation", status: status1) else {
            fatalError("Unable to instantiate stat1")
        }
        
        guard let stat2 = Coop(name: "Coop Door", status: status2) else {
            fatalError("Unable to instantiate stat2")
        }
        
        guard let stat3 = Coop(name: "Outdoor Temperature", status: status3) else {
            fatalError("Unable to instantiate stat3")
        }
        
        guard let stat4 = Coop(name: "Coop Temperature", status: status4) else {
            fatalError("Unable to instantiate stat4")
        }
        
        guard let stat5 = Coop(name: "Raspberry Pi Temperature", status: status5) else {
            fatalError("Unable to instantiate stat5")
        }
        
        guard let stat6 = Coop(name: "Light", status: status6) else {
            fatalError("Unable to instantiate stat6")
        }
        
        guard let stat7 = Coop(name: "Heater", status: status7) else {
            fatalError("Unable to instantiate stat7")
        }
        
        guard let stat8 = Coop(name: "Fan", status: status8) else {
            fatalError("Unable to instantiate stat8")
        }
        
        guard let stat9 = Coop(name: "Auxillery", status: status9) else {
            fatalError("Unable to instantiate stat9")
        }
        
        guard let stat10 = Coop(name: "Security", status: status10) else {
            fatalError("Unable to instantiate stat10")
        }
        
        guard let stat11 = Coop(name: "Music", status: status11) else {
            fatalError("Unable to instantiate stat11")
        }
        
        coopStats += [stat1, stat2, stat3, stat4, stat5, stat6, stat7, stat8, stat9, stat10, stat11]
    }
}
