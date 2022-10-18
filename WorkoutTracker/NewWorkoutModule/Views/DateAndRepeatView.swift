//
//  DateAndRepeatView.swift
//  WorkoutTracker
//
//  Created by Павел Яковенко on 16.10.2022.
//

import UIKit

class DateAndRepeatView: UIView {
    
    private let dateAndRepeatLabel = UILabel(text: "Date and repeat")
    
    private let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialBrown
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let dateLabel = UILabel(text: "Date",
                                    font: .robotoMedium18(),
                                    textColor: .specialGray)

    private let datePicker: UIDatePicker = {
       let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.tintColor = .specialGreen
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
    private let repeatLabel = UILabel(text: "Repeat every 7 days",
                                      font: .robotoMedium18(),
                                      textColor: .specialGray)

    private let repeatSwitch: UISwitch = {
        let repeatSwitch = UISwitch()
        repeatSwitch.isOn = true
        repeatSwitch.onTintColor = .specialGreen
        repeatSwitch.translatesAutoresizingMaskIntoConstraints = false
       return repeatSwitch
    }()

    private var dateStackView = UIStackView()
    private var repeatStackView = UIStackView()

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
        
        addSubview(dateAndRepeatLabel)
        addSubview(backView)
        
        dateStackView = UIStackView(arrangedSubviews: [dateLabel,
                                                       datePicker],
                                    axis: .horizontal,
                                    spacing: 10)
        backView.addSubview(dateStackView)

        repeatStackView = UIStackView(arrangedSubviews: [repeatLabel,
                                                         repeatSwitch],
                                      axis: .horizontal,
                                      spacing: 10)
        backView.addSubview(repeatStackView)
    }

    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            dateAndRepeatLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            dateAndRepeatLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
            dateAndRepeatLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            
            backView.topAnchor.constraint(equalTo: dateAndRepeatLabel.bottomAnchor, constant: 3),
            backView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
  
            dateStackView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 10),
            dateStackView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 15),
            dateStackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -15),

            repeatStackView.topAnchor.constraint(equalTo: dateStackView.bottomAnchor, constant: 10),
            repeatStackView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 15),
            repeatStackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -15)
        ])
    }
}
