//
//  TableView+Constant.swift
//  TimesApp
//
//  Created by Arvind on 10/07/22.
//

import UIKit

enum Cell {
    case newsTVCell
    
    var identifier: String {
        return "\(self)".firstUppercased
    }
}

enum CellHeader {
    case newsTVCell
    
    var identifier: String {
        return "\(self)".firstUppercased
    }
}
