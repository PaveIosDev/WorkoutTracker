//
//  CollectionProfileViewCell.swift
//  WorkoutTracker
//
//  Created by Павел Яковенко on 20.11.2022.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    
    private let nameLabel: UILabel = {
        let label = UILabel(text: "PUSH UPS", font: .robotoBold24(), textColor: .specialLightBrown)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let exerciseImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "PUSH UPS")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel(text: "180", font: .robotoBold48(), textColor: .white)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews () {
        backgroundColor = .specialYellow
        layer.cornerRadius = 10
        
        addSubview(nameLabel)
        addSubview(exerciseImageView)
        addSubview(resultLabel)
    }
}

extension ProfileCollectionViewCell {
    
    private func setConstraints () {
        NSLayoutConstraint.activate([
        
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            exerciseImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 12),
            exerciseImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 13),
            exerciseImageView.widthAnchor.constraint(equalToConstant: 57),
            exerciseImageView.heightAnchor.constraint(equalToConstant: 57),
            
            resultLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 12),
            resultLabel.leadingAnchor.constraint(equalTo: exerciseImageView.trailingAnchor, constant: 13),
            resultLabel.widthAnchor.constraint(equalToConstant: 82),
            resultLabel.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}
