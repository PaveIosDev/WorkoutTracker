//
//  ProfileView.swift
//  WorkoutTracker
//
//  Created by Павел Яковенко on 18.11.2022.
//

import UIKit

class ProfileView: UIView {
    
    private let profileLabel = UILabel(text: "PROFILE",
                                       font: .robotoMedium24(),
                                       textColor: .specialGray)

    private let nameLabel = UILabel(text: "PAVEL YAKOVENKO", font: .robotoMedium24(), textColor: .white)


    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .specialLightBrown
        imageView.layer.borderWidth = 5
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 50
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let avatarView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialGreen
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {

        translatesAutoresizingMaskIntoConstraints = false

        addSubview(profileLabel)
        addSubview(avatarView)
        addSubview(avatarImageView)
        addSubview(nameLabel)
    }
}

//MARK: - setConstraints

extension ProfileView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
            profileLabel.topAnchor.constraint(equalTo: topAnchor, constant: 3),
            profileLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            avatarImageView.centerYAnchor.constraint(equalTo: avatarView.topAnchor),
            avatarImageView.centerXAnchor.constraint(equalTo: avatarView.centerXAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),

            avatarView.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 64),
            avatarView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            avatarView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            avatarView.heightAnchor.constraint(equalToConstant: 112),

            nameLabel.topAnchor.constraint(equalTo: avatarView.topAnchor, constant: 70),
            nameLabel.centerXAnchor.constraint(equalTo: avatarView.centerXAnchor),

        ])
    }
}
