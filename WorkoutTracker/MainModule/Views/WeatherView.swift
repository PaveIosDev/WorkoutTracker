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
    
    private let weatherDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Хорошая погода, чтобы позаниматься на улице"
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 2
        label.textColor = .specialGray
        label.font = .robotoMedium14()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let weatherIconImageView: UIImageView = {
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
        addSubview(weatherDescriptionLabel)
        addSubview(weatherIconImageView)
    }
    
    public func updateImage(data: Data) {
        guard let image = UIImage(data: data) else { return }
        weatherIconImageView.image = image
    }
    
    public func updateLabels(model: WeatherModel) {
        weatherStatusLabel.text = model.weather[0].myDescription + " \(model.main.temperatureCelsius)C"
        
        switch model.weather[0].weatherDescription {
        case "clear sky":
            weatherDescriptionLabel.text = "Лучше остаться дома и провести домашнюю тренировку"
        default:
            weatherDescriptionLabel.text = "Нет данных"
        }
    }
}

extension WeatherView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            weatherStatusLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            weatherStatusLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            weatherStatusLabel.trailingAnchor.constraint(equalTo: weatherIconImageView.leadingAnchor, constant: -10),
            weatherStatusLabel.heightAnchor.constraint(equalToConstant: 20),
            
            weatherDescriptionLabel.topAnchor.constraint(equalTo: weatherStatusLabel.bottomAnchor, constant: 0),
            weatherDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            weatherDescriptionLabel.trailingAnchor.constraint(equalTo: weatherIconImageView.leadingAnchor, constant: -10),
            weatherDescriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
            weatherIconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            weatherIconImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            weatherIconImageView.heightAnchor.constraint(equalToConstant: 60),
            weatherIconImageView.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
}
