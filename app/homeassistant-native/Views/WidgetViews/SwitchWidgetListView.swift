//
//  SwitchWidgetView.swift
//  homeassistant-native
//
//  Created by santoru on 24/12/21.
//

import SwiftUI


struct SwitchWidgetListView: View {
    let widget: HomeAssistantEntityModel
    
    var body: some View {
        HStack {
            HAWidgetImageView(imageName: widget.icon)
            VStack(alignment: .leading) {
                HAMainTextView(text: widget.attributes.friendly_name ?? "nil")
                HAFootNoteView(text: widget.type.capitalized)
            }
            HABasicToggleView(widget.state, widget.entity_id)

        }
    }
}

struct SwitchWidgetListView_Previews: PreviewProvider {
    static var previews: some View {
        SwitchWidgetListView(
            widget:HomeAssistantEntityModel(name: "Test", room: "test", icon: "lightbulb")
        )
    }
}
