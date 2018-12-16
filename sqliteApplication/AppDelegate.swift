//
//  AppDelegate.swift
//  sqliteApplication
//
//  Created by Mac on 16/12/18.
//  Copyright © 2018 Demo. All rights reserved.
//

import UIKit
//step 1: copy database to installed document folder

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        //step a: get path from installed directory
        let arrDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        print(arrDir)
        
        //step b: document dir merge with database file name
        dbManager.shared.dbPath = arrDir[0] + "/" + dbManager.shared.dbFileName
        
        print("\n\nDatabase file should be at \(dbManager.shared.dbPath)")
        
        //step c: check file is at location or not
        if FileManager.default.fileExists(atPath: dbManager.shared.dbPath)
        {
            //file is at location
            print("File already Exist at \(dbManager.shared.dbPath)!")
        }
        else
        {
            //step d: need to copy file from Bundles to Document directory
            let filePathBundle = Bundle.main.path(forResource: "dbInfo", ofType: "db")
            
            if filePathBundle == nil{
                //step e: file not find in bundles
                print("file not find in bundles!")
            }
            else
            {
                //step f: copy file from bundle to document directory
                do
                {
                    try FileManager.default.copyItem(atPath: filePathBundle!, toPath: dbManager.shared.dbPath)
                    print("File Copied!")
                }
                catch let err as NSError{
                    print("Error in copy file: \(err.localizedDescription)")
                }
            }
            
            
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

