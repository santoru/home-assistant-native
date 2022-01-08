//
//  HAListBottomSheetView.swift
//  homeassistant-native
//
//  Created by santoru on 26/12/21.
//

import SwiftUI

struct HAListBottomSheetView: View {
    @State private var show: Bool = false
    var widget: BasicWidgetModel
    var body: some View {
        Button(action: { show.toggle() }) {
            SwitchWidgetView(
                widget:BasicWidgetModel(
                    name: widget.name, room: widget.room, icon: widget.icon))                    }
        .bottomSheet(
            isPresented: $show,
            height: 300
            //detents: .mediumAndLarge,
            //shouldScrollExpandSheet: true,
            //largestUndimmedDetent: .medium,
            //showGrabber: true,
            //cornerRadius: 20
        ) {
            LightWidgetDetailsView(widget:widget)
        }    }
}

struct HAListBottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        HAListBottomSheetView(widget:BasicWidgetModel(name: "A", room: "B", icon: "C"))
    }
}
