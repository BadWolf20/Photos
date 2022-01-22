//
//  SecondTypeCell.swift
//  Photos
//
//  Created by Roman on 22.01.2022.
//
import Foundation
import UIKit

class SecondTypeCell: UICollectionViewCell {

    // MARK: - Constants
    static var reuseId: String = "SecondTypeCell"

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
        label.textAlignment = .right

        return label
    }()

    lazy var iconImage: UIImageView = {
        let image = UIImageView()

        image.contentMode = .scaleAspectFit

        return image
    }()

    lazy var arrowIconImage: UIImageView = {
        let image = UIImageView()

        image.contentMode = .scaleAspectFit

        return image
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupHierarchy()
        setupLayout()
        setupConfiguration()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Settings
    func setupHierarchy() {
        addSubview(nameLable)
        addSubview(iconImage)
        addSubview(quantityLable)
        addSubview(arrowIconImage)
    }

    func setupLayout() {
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        iconImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iconImage.leadingAnchor.constraint(equalTo: leadingAnchor,
                                           constant: Metric.iconImageLeftIndent).isActive = true
        iconImage.heightAnchor.constraint(equalToConstant: Metric.iconImageHeight).isActive = true
        iconImage.widthAnchor.constraint(equalToConstant: Metric.iconImageWidth).isActive = true

        nameLable.translatesAutoresizingMaskIntoConstraints = false
        nameLable.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        nameLable.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor,
                                           constant: Metric.nameLableLeftIndent).isActive = true

        arrowIconImage.translatesAutoresizingMaskIntoConstraints = false
        arrowIconImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        arrowIconImage.heightAnchor.constraint(equalToConstant: Metric.arrowIconImageHeight).isActive = true
        arrowIconImage.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                 constant: Metric.arrowIconImageRightIndent).isActive = true

        quantityLable.translatesAutoresizingMaskIntoConstraints = false
        quantityLable.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        quantityLable.trailingAnchor.constraint(equalTo: arrowIconImage.leadingAnchor,
                                                constant: Metric.quantityLableRightIndent).isActive = true



    }

}

// MARK: - Functions
extension SecondTypeCell {

    func configure(with info: Album) {
        iconImage.image = info.icon
        nameLable.text = info.title
        quantityLable.text = String(info.photos.count)
    }

    func setupConfiguration() {
        backgroundColor = Colors.viewBackGround
        arrowIconImage.image = UIImage(
            systemName: "chevron.right")?.withTintColor(Colors.arrowIconImageColor,
                                                        renderingMode: .alwaysOriginal)
        let selectedView = UIView(frame: bounds)
        selectedView.backgroundColor = Colors.selectedBackground
        self.selectedBackgroundView = selectedView
    }

}

extension SecondTypeCell{
    enum Colors {
        // view
        static let viewBackGround: UIColor = .clear
        static let selectedBackground: UIColor = .gray
        // nameLable
        static let nameLableTextColor: UIColor = .black
        // quantityLable
        static let quantityLableTextColor: UIColor = .gray
        // arrowIconImage
        static let arrowIconImageColor: UIColor = .darkGray

    }

    enum Metric {
        // iconImage
        static let iconImageHeight: CGFloat = 30
        static let iconImageWidth: CGFloat = 30
        static let iconImageLeftIndent: CGFloat = 10
        // nameLable
        static let nameLableFontSize: CGFloat = 20
        static let nameLableLeftIndent: CGFloat = 15
        // quantityLable
        static let quantityLableFontSize: CGFloat = 20
        static let quantityLableRightIndent: CGFloat = -10
        // arrowIconImage
        static let arrowIconImageHeight: CGFloat = 18
        static let arrowIconImageWidth: CGFloat = 10
        static let arrowIconImageRightIndent: CGFloat = -15
    }
}
