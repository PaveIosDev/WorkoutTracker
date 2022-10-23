//
//  Int + Extensions.swift
//  WorkoutTracker
//
//  Created by Павел Яковенко on 23.10.2022.
//

import Foundation

extension Int {
    
    func getTimeFromSeconds() -> String {
        
        if self / 60 == 0 {
            return "\(self % 60) sec"
        }
        
        if self % 60 == 0 {
        return "\(self / 60) min"
        }
        
        return "\(self / 60) min \(self % 60) sec"
    }
}
