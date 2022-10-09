//
//  WeatherView.swift
//  WorkoutTracker
//
//  Created by Павел Яковенко on 05.10.2022.
//

import UIKit

class WeatherView: UIView {
    
    private let weatherStatusLabel: UILabel = {
        let label = UILabel()
        label.text = "Солнечно"
        label.textColor = .specialGray
        label.font = .robotoMedium18()
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let weatherLabelDescription: UILabel = {
        let label = UILabel()
        label.text = "Хорошая погода, чтобы позаниматься на улице"
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 2
        label.textColor = .specialGray
        label.font = .robotoMedium14()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imageViewSun: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "sun")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
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
        backgroundColor = #colorLiteral(red: 0.9813231826, green: 0.9813460708, blue: 0.9813337922, alpha: 1)
        layer.cornerRadius = 10
        addShadowOnView()
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(weatherStatusLabel)
        addSubview(weatherLabelDescription)
        addSubview(imageViewSun)
    }
}

extension WeatherView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            weatherStatusLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            weatherStatusLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            weatherStatusLabel.trailingAnchor.constraint(equalTo: imageViewSun.leadingAnchor, constant: -10),
            weatherStatusLabel.heightAnchor.constraint(equalToConstant: 20),
            
            weatherLabelDescription.topAnchor.constraint(equalTo: weatherStatusLabel.bottomAnchor, constant: 0),
            weatherLabelDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            weatherLabelDescription.trailingAnchor.constraint(equalTo: imageViewSun.leadingAnchor, constant: -10),
            weatherLabelDescription.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
            imageViewSun.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageViewSun.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            imageViewSun.heightAnchor.constraint(equalToConstant: 60),
            imageViewSun.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
}
