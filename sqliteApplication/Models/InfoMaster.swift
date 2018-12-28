//
//  InfoMaster.swift
//  sqliteApplication
//
//  Created by Mac on 16/12/18.
//  Copyright © 2018 Demo. All rights reserved.
//

import Foundation

class InfoMaster {
    
    var id = 0
    var name = ""
    var emailid = ""
    
    static var lastId = 0
    
    func InsertData() -> Bool {
        
        InfoMaster.lastId += 1
        
        let cmd = "Insert into infoMaster (id,name,emailid) values (\(InfoMaster.lastId),'\(name)','\(emailid)')"      
        
        
        return dbManager.shared.Command(cmd: cmd)
    }

    
    func DeleteData() -> Bool {
        
        //InfoMaster.lastId += 1
        
        let cmd = "delete from infoMaster where id = \(self.id)"
        
        
        return dbManager.shared.Command(cmd: cmd)
    }
    func Select() -> [InfoMaster] {
        
       var list = [InfoMaster]()
        
        print("\n\n\n")
        print(dbManager.shared.dbPath)
       let rows = dbManager.shared.Query(query: "Select * from infoMaster order by id desc")
        
        for row in rows{
            
            let info = InfoMaster()
            
            info.id = Int("\(row["id"]!)")!
            info.name = "\(row["name"]!)"
            info.emailid = "\(row["emailid"]!)"
            
            list.append(info)
            
        }
        
        InfoMaster.lastId = list.count == 0 ? 0 : list[0].id
        
        return list
    }
}
