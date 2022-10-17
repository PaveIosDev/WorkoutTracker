//
//  DateAndRepeatView.swift
//  WorkoutTracker
//
//  Created by Павел Яковенко on 16.10.2022.
//

import UIKit

class DateAndRepeatView : UIView {
    
//    private let dateAndRepeatView: UIView = {
//        let dateAndRepeatView = UIView()
//        dateAndRepeatView.layer.cornerRadius = 10
//        dateAndRepeatView.backgroundColor = .specialBrown
//        dateAndRepeatView.translatesAutoresizingMaskIntoConstraints = false
//        return dateAndRepeatView
//    }()
    
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
    }
 
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
        
        
        ])
    }
}
