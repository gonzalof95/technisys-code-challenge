//
//  NewsTableViewCell.swift
//  tecnisys code challenge
//
//  Created by Gonzalo Ivan Fuentes on 05/01/2021.
//

import UIKit
import SDWebImage

class NewsTableViewCell: UITableViewCell {
    static let identifier = "NewsTableViewCell"
    @IBOutlet var newImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet weak var detailButton: UIButton!

    static func nib() -> UINib {
        return UINib(nibName: "NewsTableViewCell", bundle: nil)
    }

    public func configure(with new: NewModel) {
        newImageView.sd_setImage(with: URL(string: new.imageUrl ?? ""), placeholderImage: UIImage(named: "blank"))
        newImageView.contentMode = .scaleAspectFill
        newImageView.layer.cornerRadius = 10

        titleLabel.text = new.title
        titleLabel.font = UIFont(name: Fonts.main, size: 16)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 2

        descriptionLabel.text = new.description
        descriptionLabel.font = UIFont(name: Fonts.main, size: 10)
        descriptionLabel.textColor = .black
        descriptionLabel.numberOfLines = 0

        guard let date = new.date else { return }
        dateLabel.text = String(describing: date)
        dateLabel.font = UIFont(name: Fonts.main, size: 12)
        dateLabel.textColor = .black
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
