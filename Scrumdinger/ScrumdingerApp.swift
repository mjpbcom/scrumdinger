//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Mariah Jessica Baysic on 6/29/21.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView.init(scrums: DailyScrum.testData)
        }
    }
}
