//
//  DataStore.swift
//  rcase.assignment6.remote
//
//  Created by Reid Case on 2/21/18.
//  Copyright © 2018 DePaul University CSC471. All rights reserved.
//

import Foundation

class DataStore {
    static let sharedInstance = DataStore()
    
    var power:String = "Off"
    var status:String = "Stop"
}
