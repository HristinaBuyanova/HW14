//
//  CollectionViewCell.swift
//  HW14
//
//  Created by Христина Буянова on 29.10.2023.
//

import UIKit

class MyAlbumsCell: UICollectionViewCell {

    static let identifier = "albumsCell"

//    MARK: - Outlets

    lazy var photo: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    lazy var heart: UIImageView = {
        let image = UIImageView()
        image.tintColor = .white
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    lazy var nameAlbumLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var countPhotoLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textColor = .systemGray2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

//    MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//    MARK: - Setup

    private func setupHierarchy() {
        addSubview(photo)
        addSubview(nameAlbumLabel)
        addSubview(countPhotoLabel)
        addSubview(heart)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            photo.leadingAnchor.constraint(equalTo: leadingAnchor),
            photo.topAnchor.constraint(equalTo: topAnchor),
            photo.heightAnchor.constraint(equalToConstant: 180),
            photo.widthAnchor.constraint(equalToConstant: 180),

            nameAlbumLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameAlbumLabel.topAnchor.constraint(equalTo: photo.bottomAnchor, constant: 5),

            countPhotoLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            countPhotoLabel.topAnchor.constraint(equalTo: nameAlbumLabel.bottomAnchor, constant: 5),

            heart.bottomAnchor.constraint(equalTo: photo.bottomAnchor, constant: -10),
            heart.leadingAnchor.constraint(equalTo: photo.leadingAnchor, constant: 10)
        ])
    }

    func configuration(model: Model) {
        self.nameAlbumLabel.text = model.title
        self.countPhotoLabel.text = model.countTitle
        self.photo.image = UIImage(named: model.image)
        self.heart.image = UIImage(systemName: model.heart ?? "")
    }
}
