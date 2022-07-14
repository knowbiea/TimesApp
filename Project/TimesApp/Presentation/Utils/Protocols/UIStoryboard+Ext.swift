//
//  UIStoryboard+Ext.swift
//  TimesApp
//
//  Created by Arvind on 09/07/22.
//

import UIKit

protocol StoryboardLoadable {
    static var storyboardID: String { get }
}

extension StoryboardLoadable {
    
    static var storyboardID: String {
        return String(describing: self.self)
    }
}

extension StoryboardLoadable where Self: UIViewController {
    
    static func instantiateViewController(storyboard name: StoryboardID) -> Self {
        let storyboard = UIStoryboard(name: name.value, bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: storyboardID) as? Self else {
            fatalError("ViewController with identifier \(storyboardID), not found")
        }
        
        return viewController
    }
}

enum StoryboardID: String {
    case main
    
    var value: String {
        return "\(self)".capitalized
    }
}
