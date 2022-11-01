//
//  SetsAndRepsView.swift
//  WorkoutTracker
//
//  Created by Павел Яковенко on 30.10.2022.
//

import UIKit

class SetsAndRepsView: UIView {
    
    private let detailsLabel = UILabel(text: "Details")
    
    private let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialBrown
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    private let exerciseView = ExerciseView()
    private lazy var nextSetButton = YellowButton(text: "NEXT SET")

    
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
        //backgroundColor = .red
        addSubview(detailsLabel)
        addSubview(backView)
        addSubview(exerciseView)
        addSubview(nextSetButton)
        nextSetButton.addTarget(self, action: #selector(nextSetButtonTapped), for: .touchUpInside)
    }
    
    @objc private func nextSetButtonTapped() {
        print("nextSetButtonTapped")
    }
}

// MARK: - setConstraints

extension SetsAndRepsView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            detailsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            detailsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
            detailsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
        
            backView.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: 3),
            backView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            exerciseView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 14),
            exerciseView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 15),
            exerciseView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -15),
            
            nextSetButton.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: 185),
            nextSetButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 19),
            nextSetButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -19),
            nextSetButton.heightAnchor.constraint(equalToConstant: 43)
        ])
    }
}
