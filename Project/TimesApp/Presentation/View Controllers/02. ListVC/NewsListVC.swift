//
//  NewsListVC.swift
//  TimesApp
//
//  Created by Arvind on 08/07/22.
//

import UIKit

class NewsListVC: BaseVC {
    
    // MARK: - IBOutlet
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var viewModel: NewsListVM?
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerCells(.newsTVCell)
        setAccessibilityIdentifier()
        getNewsResponse()
    }
    
    deinit {
        print("NewsListVC is DeINTIALIZED")
    }
    
    // MARK: - Custom Methods
    func setAccessibilityIdentifier() {
        tableView.accessibilityIdentifier = AccessibilityIdentifier.newsListTableView
        searchBar.accessibilityIdentifier = AccessibilityIdentifier.newsListSearch
        view.accessibilityIdentifier = AccessibilityIdentifier.newsListView
    }
    
    // MARK: - API Calling
    func getNewsResponse() {
        viewModel?.getNewsListNews(url: Endpoints.news.url, completion: { [weak self] success, error in
            guard let self = self else { return }
            self.tableView.reloadData()
        })
    }
}

// MARK: - UITableView Datasource
extension NewsListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.newsFilteredArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = NewsTVCell.dequeueReusableCell(for: tableView)
        cell.news = viewModel?.newsFilteredArray?[indexPath.row]
        
        return cell
    }
}

// MARK: - UITableView Datasource
extension NewsListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        12
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = .clear
        
        return footerView
    }
}

// MARK: - UISearchBar Delegate
extension NewsListVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel?.searchNews(searchText, completion: { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        })
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
}
