//
//  RepsOrTimerView.swift
//  WorkoutTracker
//
//  Created by Павел Яковенко on 16.10.2022.
//

import UIKit

class RepsOrTimerView: UIView {
    
    private let repsOrTimerLabel = UILabel(text: "Повторения или таймер")
    
    private let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialBrown
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let setsView = SliderView(name: "Подходы", minValue: 0, maxValue: 10, type: .sets)
    private let repsView = SliderView(name: "Повторения", minValue: 0, maxValue: 50, type: .reps)
    private let timerView = SliderView(name: "Таймер", minValue: 0, maxValue: 600, type: .timer)

    private let repeatOrTimerLabel = UILabel(text: "Выбери повторения или таймер")

    private var stackView = UIStackView()
    
    public var (sets, reps, timer) = (0, 0, 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
        setDegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        repeatOrTimerLabel.textAlignment = .center

        addSubview(repsOrTimerLabel)
        addSubview(backView)
        
        stackView = UIStackView(arrangedSubviews: [setsView,
                                                   repeatOrTimerLabel,
                                                  repsView,
                                                  timerView],
                                axis: .vertical,
                                spacing: 20)
        backView.addSubview(stackView)
    }
    
    private func setDegates() {
        setsView.delegate = self
        repsView.delegate = self
        timerView.delegate = self
    }
    
    public func resetSliderViewValues() {
        setsView.resetValues()
        repsView.resetValues()
        timerView.resetValues()
    }
    
}


// MARK: - SliderViewProtocol

extension RepsOrTimerView: SliderViewProtocol {
    func changeValue(type: SliderType, value: Int) {
        switch type {
        case .sets:
            sets = value
        case .reps:
            reps = value
            repsView.isActive = true
            timerView.isActive = false
            timer = 0
        case .timer:
            timer = value
            timerView.isActive = true
            repsView.isActive = false
            reps = 0
        }
    }
    
}

    // MARK: - setConstraints

extension RepsOrTimerView {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            repsOrTimerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            repsOrTimerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
            repsOrTimerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            
            backView.topAnchor.constraint(equalTo: repsOrTimerLabel.bottomAnchor, constant: 3),
            backView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),

            stackView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 15),
            stackView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -15)
        ])
    }
}


