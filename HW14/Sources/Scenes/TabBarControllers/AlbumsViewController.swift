//
//  AlbumsViewController.swift
//  HW14
//
//  Created by Христина Буянова on 29.10.2023.
//

import UIKit

class AlbumsViewController: UIViewController {

    private var model = Model.array

    //    MARK: - Outlets

    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MyAlbumsCell.self, forCellWithReuseIdentifier: MyAlbumsCell.identifier)
        collectionView.register(TypeMediaCell.self, forCellWithReuseIdentifier: TypeMediaCell.identifier)
        collectionView.register(PeopleAndPlaceCell.self, forCellWithReuseIdentifier: PeopleAndPlaceCell.identifier)
        collectionView.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    //    MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()

    }

    //    MARK: - Setup

    private func setupView() {
        view.backgroundColor = .systemBackground
        title = "Альбомы"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setupHierarchy() {
        view.addSubview(collectionView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionIndex, _) -> NSCollectionLayoutSection in

            let sectionKind = Section.allCases[sectionIndex]

            switch sectionKind {
            
            case .myAlbums:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalWidth(1))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 2.5, leading: 2.5, bottom: 2.5, trailing: 2.5)
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1/2),
                    heightDimension: .estimated(400))

                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: layoutItem, count: 2)
                layoutGroup.interItemSpacing = NSCollectionLayoutSpacing.fixed(45)
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(
                    top: 5,
                    leading: 5,
                    bottom: 5,
                    trailing: 5)
                let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
                sectionLayout.orthogonalScrollingBehavior = .groupPaging
                let layoutSectionHeaderSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.93),
                    heightDimension: .estimated(30))
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                sectionLayout.boundarySupplementaryItems = [layoutSectionHeader]
                sectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 40, trailing: 0)
                return sectionLayout

            case .peopleAndPlace:

                let trailingItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1/2),
                    heightDimension: .fractionalHeight(1)))

                let leadingItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1/4),
                    heightDimension: .fractionalHeight(1/2)))
                trailingItem.contentInsets = NSDirectionalEdgeInsets(
                    top: 50,
                    leading: 5,
                    bottom: 5,
                    trailing: 5)
                leadingItem.contentInsets = NSDirectionalEdgeInsets(
                    top: 5,
                    leading: 5,
                    bottom: 5,
                    trailing: 5)

                let leadingGroupFirst = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1/4),
                    heightDimension: .fractionalHeight(1)),
                                                                      repeatingSubitem: leadingItem,
                                                                      count: 2)
                let leadingGroupSecond = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1/4),
                    heightDimension: .fractionalHeight(1)),
                                                                      repeatingSubitem: leadingItem,
                                                                      count: 2)
                let allGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .estimated(250)),
                                                                  subitems: [leadingGroupFirst, leadingGroupSecond, trailingItem])
                let section = NSCollectionLayoutSection(group: allGroup)
                let layoutSectionHeaderSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.93),
                    heightDimension: .estimated(30))
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                section.boundarySupplementaryItems = [layoutSectionHeader]
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 40, trailing: 0)
                return section

           
            case .typeMedua:
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)))
                item.contentInsets = NSDirectionalEdgeInsets(
                    top: 2,
                    leading: 2,
                    bottom: 2,
                    trailing: 2)
                let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .estimated(40)), subitems: [item])
                group.contentInsets = NSDirectionalEdgeInsets(
                    top: 5,
                    leading: 0,
                    bottom: 0,
                    trailing: 0)
                let section = NSCollectionLayoutSection(group: group)
                let layoutSectionHeaderSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.93),
                    heightDimension: .estimated(30))
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                section.boundarySupplementaryItems = [layoutSectionHeader]
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 40, trailing: 0)

                return section

            case .other:
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)))
                item.contentInsets = NSDirectionalEdgeInsets(
                    top: 2,
                    leading: 2,
                    bottom: 2,
                    trailing: 2)
                let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .estimated(40)), subitems: [item])
                group.contentInsets = NSDirectionalEdgeInsets(
                    top: 5,
                    leading: 0,
                    bottom: 0,
                    trailing: 0)
                let section = NSCollectionLayoutSection(group: group)
                let layoutSectionHeaderSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.93),
                    heightDimension: .estimated(30))
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                section.boundarySupplementaryItems = [layoutSectionHeader]
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 40, trailing: 0)
                return section

            }
        }

    }
}


extension AlbumsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        model.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Model.array[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let modelData = model[indexPath.section][indexPath.item]

        switch modelData.typeSection {

        case .myAlbums:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyAlbumsCell.identifier, for: indexPath) as! MyAlbumsCell
            cell.configuration(model: modelData)
            return cell

        case .peopleAndPlace:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PeopleAndPlaceCell.identifier, for: indexPath) as! PeopleAndPlaceCell
            cell.configuration(model: modelData)
            return cell

        case .typeMedua:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TypeMediaCell.identifier, for: indexPath) as! TypeMediaCell
            cell.configuration(model: modelData)
            return cell

        case .other:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TypeMediaCell.identifier, for: indexPath) as! TypeMediaCell
            cell.configuration(model: modelData)
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        let modelData = model[indexPath.section][indexPath.item]

        switch modelData.typeSection {
        case .myAlbums:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCell.identifier, for: indexPath) as! HeaderCell
            header.label.text = "Мои Альбомы"
            return header
        case .peopleAndPlace:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCell.identifier, for: indexPath) as! HeaderCell
            header.label.text = "Люди и места"
            return header
        case .typeMedua:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCell.identifier, for: indexPath) as! HeaderCell
            header.label.text = "Типы медиафайлов"
            return header
        case .other:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCell.identifier, for: indexPath) as! HeaderCell
            header.label.text = "Другое"
            return header
        }

    }


}

