//
//  Event.swift
//  CalendarTutorial
//
//  Created by Jessika Gerhardsson on 2022-07-27.
//

import Foundation
import UIKit

var eventList = [Event]()

class Event {

    var id: Int!
    var name: String!
    var date: Date!
    
    func eventsForDate(date: Date) -> [Event] {
        var daysEvent = [Event]()
        for event in eventList {
            if (event.date == date) {
                daysEvent.append(event)
            }
        }
        return daysEvent
    }
    
}
