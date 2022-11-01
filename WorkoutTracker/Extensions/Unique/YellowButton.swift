//
//  YellowButton.swift
//  WorkoutTracker
//
//  Created by Павел Яковенко on 01.11.2022.
//

import UIKit

class YellowButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(text: String) {
        self.init(type: .system)
        setTitle(text, for: .normal)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .specialYellow
        titleLabel?.font = .robotoBold16()
        tintColor = .specialGray
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
    }
}
