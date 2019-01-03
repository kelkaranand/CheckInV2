//
//  LoadStudentsViewController.swift
//  CheckIn
//
//  Created by Alexander Stevens on 1/2/19.
//  Copyright © 2019 Anand Kelkar. All rights reserved.
//

import UIKit

class LoadStudentsViewController: UIViewController {
    
    
    @IBAction func removeScreen(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
        preferredContentSize = CGSize(width: view.frame.width/2, height: view.frame.height/2)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
