//
//  RepsOfTimerView.swift
//  WorkoutTracker
//
//  Created by Павел Яковенко on 16.10.2022.
//

import UIKit

class RepsOfTimerView : UIView {
    
    private let setsLabel: UILabel = {
        let label = UILabel()
        label.text = "Sets"
        label.textColor = .specialGray
        label.font = .robotoMedium18()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let valueSetsLabel: UILabel = {
        let label = UILabel()
        label.text = "4"
        label.textColor = .specialGray
        label.font = .robotoMedium18()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let setsSlider: UISlider = {
        let setsSlider = UISlider()
        setsSlider.minimumTrackTintColor = .specialGreen
        setsSlider.maximumTrackTintColor = .specialLightBrown
        setsSlider.addTarget(self, action: #selector(setsSliderChanged), for: .valueChanged)
        setsSlider.translatesAutoresizingMaskIntoConstraints = false
        return setsSlider
    }()
    
    private let repeatOrTimerLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose repeat or timer"
        label.textColor = .specialLightBrown
        label.font = .robotoMedium14()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let repsLabel: UILabel = {
        let label = UILabel()
        label.text = "Reps"
        label.textColor = .specialGray
        label.font = .robotoMedium18()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let valueRepsLabel: UILabel = {
        let label = UILabel()
        label.text = "10"
        label.textColor = .specialGray
        label.font = .robotoMedium18()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let repsSlider: UISlider = {
        let repsSlider = UISlider()
        repsSlider.minimumTrackTintColor = .specialGreen
        repsSlider.maximumTrackTintColor = .specialLightBrown
        repsSlider.addTarget(self, action: #selector(repsSliderChanged), for: .valueChanged)
        repsSlider.translatesAutoresizingMaskIntoConstraints = false
        return repsSlider
    }()
    
    private let timerLabel: UILabel = {
        let label = UILabel()
        label.text = "Timer"
        label.textColor = .specialLightBrown
        label.font = .robotoMedium18()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let valueTimerLabel: UILabel = {
        let label = UILabel()
        label.text = "1min 30 sec"
        label.textColor = .specialLightBrown
        label.font = .robotoMedium18()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timerSlider: UISlider = {
        let timerSlider = UISlider()
        timerSlider.minimumTrackTintColor = .specialLightBrown
        timerSlider.maximumTrackTintColor = .specialLightBrown
        timerSlider.addTarget(self, action: #selector(repsSliderChanged), for: .valueChanged)
        timerSlider.translatesAutoresizingMaskIntoConstraints = false
        return timerSlider
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
        backgroundColor = .specialBrown
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(setsLabel)
        addSubview(valueSetsLabel)
        addSubview(setsSlider)
        
        addSubview(repeatOrTimerLabel)
        
        addSubview(repsLabel)
        addSubview(valueRepsLabel)
        addSubview(repsSlider)
        
        addSubview(timerLabel)
        addSubview(valueTimerLabel)
        addSubview(timerSlider)
    }
    
    @objc func setsSliderChanged() {
        print(setsSlider.value)
    }
    
    @objc func repsSliderChanged() {
        print(repsSlider.value)
    }
 
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
            setsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 23),
            setsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            
            valueSetsLabel.centerYAnchor.constraint(equalTo: setsLabel.centerYAnchor),
            valueSetsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -13),
            
            setsSlider.topAnchor.constraint(equalTo: setsLabel.bottomAnchor, constant: 16),
            setsSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setsSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            repeatOrTimerLabel.topAnchor.constraint(equalTo: setsSlider.bottomAnchor, constant: 32),
            repeatOrTimerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            repsLabel.topAnchor.constraint(equalTo: repeatOrTimerLabel.bottomAnchor, constant: 16),
            repsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            
            valueRepsLabel.centerYAnchor.constraint(equalTo: repsLabel.centerYAnchor),
            valueRepsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -13),
            
            repsSlider.topAnchor.constraint(equalTo: repsLabel.bottomAnchor, constant: 16),
            repsSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            repsSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            timerLabel.topAnchor.constraint(equalTo: repsSlider.bottomAnchor, constant: 16),
            timerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            
            valueTimerLabel.centerYAnchor.constraint(equalTo: timerLabel.centerYAnchor),
            valueTimerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -13),
            
            timerSlider.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 16),
            timerSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            timerSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
}
