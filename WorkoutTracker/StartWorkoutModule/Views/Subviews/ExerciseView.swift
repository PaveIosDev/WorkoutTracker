//
//  ExerciseView.swift
//  WorkoutTracker
//
//  Created by Павел Яковенко on 30.10.2022.
//

import UIKit

class ExerciseView: UIView {
    
    private let exerciseLabel = UILabel(text: "Biceps",
                                        font: .robotoMedium24(),
                                        textColor: .specialGray)
    private let setsLabel = UILabel(text: "Sets",
                                    font: .robotoMedium18(),
                                    textColor: .specialGray)
    private let setsValueLabel = UILabel(text: "1/4",
                                         font: .robotoMedium18(),
                                         textColor: .specialGray)
   
    private let lineViewSets: UIView = {
        let view = UIView()
        view.backgroundColor = .specialLightBrown
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let repsLabel = UILabel(text: "Reps",
                                    font: .robotoMedium18(),
                                    textColor: .specialGray)
    private let repsValueLabel = UILabel(text: "20",
                                         font: .robotoMedium18(),
                                         textColor: .specialGray)
   
    private let lineViewReps: UIView = {
        let view = UIView()
        view.backgroundColor = .specialLightBrown
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
        addSubview(exerciseLabel)
        addSubview(setsLabel)
        addSubview(setsValueLabel)
        addSubview(lineViewSets)
        addSubview(repsLabel)
        addSubview(repsValueLabel)
        addSubview(lineViewReps)
    }
    

}

// MARK: - setConstraints

extension ExerciseView {
    
private func setConstraints() {
    NSLayoutConstraint.activate([
        exerciseLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        
        setsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 58),
        setsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        
        setsValueLabel.centerYAnchor.constraint(equalTo: setsLabel.centerYAnchor),
        setsValueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        
        lineViewSets.topAnchor.constraint(equalTo: setsLabel.bottomAnchor, constant: 3),
        lineViewSets.heightAnchor.constraint(equalToConstant: 1),
        lineViewSets.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        lineViewSets.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        
        repsLabel.topAnchor.constraint(equalTo: lineViewSets.bottomAnchor, constant: 25),
        repsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        
        repsValueLabel.centerYAnchor.constraint(equalTo: repsLabel.centerYAnchor),
        repsValueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        
        lineViewReps.topAnchor.constraint(equalTo: repsLabel.bottomAnchor, constant: 3),
        lineViewReps.heightAnchor.constraint(equalToConstant: 1),
        lineViewReps.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        lineViewReps.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        
        ])
    }
}
