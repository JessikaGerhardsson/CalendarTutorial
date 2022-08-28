//
//  CalendarHelper.swift
//  CalendarTutorial
//
//  Created by Jessika Gerhardsson on 2022-07-25.
//

import Foundation
import UIKit

class CalendarHelper {
    
    let calendar = Calendar.current
    
    func plusMonth(date: Date) -> Date {
        return calendar.date(byAdding: .month, value: 1, to: date)!
    }
    
    func minusMonth(date: Date) -> Date {
        return calendar.date(byAdding: .month, value: -1, to: date)!
    }
    
    //Input: 15 Jan 2021 -> Result: January
    func monthString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        return dateFormatter.string(from: date)
    }
    
    //Veckodagen för daily calendar
    func monthDayString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL dd"
        return dateFormatter.string(from: date)
    }
    
    //Input: 15 Jan 2021 -> Result: 2021
    func yearString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: date)
    }
    
    func timeString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
    
    //Input: 18 Jan 2021 -> Result: 31
    //Returnar antalet dagar i månaden
    func daysInMonth(date: Date) -> Int {
        let range = calendar.range(of: .day, in: .month, for: date)!
        return range.count
    }
    
    //Returnar datumet
    //Input: 2 Jan 2020 -> Result: 2
    func dayOfMonth(date: Date) -> Int {
        let components = calendar.dateComponents([.day], from: date)
        return components.day!
    }
    
    func hourFromDate(date: Date) -> Int {
        let components = calendar.dateComponents([.hour], from: date)
        return components.hour!
    }
    
    //Returnar den första i månaden
    //Input: 15 Jan 2021 -> Result: 1 Jan 2021
    func firstOfMonth(date: Date) -> Date {
        let components = calendar.dateComponents([.year, .month], from: date)
        return calendar.date(from: components)!
    }
    
    //Returnar veckodagen
    //Input: 1 Jan 2021 -> Result: 5(Friday)
    func weekDay(date: Date) -> Int {
        let components = calendar.dateComponents([.weekday], from: date)
        return components.weekday! - 2
    }
    
    //Returnar veckodagen till daily calendar
    func weekDayAsString(date: Date) -> String {
        switch weekDay(date: date) {
        case 0:
            return "Måndag"
        case 1:
            return "Tisdag"
        case 2:
            return "Onsdag"
        case 3:
            return "Torsdag"
        case 4:
            return "Fredag"
        case 5:
            return "Lördag"
        case 6:
            return "Söndag"
        default:
            return ""
        }
    }
    
    func addDays(date: Date, days: Int) -> Date {
        return calendar.date(byAdding: .day, value: days, to: date)!
    }
    
    func sundayForDate(date: Date) -> Date {
        var current = date
        let oneWeekAgo = addDays(date: current, days: -7)
        
        while(current > oneWeekAgo) {
            let currentWeekDay = calendar.dateComponents([.weekday], from: current).weekday
            if currentWeekDay == 1 {
                return current
            }
            current = addDays(date: current, days: -2)
        }
        return current
        
        
        
    }
    
    
}
