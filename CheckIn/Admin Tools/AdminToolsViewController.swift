//
//  AdminViewController.swift
//  CheckIn
//
//  Created by Alexander Stevens on 12/11/18.
//  Copyright © 2018 Anand Kelkar. All rights reserved.
//

import UIKit
class AdminToolsViewController: UIViewController {
    
    @IBOutlet var uploadDataView: UIView!
    @IBOutlet var downloadDataView: UIView!
    @IBOutlet var filterView: UIView!
    @IBOutlet var createEventView: UIView!
    @IBOutlet var eventDetailsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGestureRecognizers()
    }
    
    fileprivate func setupGestureRecognizers() {
        uploadDataView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        downloadDataView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        filterView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        createEventView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openCreateEventVC)))
        eventDetailsView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openEventDetailsVC)))
    }
    
    @objc func handleTap(){
        print("TOUCHED")
    }
    
    @objc func openCreateEventVC() {
        let storyboard: UIStoryboard = UIStoryboard(name: "CreateEvent", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CreateEvent") as! CreateEventViewController
        self.show(vc, sender: self)
    }
    
    @objc func openEventDetailsVC() {
        let storyboard: UIStoryboard = UIStoryboard(name: "EventDetails", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "EventDetails") as! EventDetailsViewController
        self.show(vc, sender: self)
    }
    
}
