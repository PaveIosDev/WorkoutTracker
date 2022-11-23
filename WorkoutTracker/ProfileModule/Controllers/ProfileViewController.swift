//
//  ProfileViewController.swift
//  WorkoutTracker
//
//  Created by Павел Яковенко on 18.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private let profileLabel = UILabel(text: "PROFILE",
                                           font: .robotoMedium24(),
                                           textColor: .specialGray)
    
    private let profileView = ProfileView()
    
    private let heightLabel = UILabel(text: "Height: 178",
                                      font: .robotoBold16(),
                                      textColor: .specialGray)
    private let weightLabel = UILabel(text: "Weight: 77",
                                      font: .robotoBold16(),
                                      textColor: .specialGray)
    
    private lazy var  editingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "edittingImage")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.setTitle("Editing", for: .normal)
        button.contentHorizontalAlignment = .right
        button.tintColor = .specialGreen
        button.titleLabel?.font = .robotoBold16()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(editingButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let profileCollectionView = ProfileCollectionView()

    private let targetLabel = UILabel(text: "TARGET: 20 workouts", font: .robotoBold16(), textColor: .specialGray)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        view.addSubview(profileLabel)
        view.addSubview(profileView)
        view.addSubview(heightLabel)
        view.addSubview(weightLabel)
        view.addSubview(editingButton)
        view.addSubview(profileCollectionView)
        view.addSubview(targetLabel)
    }
    
    @objc private func editingButtonTapped(model: WorkoutModel) {
                let editingProfileViewController = EditingProfileViewController()
                editingProfileViewController.modalPresentationStyle = .fullScreen
                present(editingProfileViewController, animated: true)
            
    }
}

//MARK: - setConstraints

extension ProfileViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            profileLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            profileLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            profileView.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 54),
            profileView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileView.heightAnchor.constraint(equalToConstant: 118),
            profileView.widthAnchor.constraint(equalToConstant: 360),
        
            
            heightLabel.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 5),
            heightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            
            weightLabel.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 5),
            weightLabel.leadingAnchor.constraint(equalTo: heightLabel.trailingAnchor, constant: 14),
            
            editingButton.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 5),
            editingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -17),
            
            profileCollectionView.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 51),
            profileCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            profileCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
            profileCollectionView.heightAnchor.constraint(equalToConstant: 250),
            
            targetLabel.topAnchor.constraint(equalTo: profileCollectionView.bottomAnchor, constant: 23),
            targetLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14)
        ])
    }
}
