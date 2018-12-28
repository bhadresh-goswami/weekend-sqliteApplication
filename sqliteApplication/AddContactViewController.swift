//
//  AddContactViewController.swift
//  sqliteApplication
//
//  Created by Mac on 16/12/18.
//  Copyright © 2018 Demo. All rights reserved.
//

import UIKit

class AddContactViewController: UIViewController {

    
    @IBOutlet var txtId: UITextField!
    
    
    @IBOutlet var txtName: UITextField!
    
    
    @IBOutlet var txtEmailId: UITextField!
    
    
    var infoObject = InfoMaster()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnSaveClick(_ sender: UIBarButtonItem) {
        
        //infoObject.id = Int(txtId.text!)!
        infoObject.name = txtName.text!
        infoObject.emailid = txtEmailId.text!
        
        if infoObject.InsertData(){
            //alert
            print("data saved!")
            
            self.navigationController?.popViewController(animated: true)
            
        }
        else{
            print("Data Not saved!")
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
