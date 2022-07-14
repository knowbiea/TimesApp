//
//  NewsTVCell.swift
//  TimesApp
//
//  Created by Arvind on 10/07/22.
//

import UIKit

class NewsTVCell: UITableViewCell {

    // MARK: - IBOutlet
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateButton: UIButton!
    
    // MARK: - Properties
    var news: News? {
        didSet {
            guard let news = news else { return }
            titleLabel.text = news.title
            descriptionLabel.text = news.byline
            authorLabel.text = news.source
            dateButton.setTitle(news.publishedDate, for: .normal)
        }
    }
    
    // MARK: - UITableViewCell
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.accessibilityIdentifier = AccessibilityIdentifier.newsListTableViewCell
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
