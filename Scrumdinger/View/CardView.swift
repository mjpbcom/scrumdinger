//
//  CardView.swift
//  Scrumdinger
//
//  Created by Mariah Jessica Baysic on 6/30/21.
//

import SwiftUI

struct CardView: View {
    let scrum: DailyScrum
    var body: some View {
        VStack {
            Text(scrum.title)
                .font(.headline)
            Spacer()
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel(Text("Attendees"))
                    .accessibilityValue(Text("\(scrum.attendees.count)"))
                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .padding(.trailing, 20)
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel(Text("Meeting length"))
                    .accessibilityValue(Text("\(scrum.lengthInMinutes)"))
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(scrum.color.accessibleFontColor)
    }
}

struct CardView_Previews: PreviewProvider {
    static var scrum = DailyScrum.testData[0]
    static var previews: some View {
        CardView(scrum: scrum)
            .background(scrum.color)
            .previewLayout(.fixed(width: 400, height: 100))
    }
}
