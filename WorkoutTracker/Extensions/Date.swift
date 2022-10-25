//
//  Date.swift
//  WorkoutTracker
//
//  Created by Павел Яковенко on 25.10.2022.
//

import Foundation

extension Date {
    
    func getWeekdayNumber() -> Int {
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: self)
        return weekday
    }
}
