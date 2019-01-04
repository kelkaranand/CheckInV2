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
    @IBOutlet var eventDate: UITextField!
    @IBOutlet var eventTime: UITextField!

    @IBOutlet var loadStudentsView: UIView!
    
    fileprivate let datePicker = UIDatePicker()
    fileprivate let timePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventName.delegate = self
        eventDate.delegate = self
        eventTime.delegate = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        loadStudentsView.addGestureRecognizer(tapGesture)
        showDatePicker()
        showTimePicker()
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.backgroundColor = UIColor(rgb: 0x00FFFF)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.backgroundColor = .white
    }
    
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        let vc = LoadStudentsViewController()
        vc.modalPresentationStyle = .formSheet
        vc.storyboard?.instantiateInitialViewController()
        vc.preferredContentSize = CGSize(width: view.frame.width/2, height: view.frame.height/2)
        self.present(vc, animated: true, completion: nil)
    }
    
    func setUpToolbar(functionType: Selector) -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //done button & cancel button
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: functionType)
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(CreateEventViewController.cancelDatePicker))
        toolbar.setItems([cancelButton,spaceButton,doneButton], animated: false)
        
        return toolbar
    }
    
    func showDatePicker(){
        datePicker.datePickerMode = .date
        eventDate.inputAccessoryView = setUpToolbar(functionType: #selector(datePickerFormat))
        eventDate.inputView = datePicker
    }
    
    func showTimePicker(){
        timePicker.datePickerMode = .time
        // add toolbar to textField
        eventTime.inputAccessoryView = setUpToolbar(functionType: #selector(timePickerFormat))
        // add datepicker to textField
        eventTime.inputView = timePicker
    }
    
    @objc func datePickerFormat(){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        eventDate.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func timePickerFormat(){
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        eventTime.text = formatter.string(from: timePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
}
