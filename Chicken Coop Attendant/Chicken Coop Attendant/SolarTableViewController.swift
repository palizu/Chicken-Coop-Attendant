//
//  SolarTableViewController.swift
//  Chicken Coop Attendant
//
//  Created by Kediel on 2/3/18.
//  Copyright © 2018 riOS. All rights reserved.
//

/* References:
 https://developer.apple.com/documentation/corelocation/cllocation
 https://spin.atomicobject.com/2015/03/09/ios-sunrise-sunset-corelocation/
 https://developer.apple.com/library/content/documentation/Swift/Conceptual/BuildingCocoaApps/Migration.html
 https://stackoverflow.com/questions/24063798/cllocation-manager-in-swift-to-get-location-of-user
 https://developer.apple.com/library/content/documentation/Swift/Conceptual/BuildingCocoaApps/MixandMatch.html
 https://stackoverflow.com/questions/33964013/trying-to-use-the-edsunriseset-sdk-on-swift-but-getting-weird-sunset-times
 */

import UIKit
import CoreLocation

class SolarTableViewController: UITableViewController {

    let solarStats = [Solar]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Load solar statistics
        loadSolarStats()
        
        // Get permissions for Location features.
        let locationManager = CLLocationManager()
        locationManager.delegate = self as? CLLocationManagerDelegate
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
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
    
    // Mark: Load Data
    
//------------------------------------------Location---------------------------------------//
    // Initializes and returns a location object with the specified latitude and longitude.
    
    init(latitude: CLLocationDegrees, longitude: CLLocationDegrees){
    
    }
    
    init(coordinate: CLLocationCoordinate2D, altitude: CLLocationDistance, horizontalAccuracy: CLLocationAccuracy, verticalAccuracy: CLLocationAccuracy, timestamp: Date) {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Get the location attributes
    
    var coordinate: CLLocationCoordinate2D
    var altitude: CLLocationDistance
    // var floor: CLFloor? // The logical floor of a building in which the user is located.
    var horizontalAccuracy: CLLocationAccuracy
    var verticalAccuracy: CLLocationAccuracy
    var timestamp: Date
    
    
    // Get the current date and time
    let currentDateTime = Date()
    
    // get the user's calendar
    let userCalendar = Calendar.current
    
    // choose which date and time components are needed
    let requestedComponents: Set<Calendar.Component> = [
        .year,
        .month,
        .day,
        .hour,
        .minute,
        .second
    ]
    
    // get the components
    //You can't use bounds in a let because it doesn't exist when that property is created because it belongs to self. So at init self isn't complete yet. But if you use a lazy var, then self and its property bounds will be ready by the time you need it.
    lazy var dateTimeComponents = userCalendar.dateComponents(requestedComponents, from: currentDateTime)
    
    /* Now the components are available to implement
    dateTimeComponents.year   // 2018
    dateTimeComponents.month  // 10
    dateTimeComponents.day    // 8
    dateTimeComponents.hour   // 22
    dateTimeComponents.minute // 42
    dateTimeComponents.second // 17
    */
    
//-------------------------Sunrise/Sunset using CoreLocation-------------------------------//

    // Receive the data
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations:[CLLocation]) {
    }
    
    // Incorporate the Data
    var sunInfo = EDSunriseSet.sunriseset(withTimezone: timeZone, latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
    
    // Call the methods
    var NTwilight = sunInfo.calculateNauticalTwilight(Date())
    var todaySunrise = sunInfo.calculateSunrise(Date())
    var todaySunset = sunInfo.calculateSunset(Date())
    
    
//--------------------------------Load TableView-------------------------------------------//
    private func loadSolarStats() {
        
        // variables that will hold data pertaining to the name.
        let position = String(describing: coordinate) // gps
        // ?? 00 sets a default case incase the variable can not be established.
        let currentDate = "\(dateTimeComponents.month ?? 00)/\(dateTimeComponents.day ?? 00)/\(dateTimeComponents.year ?? 00)" // 6/22/18
        let time = "\(dateTimeComponents.hour ?? 00):\(dateTimeComponents.minute ?? 00):\(dateTimeComponents.second ?? 00)" // 10:30:35
        let sunrise = todaySunrise // sunrise
        let sunset = todaySunset // sunset
        let status6 = UILabel(named: "data") // Nautical Dawn
        let nauticalTwilight = NTwilight // Nautical Dusk
        let status8 = UILabel(named: "data") // day length
        
        
        guard let stat1 = Solar(name: "GPS Location:", data: position) else {
            fatalError("Unable to instantiate stat1")
        }
        
        guard let stat2 = Solar(name: "Today's Date:", data: currentDate) else {
            fatalError("Unable to instantiate stat2")
        }
        
        guard let stat3 = Solar(name: "Current Local Time:", data: time) else {
            fatalError("Unable to instantiate stat3")
        }
        
        guard let stat4 = Solar(name: "Sun Rise:", status: sunrise) else {
            fatalError("Unable to instantiate stat4")
        }
        
        guard let stat5 = Solar(name: "Sun Set:", status: sunset) else {
            fatalError("Unable to instantiate stat5")
        }
        
        guard let stat6 = Solar(name: "First Light:", status: status6) else {
            fatalError("Unable to instantiate stat6")
        }
        
        guard let stat7 = Solar(name: "Last Light:", data: nauticalTwilight) else {
            fatalError("Unable to instantiate stat7")
        }
        
        guard let stat8 = Solar(name: "Day Length:", status: status8) else {
            fatalError("Unable to instantiate stat8")
        }
        
        solarStats += [stat1, stat2, stat3, stat4, stat5, stat6, stat7, stat8]
    }
    
}
