//
//  UIView+Ext.swift
//  TimesApp
//
//  Created by Arvind on 08/07/22.
//

import UIKit

@IBDesignable
extension UIView {
    @IBInspectable var cornerRadius: Double {
        get { return Double(self.layer.cornerRadius) }
        set { self.layer.cornerRadius = CGFloat(newValue) }
    }
}
