//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Mariah Jessica Baysic on 6/29/21.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.testData
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $scrums)
            }
        }
    }
}
