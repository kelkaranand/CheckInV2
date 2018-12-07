//
//  RegistrationCheckViewController.swift
//  CheckIn
//
//  Created by Anand Kelkar on 03/12/18.
//  Copyright © 2018 Anand Kelkar. All rights reserved.
//

import Foundation
import UIKit
import CoreData

import Foundation

class RegistrationCheckViewController : UIViewController {
    @IBOutlet weak var Label: UILabel!
    var identifier: String = ""
    var key: String = ""
    
    override func viewWillAppear(_ animated: Bool) {
        let temp = checkRegistration()
        if(temp) {
            //Device is registered
        }
        else {
            //Device is not registered
            if(identifier != "") {
                //Device has not been verified
            }
            else {
                //Device identifier has not been registered
            }
        }
    }
    
    
    /*
     Check if identifier and key have been saved in the Device_Info entity.
     If either are not saved, the device is not registered.
     */
    func checkRegistration() -> Bool
    {
        guard let appDelegate = UIApplication.shared.delegate as?AppDelegate else {
            return false
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        //Get if device info is present
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Device_Info")
        do{
            let identifier = try managedContext.fetch(fetchRequest).first?.value(forKey: "identifier") as? String
            if (identifier != nil) {
                self.identifier = identifier!
            }
            let key = try managedContext.fetch(fetchRequest).first?.value(forKey: "key") as? String
            if (key != nil) {
                self.key = key!
            }
            if (!(identifier == nil) && !(key == nil)) {
                return true
            }
            return false
        }
        catch _ as NSError {
            return false
        }
    }
    
    
}
