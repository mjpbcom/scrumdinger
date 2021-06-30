//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Mariah Jessica Baysic on 6/30/21.
//

import SwiftUI

enum Priority {
    case HIGH
    case MEDIUM
    case LOW
}

struct DailyScrum : Identifiable {
    let id: UUID
    var title: String
    var attendees: [String]
    var lengthInMinutes: Int
    var priority: Priority
    
    var color: Color {
        switch priority {
        case .HIGH:
            return .red
        case .MEDIUM:
            return .yellow
        default:
            return .green
        }
    }
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, priority: Priority) {
        self.id = id
        self.title = title
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
        self.priority = priority
    }
}

extension DailyScrum {
    static var testData: [DailyScrum] {
        [
            DailyScrum(title: "Design", attendees: ["Client", "BA", "SA", "Designer", "Android Developer", "iOS Developer"], lengthInMinutes: 15, priority: .LOW),
            DailyScrum(title: "Development", attendees: ["Android Developer", "iOS Developer"], lengthInMinutes: 5, priority: .MEDIUM),
            DailyScrum(title: "SIT", attendees: ["SA", "Designer", "Android Developer", "iOS Developer"], lengthInMinutes: 3, priority: .LOW),
            DailyScrum(title: "UAT", attendees: ["QA", "SA"], lengthInMinutes: 10, priority: .MEDIUM),
            DailyScrum(title: "Deployment", attendees: ["SA", "Android Developer", "iOS Developer", "Admin", "QA"], lengthInMinutes: 1, priority: .HIGH)
        ]
    }
}
