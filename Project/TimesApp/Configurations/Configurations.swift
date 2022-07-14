//
//  Configurations.swift
//  TimesApp
//
//  Created by Arvind on 08/07/22.
//

import UIKit

class Configurations {
    
    // MARK: - UINavigationBar Appearance
    static func navigationBarAppearance() {
        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.titleTextAttributes = [.foregroundColor: UIColor.white, .font: AvenirNext.bold.of(size: 18)]
        navigationAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white, .font: AvenirNext.bold.of(size: 18)]
        navigationAppearance.backgroundColor = UIColor(hex: 0xD50000)
        navigationAppearance.shadowColor = .clear
        
        UINavigationBar.appearance().standardAppearance = navigationAppearance
        UINavigationBar.appearance().compactAppearance = navigationAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationAppearance
        UINavigationBar.appearance().tintColor = .white
    }
}
