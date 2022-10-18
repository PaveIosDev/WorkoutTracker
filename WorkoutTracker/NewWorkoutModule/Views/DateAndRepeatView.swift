//
//  DateAndRepeatView.swift
//  WorkoutTracker
//
//  Created by Павел Яковенко on 16.10.2022.
//

import UIKit

class DateAndRepeatView : UIView {
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Date"
        label.textColor = .specialGray
        label.font = .robotoMedium18()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let repeatLabel: UILabel = {
        let label = UILabel()
        label.text = "Repeat every 7 days"
        label.textColor = .specialGray
        label.font = .robotoMedium18()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let datePicker : UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.tintColor = .specialGreen
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
    private let repeatSwitch : UISwitch = {
        let repeatSwitch = UISwitch()
        repeatSwitch.onTintColor = .specialGreen
        repeatSwitch.translatesAutoresizingMaskIntoConstraints = false
        return repeatSwitch
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
        
        addSubview(dateLabel)
        addSubview(repeatLabel)
        addSubview(datePicker)
        datePicker.subviews[0].subviews[0].subviews[0].alpha = 0
        
        addSubview(repeatSwitch)
    }
 
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
            dateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 17),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            dateLabel.widthAnchor.constraint(equalToConstant: 88),
            
            repeatLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 13),
            repeatLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            repeatLabel.widthAnchor.constraint(equalToConstant: 183),
            
            datePicker.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor),
            datePicker.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11),
            
            repeatSwitch.centerYAnchor.constraint(equalTo: repeatLabel.centerYAnchor),
            repeatSwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14)
        
        ])
    }
}
