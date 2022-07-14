//
//  MainVC.swift
//  TimesApp
//
//  Created by Arvind on 08/07/22.
//

import UIKit

class MainVC: BaseVC {
    
    // MARK: - IBOutlet
    @IBOutlet weak var getNewsButton: UIButton!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    deinit {
        print("MainVC is DeINTIALIZED")
    }
    
    // MARK: - UIButton Actions
    @IBAction func getNewsAction(_ sender: UIButton) {
        let newsListVM = NewsListVM(networkManager: NetworkManager())
        let newsListVC = NewsListVC.instantiateViewController(storyboard: .main)
        newsListVC.viewModel = newsListVM
        navigationController?.pushViewController(newsListVC, animated: true)
    }
}
