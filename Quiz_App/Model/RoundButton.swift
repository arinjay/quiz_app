//
//  File.swift
//  Quiz_App
//
//  Created by Arinjay on 23/03/18.
//  Copyright © 2018 Arinjay. All rights reserved.
//

import UIKit

@IBDesignable
class roundButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
}
