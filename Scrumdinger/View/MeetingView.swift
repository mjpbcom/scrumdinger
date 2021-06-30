//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Mariah Jessica Baysic on 6/29/21.
//

import SwiftUI

struct MeetingView: View {
    var body: some View {
        VStack {
            // progress info
            ProgressView(value: 5.0, total: 15.0)
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("300", systemImage: "hourglass.bottomhalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("600", systemImage: "hourglass.tophalf.fill")
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(Text("Time remaining"))
            .accessibilityValue("10 minutes")
            
            // circle timer
            Circle()
                .strokeBorder(lineWidth: 25, antialiased: true)
            
            // progress control
            HStack {
                Text("Speaker 1 of 3")
                Spacer()
                Button(action: {}) {
                    Image(systemName: "forward.fill")
                }
                .accessibilityLabel(Text("Next Speaker"))
            }
        }
        .padding()
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView()
    }
}
