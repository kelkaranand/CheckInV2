//
//  IndentedTextField.swift
//  CheckIn
//
//  Created by Alexander Stevens on 1/4/19.
//  Copyright © 2019 Anand Kelkar. All rights reserved.
//

import UIKit

class IndentedTextField: UITextField {
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: .init(top: 0, left: 10, bottom: 0, right: 0))
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: .init(top: 0, left: 10, bottom: 0, right: 0))
    }
}
