//
//  UILabel.swift
//  CheckIn
//
//  Created by Alexander Stevens on 1/3/19.
//  Copyright © 2019 Anand Kelkar. All rights reserved.
//

import UIKit

class UnderLinedLabel: UILabel {
    override var text: String? {
        didSet {
            guard let text = text else { return }
            let textRange = NSMakeRange(0, text.count)
            let attributedText = NSMutableAttributedString(string: text)
            attributedText.addAttribute(NSAttributedString.Key.underlineStyle , value: NSUnderlineStyle.single.rawValue, range: textRange)
            self.attributedText = attributedText
        }
    }
}
