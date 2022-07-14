//
//  UITableView+Ext.swift
//  TimesApp
//
//  Created by Arvind on 08/07/22.
//

import UIKit

extension UITableView {
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
         guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
             fatalError("Unable to Dequeue Reusable Table View Cell")
         }

         return cell
     }

    /***** Register Cells *****/
    func registerCells(_ cells: Cell...) {
        cells.forEach { register(UINib(nibName: $0.identifier, bundle: nil), forCellReuseIdentifier: $0.identifier) }
    }
    
    /***** Register Class *****/
    func registerClass<T: UITableViewCell>(_ cells: [T.Type]) {
        cells.forEach { print("\($0.description())"); register($0.self, forCellReuseIdentifier: $0.reuseIdentifier) }
    }
    
    /***** Register Headers *****/
    func registerHeaders(_ cells: CellHeader...) {
        cells.forEach { register(UINib(nibName: $0.identifier, bundle: nil), forHeaderFooterViewReuseIdentifier: $0.identifier) }
    }
}
