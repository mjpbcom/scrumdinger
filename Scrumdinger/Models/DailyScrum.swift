//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Mariah Jessica Baysic on 6/30/21.
//

import SwiftUI

struct DailyScrum : Identifiable, Codable {
    let id: UUID
    var title: String
    var attendees: [String]
    var lengthInMinutes: Int
    var color: Color
    var history: [History]
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, color: Color, history: [History] = []) {
        self.id = id
        self.title = title
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
        self.color = color
        self.history = history
    }
}

// MARK: - Test Data
extension DailyScrum {
    static var testData: [DailyScrum] {
        [
            DailyScrum(title: "Design", attendees: ["Client", "BA", "SA", "Designer", "Android Developer", "iOS Developer"], lengthInMinutes: 15, color: .random),
            DailyScrum(title: "Development", attendees: ["Android Developer", "iOS Developer"], lengthInMinutes: 5, color: .random),
            DailyScrum(title: "SIT", attendees: ["SA", "Designer", "Android Developer", "iOS Developer"], lengthInMinutes: 3, color: .random),
            DailyScrum(title: "UAT", attendees: ["QA", "SA"], lengthInMinutes: 10, color: .random),
            DailyScrum(title: "Deployment", attendees: ["SA", "Android Developer", "iOS Developer", "Admin", "QA"], lengthInMinutes: 1, color: .random)
        ]
    }
}

// MARK: - Functions
extension DailyScrum {
    struct Data {
        var title: String = ""
        var attendees: [String] = []
        var lengthInMinutes: Double = 5
        var color: Color = .random
    }
    
    // getter
    var data: Data {
        return Data(title: title, attendees: attendees, lengthInMinutes: Double(lengthInMinutes), color: color)
    }
    
    // setter
    mutating func update(from data: Data) {
        title = data.title
        attendees = data.attendees
        lengthInMinutes = Int(data.lengthInMinutes)
        color = data.color
    }
}
