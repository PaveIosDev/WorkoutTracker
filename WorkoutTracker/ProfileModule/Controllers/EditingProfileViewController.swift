//
//  EditingProfileViewController.swift
//  WorkoutTracker
//
//  Created by Павел Яковенко on 20.11.2022.
//

import UIKit

class EditingProfileViewController: UIViewController {

    let profileView = ProfileView()
    
    private let firstNameLabel = UILabel(text: "First name",
                                         font: .robotoMedium14(),
                                         textColor: .specialLightBrown)
    
    private let firstNameTextField = BrownTextField()
    
    private let secondNameLabel = UILabel(text: "Second name",
                                         font: .robotoMedium14(),
                                         textColor: .specialLightBrown)
    
    private let secondNameTextField = BrownTextField()
    
    private let heightLabel = UILabel(text: "Height",
                                         font: .robotoMedium14(),
                                         textColor: .specialLightBrown)
    
    private let heightTextField = BrownTextField()
    
    private let weightLabel = UILabel(text: "Weight",
                                         font: .robotoMedium14(),
                                         textColor: .specialLightBrown)
    
    private let weightTextField = BrownTextField()
    
    private lazy var saveButton = GreenButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }

    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(profileView)
        view.addSubview(firstNameLabel)
        view.addSubview(firstNameTextField)
        view.addSubview(secondNameLabel)
        view.addSubview(secondNameTextField)
        view.addSubview(heightLabel)
        view.addSubview(heightTextField)
        view.addSubview(weightLabel)
        view.addSubview(weightTextField)
        view.addSubview(saveButton)
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    @objc func saveButtonTapped() {
        print("save")
    }
}

//MARK: - setConstraints

extension EditingProfileViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            profileView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileView.heightAnchor.constraint(equalToConstant: 210),
            profileView.widthAnchor.constraint(equalToConstant: 360),
            
            firstNameLabel.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 39),
            firstNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            
            firstNameTextField.topAnchor.constraint(equalTo: firstNameLabel.bottomAnchor, constant: 2),
            firstNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            firstNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
            firstNameTextField.heightAnchor.constraint(equalToConstant: 40),
        
            secondNameLabel.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor, constant: 16),
            secondNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            
            secondNameTextField.topAnchor.constraint(equalTo: secondNameLabel.bottomAnchor, constant: 2),
            secondNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            secondNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
            secondNameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            heightLabel.topAnchor.constraint(equalTo: secondNameTextField.bottomAnchor, constant: 16),
            heightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),

            heightTextField.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 2),
            heightTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            heightTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
            heightTextField.heightAnchor.constraint(equalToConstant: 40),

            weightLabel.topAnchor.constraint(equalTo: heightTextField.bottomAnchor, constant: 16),
            weightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),

            weightTextField.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 2),
            weightTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            weightTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
            weightTextField.heightAnchor.constraint(equalToConstant: 40)
            
//           saveButton.topAnchor.constraint(equalTo: weightTextField.bottomAnchor, constant: 41),
//            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            saveButton.widthAnchor.constraint(equalToConstant: 345),
//            saveButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}
