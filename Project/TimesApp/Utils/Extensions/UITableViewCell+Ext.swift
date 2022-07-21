//
//  UITableViewCell+Ext.swift
//  TimesApp
//
//  Created by Arvind on 08/07/22.
//

import UIKit

protocol ReusableView {
    static var reuseIdentifier: String { get }
}

extension ReusableView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableView {
    
    static func dequeueReusableCell(for tableView: UITableView, at indexPath: IndexPath) -> Self {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? Self else {
            fatalError("Unable to dequeueReusableCell: \(reuseIdentifier)")
        }
        
        return cell
    }
    
    static func dequeueReusableCell(for tableView: UITableView) -> Self {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? Self else {
            fatalError("Unable to dequeueReusableCell: \(reuseIdentifier)")
        }
        
        return cell
    }
}
