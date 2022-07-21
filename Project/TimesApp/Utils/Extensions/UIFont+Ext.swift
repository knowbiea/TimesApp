//
//  UIFont+Ext.swift
//  TimesApp
//
//  Created by Arvind on 08/07/22.
//

import UIKit

// MARK: - Fonts
enum AvenirNext: String {
    case bold = "Bold"
    case boldItalic = "BoldItalic"
    case demiBold = "DemiBold"
    case demiBoldItalic = "DemiBoldItalic"
    case heavy = "Heavy"
    case heavyItalic = "HeavyItalic"
    case italic = "Italic"
    case medium = "Medium"
    case mediumItalic = "MediumItalic"
    case regular = "Regular"
    case ultraLight = "UltraLight"
    case ultraLightItalic = "UltraLightItalic"
    
    func of(size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-\(self.rawValue)", size: size) ?? UIFont.systemFont(ofSize: size)
     }
}
