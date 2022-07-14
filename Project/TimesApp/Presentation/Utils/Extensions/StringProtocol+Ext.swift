//
//  StringProtocol+Ext.swift
//  TimesApp
//
//  Created by Arvind on 10/07/22.
//

import UIKit

extension StringProtocol {
    var firstUppercased: String { return prefix(1).uppercased() + dropFirst() }
}
