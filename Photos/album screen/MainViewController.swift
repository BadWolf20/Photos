//
//  ViewController.swift
//  Photos
//
//  Created by Roman on 22.01.2022.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - Views
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: view.bounds, collectionViewLayout: createCompLayout())
        view.backgroundColor = Colors.ColectionViewBackGround

        view.register(FirstTypeCell.self, forCellWithReuseIdentifier: FirstTypeCell.reuseId)
        view.register(SecondTypeCell.self, forCellWithReuseIdentifier: SecondTypeCell.reuseId)
        view.register(HeaderCollectionReusableView.self,
                      forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                      withReuseIdentifier: HeaderCollectionReusableView.reuseId)

        view.delegate = self
        view.dataSource = self

        return view
    }()

    lazy var sectionHeader: NSCollectionLayoutBoundarySupplementaryItem = {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .absolute(Metric.headerHeight))

        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )

        return header
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Settings"

        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(headerButton))
        navigationItem.rightBarButtonItems = [add]

        setupHierarchy()
        setupLayout()

    }

//    override func viewWillAppear(_ animated: Bool) {
//        //navigationController?.navigationBar.isHidden = true
//    }

    // MARK: - Settings
    private func setupHierarchy() {
        view.addSubview(collectionView)
    }

    private func setupLayout() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor,
                                            constant: Metric.collectionViewTopIndent).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }

}

// MARK: - Functions
extension MainViewController {

    // Button actions
    @objc func headerButton() {
        print("album adding")
    }

    // Functions
    func createCompLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout{ (sectionindex, layoutEnviroment) -> NSCollectionLayoutSection? in
            let section = sectionsList[sectionindex]

            switch section.type {
            case 1:
                return self.createPhotoSectionType1()
            case 2:
                return self.createPhotoSectionType2()
            case 3, 4:
                return self.createPhotoSectionType3()
            default:
                return self.createPhotoSectionType2()
            }
        }
        return layout
    }

}

// MARK: - collectionViewLayout
extension MainViewController {
    func createPhotoSectionType1() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(130 + 10),
                                              heightDimension: .fractionalHeight(130 + 10 + 35))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

        let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(1),
                                               heightDimension: .estimated(1))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item, item])
        //group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
        section.boundarySupplementaryItems = [sectionHeader]

        return section
    }

    func createPhotoSectionType2() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(130 + 10),
                                              heightDimension: .fractionalHeight(130 + 10 + 35))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

        let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(1),
                                               heightDimension: .estimated(1))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        //group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0)


        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
        section.boundarySupplementaryItems = [sectionHeader]

        return section
    }

    func createPhotoSectionType3() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(view.frame.width),
                                              heightDimension: .fractionalHeight(50))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

        let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(1),
                                               heightDimension: .estimated(1))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        //group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0)


        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .none
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)
        section.boundarySupplementaryItems = [sectionHeader]

        return section
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionsList.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionsList[section].album.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch sectionsList[indexPath.section].type {
        case 1, 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstTypeCell.reuseId, for: indexPath) as? FirstTypeCell
            cell?.configure(with: sectionsList[indexPath.section].album[indexPath.row])
            return cell!
        case 3, 4:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SecondTypeCell.reuseId, for: indexPath) as? SecondTypeCell
            cell?.configure(with: sectionsList[indexPath.section].album[indexPath.row])
            return cell!
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstTypeCell.reuseId, for: indexPath) as? FirstTypeCell
            cell?.configure(with: sectionsList[indexPath.section].album[indexPath.row])
            return cell!
        }

    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath) cell pushed")
        collectionView.deselectItem(at: indexPath, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: HeaderCollectionReusableView.reuseId,
            for: indexPath) as! HeaderCollectionReusableView
        header.setTittle(title: sectionsList[indexPath.section].title)
        return header
    }



}

// MARK: - Constants

extension MainViewController {
    enum Colors {
        static let ColectionViewBackGround: UIColor = .orange
    }

    enum Metric {
        // SectionHeader
        static let headerHeight: CGFloat = 30
        // collectionView
        static let collectionViewTopIndent: CGFloat = 0
    }
}
