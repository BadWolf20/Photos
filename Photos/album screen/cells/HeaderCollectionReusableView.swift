//
//  HeaderCollectionReusableView.swift
//  Photos
//
//  Created by Roman on 22.01.2022.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {

    // MARK: - Constants
    static var reuseId: String = "HeaderCollectionReusableView"

    // MARK: - Views
    lazy var titleLable: UILabel = {
        let label = UILabel()

        label.textColor = Colors.titleLableTextColor
        label.font = .systemFont(ofSize: Metric.titleLableFontSize, weight: .heavy)
        label.textAlignment = .left

        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }

    func configure() {
        setupHierarchy()
        setupLayout()
        backgroundColor = Colors.backGround
    }

    // MARK: - Settings
    func setupHierarchy() {
        addSubview(titleLable)
    }

    func setupLayout() {
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        titleLable.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleLable.leadingAnchor.constraint(equalTo: leadingAnchor,
                                            constant: Metric.titleLableLeftIndent).isActive = true
    }
}

// MARK: - Functions
extension HeaderCollectionReusableView {
    // Functions
    override func draw(_ rect: CGRect) {
        let aPath = UIBezierPath()
        aPath.move(to: CGPoint(x: Metric.lineStartX,
                               y: Metric.lineStartEndY))
        aPath.addLine(to: CGPoint(x: frame.width,
                                  y: Metric.lineStartEndY ))
        aPath.close()

        Colors.lineColor.set()
        aPath.stroke()
        aPath.fill()
    }

    func setTittle(title: String) {
        titleLable.text = title
    }
}

// MARK: - Constants

extension HeaderCollectionReusableView{
    enum Colors {
        // view
        static let backGround: UIColor = .clear
        // titleLable
        static let titleLableTextColor: UIColor = .white
        // line
        static let lineColor: UIColor = .gray
    }

    enum Metric {
        // titleLable
        static let titleLableFontSize: CGFloat = 19
        static let titleLableLeftIndent: CGFloat = 5
        // line
        static let lineStartEndY: CGFloat = 0
        static let lineStartX: CGFloat = 10
    }
}
