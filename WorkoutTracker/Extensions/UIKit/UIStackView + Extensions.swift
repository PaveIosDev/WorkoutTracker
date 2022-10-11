//
//  UIStackView + Extensions.swift
//  WorkoutTracker
//
//  Created by Павел Яковенко on 11.10.2022.
//

import UIKit
//let stackView = UIStackView()
//stackView.addArrangedSubview(YourView)
//stackView.addArrangedSubview(YourView2)
//stackView.axis = .horizontal
//stackView.spacing = 10
//stackView.translatesAutoresizingMaskIntoConstraints = false

extension UIStackView {
    convenience init(arrangedSubviews: [UIView], spacing: CGFloat) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = .horizontal
        self.spacing = spacing
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
