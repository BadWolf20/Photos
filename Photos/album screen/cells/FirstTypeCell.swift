//
//  FirstTypeCell.swift
//  Photos
//
//  Created by Roman on 22.01.2022.
//

import Foundation
import UIKit

class FirstTypeCell: UICollectionViewCell {

    // MARK: - Constants
    static var reuseId: String = "FirstTypeCell"

    // MARK: - Views
    lazy var nameLable: UILabel = {
        let label = UILabel()

        label.textColor = Colors.nameLableTextColor
        label.font = .systemFont(ofSize: Metric.nameLableFontSize,
                                 weight: .regular)
        label.textAlignment = .left

        return label
    }()

    let quantityLable: UILabel = {
        let label = UILabel()

        label.textColor = Colors.quantityLableTextColor
        label.font = .systemFont(ofSize: Metric.quantityLableFontSize,
                                 weight: .regular)
        label.textAlignment = .left

        return label
    }()

    lazy var mainImage: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.layer.cornerRadius = Metric.mainImageCornerRadius
        image.contentMode = .scaleAspectFill

        return image
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Colors.viewBackGround

        self.clipsToBounds = true
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Settings
    func setupHierarchy() {
        addSubview(nameLable)
        addSubview(mainImage)
        addSubview(quantityLable)
    }

    func setupLayout() {
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        mainImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mainImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mainImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        mainImage.heightAnchor.constraint(equalTo: widthAnchor).isActive = true

        nameLable.translatesAutoresizingMaskIntoConstraints = false
        nameLable.topAnchor.constraint(equalTo: mainImage.bottomAnchor).isActive = true
        nameLable.leadingAnchor.constraint(equalTo: leadingAnchor,
                                           constant: Metric.nameLableLeftIndent).isActive = true
        nameLable.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

        quantityLable.translatesAutoresizingMaskIntoConstraints = false
        quantityLable.topAnchor.constraint(equalTo: nameLable.bottomAnchor).isActive = true
        quantityLable.leadingAnchor.constraint(equalTo: leadingAnchor,
                                               constant: Metric.quantityLableLeftIndent).isActive = true
        quantityLable.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }

}

// MARK: - Functions
extension FirstTypeCell {

    func configure(with info: Album) {
        mainImage.image = info.photos[0]
        nameLable.text = info.title
        quantityLable.text = String(info.photos.count)
    }

}

// MARK: - Constants

extension FirstTypeCell{
    enum Colors {
        // view
        static let viewBackGround: UIColor = .clear
        // nameLable
        static let nameLableTextColor: UIColor = .black
        // quantityLable
        static let quantityLableTextColor: UIColor = .gray
    }

    enum Metric {
        // mainImage
        static let mainImageCornerRadius: CGFloat = 5
        // nameLable
        static let nameLableFontSize: CGFloat = 16
        static let nameLableLeftIndent: CGFloat = 5
        // quantityLable
        static let quantityLableFontSize: CGFloat = 14
        static let quantityLableLeftIndent: CGFloat = 5
    }
}

