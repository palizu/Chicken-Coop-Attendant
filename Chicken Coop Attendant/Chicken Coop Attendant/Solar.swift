//
//  Solar.swift
//  Chicken Coop Attendant
//
//  Created by Kediel on 2/3/18.
//  Copyright © 2018 riOS. All rights reserved.
//

import UIKit

// This class creates the standard variables and data that will populate the table view cell array. 
class Solar {
    
    // Mark: Properties
    
    var name: String
    var data: Float
    
    // Mark: Initializer
    
    init?(name: String, data: Float){
        
        // The name must not be empty
        guard !name.isEmpty else {
            
            return nil
        }
        
        // The Data displayed must be in a similar format
        guard !data.isFinite else {
            
            return nil
        }
        
        // Initialize stored properties
        self.name = name
        self.data = data
    }
}
