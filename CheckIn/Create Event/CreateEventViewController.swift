//
//  CreateEventViewController.swift
//  CheckIn
//
//  Created by Alexander Stevens on 12/12/18.
//  Copyright © 2018 Anand Kelkar. All rights reserved.
//

import UIKit

class CreateEventViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var eventName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventName.delegate = self
        
        //setup underline
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: eventName.frame.maxY, width: eventName.frame.width, height: 1)
        bottomLine.backgroundColor = UIColor.black.cgColor
        eventName.layer.addSublayer(bottomLine)
    }
    
}
