//
//  Coop.swift
//  Chicken Coop Attendant
//
//  Created by Kediel on 2/3/18.
//  Copyright © 2018 riOS. All rights reserved.
//

import UIKit

// This class creates the standard variables and data that will populate the table view cell array. 
class Coop {
    
    // Mark: Properties
    
    var name: String
    var data: Bool
    var status: String?

    // Mark: Initializer
    
    init?(name: String, data: Bool, status: String){
        
        // The name must not be empty
        guard !name.isEmpty else {
            
            return nil
        }
        
        guard !status.isEmpty else {
            
            return nil
        }
        // The Data displayed must be a boolean value of either On/Off.
        
        // Initialize stored properties
        self.name = name
        self.data = data
        self.status = status
    }
}

