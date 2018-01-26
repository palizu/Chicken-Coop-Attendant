//
//  ViewController.swift
//  Chicken Coop Attendant
//
//  Created by Kediel on 1/6/18.
//  Copyright © 2018 riOS. All rights reserved.

import UIKit

class ViewController: UIViewController {
    
    //MARK: properties
    @IBOutlet weak var appTitle: UILabel!
    
    @IBOutlet weak var lightLabel: UILabel!
    @IBOutlet weak var lightSwitch: UISwitch!
    
    @IBOutlet weak var autoLabel: UILabel!
    @IBOutlet weak var autoSwitch: UISwitch!
    
    @IBOutlet weak var heaterLabel: UILabel!
    @IBOutlet weak var heaterSwitch: UISwitch!
    
    @IBOutlet weak var fanLabel: UILabel!
    @IBOutlet weak var fanSwitch: UISwitch!
    
    @IBOutlet weak var auxLabel: UILabel!
    @IBOutlet weak var auxSwitch: UISwitch!
    
    @IBOutlet weak var doorLabel: UILabel!
    @IBOutlet weak var doorSwitch: UISwitch!
    
    @IBOutlet weak var securityLabel: UILabel!
    @IBOutlet weak var securitySwitch: UISwitch!
    
    @IBOutlet weak var musicLabel: UILabel!
    @IBOutlet weak var musicSwitch: UISwitch!
    
    @IBOutlet weak var solarButton: UIButton!
    @IBOutlet weak var statsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: UITextFieldDelegate
    
    //MARK: Actions
    

}

/* Not sure if this goes here but I will store the code here for now.
https://stackoverflow.com/questions/24070450/how-to-get-the-current-time-as-datetime
https://medium.com/a-swift-misadventure/using-swift-to-control-the-raspberry-pi-gpio-pins-and-turn-an-led-on-f31e33c3cb9a
https://gist.github.com/huwr/56e41179f61a9534fe5e
 https://developer.apple.com/library/content/referencelibrary/GettingStarted/DevelopiOSAppsSwift/ConnectTheUIToCode.html

// get the current date and time
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
let dateTimeComponents = userCalendar.dateComponents(requestedComponents, from: currentDateTime)

now the components are available
dateTimeComponents.year   // 2018
dateTimeComponents.month  // 1
dateTimeComponents.day    // 8
dateTimeComponents.hour   // 22
dateTimeComponents.minute // 42
dateTimeComponents.second // 17 */

