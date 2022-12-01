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
            return "\(self % 60) с"
        }
        
        if self % 60 == 0 {
        return "\(self / 60) мин"
        }
        
        return "\(self / 60) мин \(self % 60) с"
    }
    
    func convertSeconds() -> (Int, Int) {
        let min = self / 60
        let sec = self % 60
        return (min, sec)
    }
    
    func setZeroForSecond() -> String {
        Double(self) / 10.0 < 1 ? "0\(self)" : "\(self)"
    }
}
