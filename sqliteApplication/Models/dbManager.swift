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
    
    private var dbObject:OpaquePointer?
    
    static let shared:dbManager = dbManager()
    
    
    
    init() {
        
    }
    
    private func Open_db() -> Bool{
        if sqlite3_open(dbManager.shared.dbPath, &dbObject) == SQLITE_OK{
            print("Connection Open!")
            return true
        }
        else{
            print("Not able to open!")
            return false
        }
    }
    
    func Command(cmd:String) -> Bool {
        
        if Open_db(){
            //query stmt
            var stmt:OpaquePointer?
            
            if sqlite3_prepare_v2(dbObject, cmd, -1, &stmt, nil) == SQLITE_OK{
                
                
                sqlite3_step(stmt)
                
                sqlite3_finalize(stmt)
                sqlite3_close(dbObject)
                
            }
            else{
                print("Error:Not able to create stmt!")
                return false
            }
            
        }
        else{
            print("Error:Not able to open db!")
            return false
        }
        
        return true
    }
    func Query(query:String) -> [[String:Any]] {
       
        var rows = [[String:Any]]()

        if Open_db(){
            //query stmt
            var stmt:OpaquePointer?
            
            if sqlite3_prepare_v2(dbObject, query, -1, &stmt, nil) == SQLITE_OK{
                
                while sqlite3_step(stmt) == SQLITE_ROW{
                    
                    
//                    //id,name,emailid => 0, 1 ,2
//                    let id = sqlite3_column_int(stmt, 0)
//                    let name = sqlite3_column_text(stmt, 1)
//                    let emailid = sqlite3_column_text(stmt, 2)
                    var row = [String:Any]()
                    let count = sqlite3_column_count(stmt)
                    for colNumber in 0..<count
                    {
                        let text = String.init(cString: sqlite3_column_text(stmt, colNumber))
                        let colName = String.init(cString: sqlite3_column_name(stmt, colNumber))
                        
                        row[colName] = text
                    }
                    rows.append(row)
                    
                }
                
                sqlite3_finalize(stmt)
                sqlite3_close(dbObject)
                
            }
            
            
        }
        
        
        return rows
        
    }
}
