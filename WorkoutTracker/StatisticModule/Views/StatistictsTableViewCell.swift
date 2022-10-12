//
//  StatistictsTableViewCell.swift
//  WorkoutTracker
//
//  Created by Павел Яковенко on 12.10.2022.
//

import UIKit

class StatistictsTableViewCell: UITableViewCell {
    
    private let differenceLabel: UILabel = {
        let label = UILabel()
        label.text = "+2"
        label.textColor = .specialGreen
        label.font = .robotoMedium24()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Biceps"
        label.textColor = .specialGray
        label.font = .robotoMedium24()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let beforeLabel: UILabel = {
        let label = UILabel()
        label.text = "Before: 18"
        label.font = .robotoMedium14()
        label.textColor = .specialLightBrown
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nowLabel: UILabel = {
        let label = UILabel()
        label.text = "Now: 20"
        label.font = .robotoMedium14()
        label.textColor = .specialLightBrown
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialLightBrown
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .clear
        selectionStyle = .none
        
        addSubview(differenceLabel)
        addSubview(lineView)
        addSubview(nameLabel)
        addSubview(beforeLabel)
        addSubview(nowLabel)
    }
}

// MARK: - setConstraints

extension StatistictsTableViewCell {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
            differenceLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            differenceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            differenceLabel.widthAnchor.constraint(equalToConstant: 50),
        
            lineView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            lineView.heightAnchor.constraint(equalToConstant: 1),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 3),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nameLabel.heightAnchor.constraint(equalToConstant: 28),
            
            beforeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 1),
            beforeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            beforeLabel.heightAnchor.constraint(equalToConstant: 21),
            
            nowLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 1),
            nowLabel.leadingAnchor.constraint(equalTo: beforeLabel.trailingAnchor, constant: 10),
            nowLabel.heightAnchor.constraint(equalToConstant: 21)
        ])
    }
}
