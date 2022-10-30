//
//  StartWorkoutViewController.swift
//  WorkoutTracker
//
//  Created by Павел Яковенко on 30.10.2022.
//

import UIKit

class StartWorkoutViewController: UIViewController {

    private let startWorkoutLabel = UILabel(text: "START WORKOUT",
                                            font: .robotoMedium24(),
                                            textColor: .specialGray)
    private lazy var closeButton = CloseButton(type: .system)
    
    private let startWorkoutImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "startWorkoutImage")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var finishButton = GreenButton(text: "FINISH")
    private let setsAndRepsView = SetsAndRepsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(startWorkoutLabel)
        view.addSubview(closeButton)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        
        view.addSubview(setsAndRepsView)
        
        view.addSubview(startWorkoutImage)
        view.addSubview(finishButton)
        finishButton.addTarget(self, action: #selector(finishButtonTapped), for: .touchUpInside)
    }
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true)
        print("closeButtonTapped убрать этот принт")
    }
    
    @objc private func finishButtonTapped() {
        print("finishButtonTapped")
    }
    
}

//MARK: - setConstraints

extension StartWorkoutViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            startWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            startWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            closeButton.centerYAnchor.constraint(equalTo: startWorkoutLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 33),
            closeButton.widthAnchor.constraint(equalToConstant: 33),
            
            startWorkoutImage.topAnchor.constraint(equalTo: startWorkoutLabel.bottomAnchor, constant: 28),
            startWorkoutImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startWorkoutImage.heightAnchor.constraint(equalToConstant: 250),
            startWorkoutImage.widthAnchor.constraint(equalToConstant: 189),
            
            setsAndRepsView.topAnchor.constraint(equalTo: startWorkoutImage.bottomAnchor, constant: 26),
            setsAndRepsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            setsAndRepsView.heightAnchor.constraint(equalToConstant: 256),
            setsAndRepsView.widthAnchor.constraint(equalToConstant: 345),

            
            finishButton.topAnchor.constraint(equalTo: startWorkoutImage.bottomAnchor, constant: 295),
            finishButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            finishButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            finishButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}
