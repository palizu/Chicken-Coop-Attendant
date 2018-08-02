//
//  SolarTableViewController.swift
//  Chicken Coop Attendant
//
//  Created by Kediel on 2/3/18.
//  Copyright © 2018 riOS. All rights reserved.
//

import UIKit
import CoreLocation
import CoreFoundation

class SolarTableViewController: UITableViewController {
    
    let solarStats = [Solar]()
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Load solar statistics
        loadSolarStats()
        
        // Checks permissions for Location features, if enabled execute the following initializers and assignment statements.
        if (CLLocationManager.locationServicesEnabled()){
            
            let locationManager = CLLocationManager()
            locationManager.delegate = self as? CLLocationManagerDelegate
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
            }
        }
    

    override func didReceiveMemoryWarning() {
        didReceiveMemoryWarning()
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
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
    
    
    // A couple of initializers
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    init(coordinate: CLLocationCoordinate2D, altitude: CLLocationDistance, horizontalAccuracy: CLLocationAccuracy, verticalAccuracy: CLLocationAccuracy, timestamp: Date) {
        
    }
    
    // Get the location attributes
    
    var coordinate: CLLocationCoordinate2D
    var altitude: CLLocationDistance
    // var floor: CLFloor? // The logical floor of a building in which the user is located.
    var horizontalAccuracy: CLLocationAccuracy
    var verticalAccuracy: CLLocationAccuracy
    var timestamp: Date
    //var lat = NSNumber(double: self ?? 0)
    //var lon = NSNumber(double: self ?? 0)
    
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
    
    // Get the date components
    //You can't use bounds in a let because it doesn't exist when that property is created because it belongs to self. So at init self isn't complete yet. But if you use a lazy var, then self and its property bounds will be ready by the time you need it.
    // Specify date components
    var locations: [Double] = []
    let userLocation:CLLocation = locations[0]
    let long = userLocation.coordinate.longitude;
    let lat = userLocation.coordinate.latitude;
    var dateComponents = DateComponents()
    
    /* Now the components are available to implement
    dateComponents.year   // 2018
    dateComponents.month  // 10
    dateComponents.day    // 8
    dateComponents.hour   // 22
    dateComponents.minute // 42
    dateComponents.second // 17
     dateComponents.timeZone // EST (-5:00) TimeZone(abbreviation: "EST")
    */
    
//-------------------------Sunrise/Sunset using CoreLocation and EDSunriseSet-------------------------------//

    // Receive the data
    var location = CLLocationCoordinate2D(latitude: coordinate, longitude: coordinate)
    
    // Incorporate the Data
    var sunInfo = EDSunriseSet.sunriseset(with: Date(), timezone: TimeZone(abbreviation: "EST"), latitude: lat, longitude: long)
    
    // Call the methods
    var NTwilight = sunInfo.calculateNauticalTwilight(Date())
    var NDawn = sunInfo.calculateNauticalDawn(Date())
    var todaySunrise = sunInfo.calculateSunrise(Date())
    var todaySunset = sunInfo.calculateSunset(Date())
    var nautDayLength = todaySunset - todaySunrise
    
//--------------------------------Load TableView-------------------------------------------//
    private func loadSolarStats() {
        
        // variables that will hold data pertaining to the name.
        let position = String(describing: coordinate) // gps
        // ?? 00 sets a default case incase the variable can not be established.
        let currentDate = "\(dateComponents.month ?? 00)/\(dateComponents.day ?? 00)/\(dateComponents.year ?? 00)" // 6/22/18
        let time = "\(dateComponents.hour ?? 00):\(dateComponents.minute ?? 00):\(dateComponents.second ?? 00)" // 10:30:35
        let sunrise = todaySunrise // sunrise
        let sunset = todaySunset // sunset
        let nauticalDawn = NDawn // Nautical Dawn
        let nauticalTwilight = NTwilight // Nautical Dusk
        let dLength = nautDayLength // day length
        
        
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
        
        guard let stat6 = Solar(name: "First Light:", status: nauticalDawn) else {
            fatalError("Unable to instantiate stat6")
        }
        
        guard let stat7 = Solar(name: "Last Light:", data: nauticalTwilight) else {
            fatalError("Unable to instantiate stat7")
        }
        
        guard let stat8 = Solar(name: "Day Length:", status: dLength) else {
            fatalError("Unable to instantiate stat8")
        }
        
        solarStats += [stat1, stat2, stat3, stat4, stat5, stat6, stat7, stat8]
        }
}

    

