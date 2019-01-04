//
//  LoadStudentsViewController.swift
//  CheckIn
//
//  Created by Alexander Stevens on 1/2/19.
//  Copyright © 2019 Anand Kelkar. All rights reserved.
//

import UIKit

class LoadStudentsViewController: UIViewController {
    
    lazy var xButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "icons8-delete-filled-25"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(self.removeScreen), for: .touchUpInside)
        return button
    }()
    
    lazy var addStudentsLabel: UnderLinedLabel = {
       let label = UnderLinedLabel()
        label.text = "Add Students"
        return label
    }()
    
    lazy var addButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = UIColor.darkGray
        button.setTitle("Add", for: .normal)
        return button
    }()
    
    @objc func removeScreen(){
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
        preferredContentSize = CGSize(width: view.frame.width/2, height: view.frame.height/2)
        view.addSubview(xButton)
        view.addSubview(addButton)
        view.addSubview(addStudentsLabel)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        xButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            xButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            xButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            xButton.widthAnchor.constraint(equalToConstant: 25),
            xButton.heightAnchor.constraint(equalToConstant: 25)
        ])
        addButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            addButton.widthAnchor.constraint(equalToConstant: view.frame.width/4),
            addButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        addStudentsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addStudentsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addStudentsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            addStudentsLabel.widthAnchor.constraint(equalToConstant: view.frame.width/4),
            addStudentsLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
