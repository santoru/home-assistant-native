//
//  MediaPlayerView.swift
//  homeassistant-native
//
//  Created by santoru on 27/12/21.
//

import SwiftUI

struct MediaPlayerView: View {
    @State private var volume = 50.0
    @State private var isEditing = false
    private let darkColorScheme: Bool = false
    var body: some View {
        let color: Color = darkColorScheme ? ColorManager.haDefaultDark : ColorManager.haDefaultLighter

            VStack{
                HStack{
                    Image("haDefaultAdele")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(15)
                    VStack {
                        HAMainTextView(text: "Easy On Me", darkColorScheme: darkColorScheme)
                        HAFootNoteView(text: "Adele")
                    }
                    HABasicIconView(icon: "backward.end", darkColorScheme: darkColorScheme)
                    HABasicIconView(icon: "play", darkColorScheme: darkColorScheme)
                    HABasicIconView(icon: "forward.end", darkColorScheme: darkColorScheme)
                }
                HStack{
                    HABasicIconView(icon: "speaker", darkColorScheme: darkColorScheme)
                    Slider(
                        value: $volume,
                        in: 0...100,
                        step: 1,
                        onEditingChanged: { editing in
                            isEditing = editing
                        }
                    ).accentColor(color)
                    HABasicIconView(icon: "speaker.wave.3", darkColorScheme: false)
                }
            }.listRowBackground(
                Image("haDefaultAdele")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .brightness(-0.2)
                    .blur(radius: 1)
                )
    }
}

struct MediaPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        MediaPlayerView()
    }
}
