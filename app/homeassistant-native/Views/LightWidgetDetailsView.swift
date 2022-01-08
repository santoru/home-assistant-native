//
//  LightWidgetDetailsView.swift
//  homeassistant-native
//
//  Created by santoru on 25/12/21.
//

import SwiftUI

struct LightWidgetDetailsView: View {
    var widget: HomeAssistantEntityModel
    @State private var bgColor = Color.blue.opacity(0.5)
    var body: some View {
        VStack(alignment: .leading, spacing:0) {
            HStack{
                HATitleTextView(text: widget.name, icon: widget.icon)
                HAColorTileView(color: ColorManager.haDefaultLight)
            }
            HAFootNoteView(text: widget.room)
            HaBrightnessSliderView()
            HAMainTextView(text: "Quick color selection")
            ScrollView(.horizontal) {
                HStack(spacing: 15) {
                    HAColorTileView(color: ColorManager.haDefaultLight)
                    HAColorTileView(color: .red)
                    HAColorTileView(color: ColorManager.haDefaultLighter)
                    HAColorTileView(color: .blue)
                    HAColorTileView(color: ColorManager.haDefaultSecondary)
                    HAColorTileView(color: .green)
                    HAColorTileView(color: ColorManager.haDefaultTertiary)
                    HAColorTileView(color: ColorManager.haDefaultDark)
                }.padding(.top)
            }
        }.padding()
    }
    
}

struct LightWidgetDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        LightWidgetDetailsView(widget:HomeAssistantEntityModel(name: "A", room: "B", icon: "gear"))
    }
}

