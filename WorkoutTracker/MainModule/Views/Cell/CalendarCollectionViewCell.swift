//
//  CalendarCollectionViewCell.swift
//  WorkoutTracker
//
//  Created by Павел Яковенко on 09.10.2022.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
    
    private let dayOfWeekLabel: UILabel = {
        let label = UILabel()
        label.text = "We"
        label.font = .robotoBold16()
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let numberOfDayLabel: UILabel = {
        let label = UILabel()
        label.text = "07"
        label.font = .robotoBold20()
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                backgroundColor = .specialYellow
                dayOfWeekLabel.textColor = .specialBlack
                numberOfDayLabel.textColor = .specialDarkGreen
            } else {
                backgroundColor = .specialGreen
                dayOfWeekLabel.textColor = .white
                numberOfDayLabel.textColor = .white
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        layer.cornerRadius = 10
        
        addSubview(dayOfWeekLabel)
        addSubview(numberOfDayLabel)
    }
    
    func dateForCell(numberOfDay: String, dayOfWeek: String) {
        dayOfWeekLabel.text = dayOfWeek
        numberOfDayLabel.text = numberOfDay
    }
}

// MARK: - setConstraints

extension CalendarCollectionViewCell {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            dayOfWeekLabel.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            dayOfWeekLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            numberOfDayLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            numberOfDayLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
