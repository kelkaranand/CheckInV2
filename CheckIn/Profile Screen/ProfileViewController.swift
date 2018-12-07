//
//  ProfileViewController.swift
//  CheckIn
//
//  Created by Anand Kelkar on 04/12/18.
//  Copyright © 2018 Anand Kelkar. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController : UIViewController {
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var fnameLabel: UILabel!
    @IBOutlet weak var lnameLabel: UILabel!
    
    
    var fname = ""
    var lname = ""
    var sname = ""
    var id = ""
    
    override func viewDidLoad() {
        idLabel.text = id
        fnameLabel.text = fname
        lnameLabel.text = lname
    }
    
    
}
