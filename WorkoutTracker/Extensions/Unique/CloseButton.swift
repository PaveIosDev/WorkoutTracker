//
//  CloseButton.swift
//  WorkoutTracker
//
//  Created by Павел Яковенко on 18.10.2022.
//

import UIKit

class CloseButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        setBackgroundImage(UIImage(named: "closeButton"), for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
