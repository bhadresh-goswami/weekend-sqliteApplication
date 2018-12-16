//
//  dbManager.swift
//  sqliteApplication
//
//  Created by Mac on 16/12/18.
//  Copyright © 2018 Demo. All rights reserved.
//

import Foundation

class dbManager {
    let dbFileName = "dbInfo.db"
    var dbPath = ""
    
    static let shared:dbManager = dbManager()
    
    init() {
        
    }
    
    func Command(cmd:String) -> Bool {
        return true
    }
     func Query(query:String) -> [Any] {
        return []
    }
}
