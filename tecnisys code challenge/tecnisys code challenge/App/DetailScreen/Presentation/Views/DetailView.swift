//
//  DetailView.swift
//  tecnisys code challenge
//
//  Created by Gonzalo Ivan Fuentes on 06/01/2021.
//

import UIKit
import PureLayout
import SDWebImage

class DetailView: UIView {
    let scrollView = UIScrollView(forAutoLayout: ())
    let containerView = UIView(forAutoLayout: ())
    let imageView = UIImageView(forAutoLayout: ())
    let titleLabel = UILabel(forAutoLayout: ())
    let descriptionLabel = UILabel(forAutoLayout: ())
    let dateLabel = UILabel(forAutoLayout: ())

    required init() {
        super.init(frame: .zero)
        self.backgroundColor = .customBackgroundColor

        scrollView.addSubview(containerView)
        containerView.addSubview(imageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(dateLabel)
        addSubview(scrollView)

        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
        scrollView.autoPinEdgesToSuperviewEdges()
        containerView.autoPinEdgesToSuperviewEdges()

        containerView.autoMatch(.width, to: .width, of: self)
        containerView.autoMatch(.height, to: .height, of: self).priority = .defaultLow

        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10

        titleLabel.font = UIFont(name: Fonts.main, size: 18)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0

        descriptionLabel.font = UIFont(name: Fonts.main, size: 10)
        descriptionLabel.textColor = .black
        descriptionLabel.numberOfLines = 0

        dateLabel.font = UIFont(name: Fonts.main, size: 12)
        dateLabel.textColor = .black
    }

    func setupConstraints() {
        imageView.autoPinEdge(.top, to: .top, of: containerView, withOffset: 20)
        imageView.autoPinEdge(.leading, to: .leading, of: containerView, withOffset: 20)
        imageView.autoPinEdge(.trailing, to: .trailing, of: containerView, withOffset: -20)
        imageView.autoSetDimension(.height, toSize: 280)

        dateLabel.autoPinEdge(.top, to: .bottom, of: imageView, withOffset: 8)
        dateLabel.autoPinEdge(.leading, to: .leading, of: containerView, withOffset: 22)
        dateLabel.autoPinEdge(.trailing, to: .trailing, of: containerView, withOffset: -22)

        titleLabel.autoPinEdge(.top, to: .bottom, of: dateLabel, withOffset: 14)
        titleLabel.autoPinEdge(.leading, to: .leading, of: containerView, withOffset: 22)
        titleLabel.autoPinEdge(.trailing, to: .trailing, of: containerView, withOffset: -22)

        descriptionLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 20)
        descriptionLabel.autoPinEdge(.leading, to: .leading, of: containerView, withOffset: 22)
        descriptionLabel.autoPinEdge(.trailing, to: .trailing, of: containerView, withOffset: -22)
    }

    public func configure(new: NewModel) {
        imageView.sd_setImage(with: URL(string: new.imageUrl ?? ""), placeholderImage: UIImage(named: "blank"))
        titleLabel.text = new.title
        descriptionLabel.text = new.description
        guard let date = new.date else { return }
        dateLabel.text = String(describing: date)
    }
}
