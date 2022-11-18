//
//  ProfileViewController.swift
//  WorkoutTracker
//
//  Created by Павел Яковенко on 18.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {


    private let profileView = ProfileView()
    
    private let heightLabel = UILabel(text: "Height: 178",
                                      font: .robotoBold16(),
                                      textColor: .specialGray)
    private let weightLabel = UILabel(text: "Weight: 77",
                                      font: .robotoBold16(),
                                      textColor: .specialGray)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        view.addSubview(profileView)
        view.addSubview(heightLabel)
        view.addSubview(weightLabel)
    }
}

//MARK: - setConstraints

extension ProfileViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            profileView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileView.heightAnchor.constraint(equalToConstant: 210),
            profileView.widthAnchor.constraint(equalToConstant: 360),
        
            
            heightLabel.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 5),
            heightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            
            weightLabel.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 5),
            weightLabel.leadingAnchor.constraint(equalTo: heightLabel.trailingAnchor, constant: 14)
        ])
    }
    
}
