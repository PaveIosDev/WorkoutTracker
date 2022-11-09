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
    
    func localDate() -> Date {
        let timeZoneOffSet = Double(TimeZone.current.secondsFromGMT(for: self))
        let localDate = Calendar.current.date(byAdding: .second, value: Int(timeZoneOffSet), to: self) ?? Date()
        return localDate
    }
    
    func getWeekArray() -> [[String]]{
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_GB")
        formatter.dateFormat = "EEEEEE"
        let calendar = Calendar.current
        
        var weekArray: [[String]] = [[], []]
        
        for index in -6...0 {
            let date = calendar.date(byAdding: .day, value: index, to: self) ?? Date()
            
            let day = calendar.component(.day, from: date)
            weekArray[1].append("\(day)")
            let weekDay = formatter.string(from: date)
            weekArray[0].append(weekDay)
        }
        
        return weekArray
    }
    
    func offsetDay(day: Int) -> Date {
        let offsetDate = Calendar.current.date(byAdding: .day, value: -day, to: self) ?? Date()
        return offsetDate
    }
    
    func offsetMonth(month: Int) -> Date {
        let offsetDate = Calendar.current.date(byAdding: .month, value: -month, to: self) ?? Date()
        return offsetDate
    }
    
    func startEndDate() -> (Date, Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        
        let calendar = Calendar.current
        let day = calendar.component(.day, from: self)
        let month = calendar.component(.month, from: self)
        let year = calendar.component(.year, from: self)
        let dateStart = formatter.date(from: "\(year)/\(month)/\(day)") ?? Date()
        
        let local = dateStart.localDate()
        let dateEnd: Date = {
            let components = DateComponents(day: 1)
            return calendar.date(byAdding: components, to: local) ?? Date()
        }()
        return (local, dateEnd)
    }
}
