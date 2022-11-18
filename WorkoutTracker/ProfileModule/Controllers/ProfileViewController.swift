//
//  ProfileViewController.swift
//  WorkoutTracker
//
//  Created by Павел Яковенко on 18.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {


    private let profileView = ProfileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        view.addSubview(profileView)
    }
}

//MARK: - setConstraints

extension ProfileViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            profileView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileView.heightAnchor.constraint(equalToConstant: 210),
            profileView.widthAnchor.constraint(equalToConstant: 360)
        
        ])
    }
    
}
