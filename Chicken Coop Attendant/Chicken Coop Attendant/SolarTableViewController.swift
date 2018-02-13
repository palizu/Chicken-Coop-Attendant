//
//  SolarTableViewController.swift
//  Chicken Coop Attendant
//
//  Created by Kediel on 2/3/18.
//  Copyright © 2018 riOS. All rights reserved.
//

import UIKit

class SolarTableViewController: UITableViewController {

    let solarStats = [Solar]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Load solar statistics
        loadSolarStats()
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
        
        
        return solarStats.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "SolarTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SolarTableViewCell else {
            fatalError("The dequeued cell is not an instance of SolarTableViewCell.")
        }
        
        let stat = solarStats[indexPath.row]

        // Configure the cell
        cell.statName.text = stat.name
        cell.data.text = stat.data

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
    
    private func loadSolarStats() {
        
        // variables that will hold boolean value and translate that to on/off based on electric current in PI.
        let status1 = UILabel(named: "data")
        let status2 = UILabel(named: "data")
        let status3 = UILabel(named: "data")
        let status4 = UILabel(named: "data")
        let status5 = UILabel(named: "data")
        let status6 = UILabel(named: "data")
        let status7 = UILabel(named: "data")
        let status8 = UILabel(named: "data")
        
        /*
         if data == true {
         
         let status1 = UILabel(named: "on/off" = "on")
         
         } else {
         
         let status1 = UILabel(named: "on/off" = "off")
         }
         */
        
        guard let stat1 = Solar(name: "GPS Location:", status: status1) else {
            fatalError("Unable to instantiate stat1")
        }
        
        guard let stat2 = Solar(name: "Today's Date:", status: status2) else {
            fatalError("Unable to instantiate stat2")
        }
        
        guard let stat3 = Solar(name: "Current Local Time:", status: status3) else {
            fatalError("Unable to instantiate stat3")
        }
        
        guard let stat4 = Solar(name: "Sun Rise:", status: status4) else {
            fatalError("Unable to instantiate stat4")
        }
        
        guard let stat5 = Solar(name: "Sun Set:", status: status5) else {
            fatalError("Unable to instantiate stat5")
        }
        
        guard let stat6 = Solar(name: "First Light:", status: status6) else {
            fatalError("Unable to instantiate stat6")
        }
        
        guard let stat7 = Solar(name: "Last Light:", status: status7) else {
            fatalError("Unable to instantiate stat7")
        }
        
        guard let stat8 = Solar(name: "Day Length:", status: status8) else {
            fatalError("Unable to instantiate stat8")
        }
        
        solarStats += [stat1, stat2, stat3, stat4, stat5, stat6, stat7, stat8]
    }
}
