//
//  BaseVC.swift
//  TimesApp
//
//  Created by Arvind on 09/07/22.
//

import UIKit

class BaseVC: UIViewController, StoryboardLoadable {

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
