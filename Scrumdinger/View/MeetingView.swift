//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Mariah Jessica Baysic on 6/29/21.
//

import SwiftUI
import AVFoundation

struct MeetingView: View {
    @Binding var scrum: DailyScrum
    @StateObject var scrumTimer = ScrumTimer()
    @State private var transcript = ""
    @State private var isRecording = false
    private let speechRecognizer = SpeechRecognizer()
    var player : AVPlayer { AVPlayer.sharedDingPlayer }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(scrum.color)
            VStack {
                // progress info
                MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed, secondsRemaining: scrumTimer.secondsRemaining, scrumColor: scrum.color)
                
                // circle timer
                MeetingTimerView(speakers: scrumTimer.speakers, isRecording: isRecording, scrumColor: scrum.color)
                
                // progress control
                MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
            }
        }
        .padding()
        .foregroundColor(scrum.color.accessibleFontColor)
        .onAppear {
            scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
            scrumTimer.speakerChangedAction = {
                player.seek(to: .zero)
                player.play()
            }
            speechRecognizer.record(to: $transcript)
            isRecording = true
            scrumTimer.startScrum()
        }
        .onDisappear {
            scrumTimer.stopScrum()
            speechRecognizer.stopRecording()
            isRecording = false
            let newHistory = History(attendees: scrum.attendees, lengthInMinutes: scrumTimer.secondsElapsed / 60, transcript: transcript)
            scrum.history.insert(newHistory, at: 0)
        }
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView(scrum: .constant(DailyScrum.testData[0]))
    }
}
