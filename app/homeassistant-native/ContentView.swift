//
//  ContentView.swift
//  homeassistant-native
//
//  Created by santoru on 24/12/21.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    @StateObject var widgetDataSource = WidgetDataSource()
    
    @State var renderWidget = HomeAssistantEntityModel(name: "A", room: "B", icon: "gear")
    
    var body: some View {
        
        NavigationView {
            VStack(spacing:0) {
                HeaderView()
                List {
                    Section{
                        MediaPlayerView()
                    }
                    Section(){
                        ForEach(widgetDataSource.items) { widget in
                            Button(action: {
                                renderWidget = widget
                                show.toggle() }) {
                                    SwitchWidgetListView(
                                        widget:widget)
                                }
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
            }.bottomSheet(
                isPresented: $show,
                height: 300
            ) {
                LightWidgetDetailsView(widget:renderWidget)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
