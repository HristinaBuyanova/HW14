//
//  TypeMediaCell.swift
//  HW14
//
//  Created by Христина Буянова on 01.11.2023.
//

import UIKit

class TypeMediaCell: UICollectionViewCell {

    static let identifier = "typeMediaCell"

//    MARK: - Outlets

    lazy var icon: UIImageView = {
        let image = UIImageView()
        image.tintColor = .systemBlue
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    lazy var chevron: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "chevron.right")
        image.tintColor = .systemGray2
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .systemBlue
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var countPhotoLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textColor = .systemGray2
        label.textAlignment = .right
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
        addSubview(icon)
        addSubview(nameLabel)
        addSubview(countPhotoLabel)
        addSubview(chevron)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            icon.centerYAnchor.constraint(equalTo: centerYAnchor),
            icon.heightAnchor.constraint(equalToConstant: 25),
            icon.widthAnchor.constraint(equalToConstant: 25),

            chevron.centerYAnchor.constraint(equalTo: centerYAnchor),
            chevron.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),

            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

            countPhotoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            countPhotoLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    func configuration(model: Model) {
        self.nameLabel.text = model.title
        self.countPhotoLabel.text = model.countTitle
        self.icon.image = UIImage(systemName: model.image)

    }
}
