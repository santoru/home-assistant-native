//
//  HAColorTileView.swift
//  homeassistant-native
//
//  Created by santoru on 26/12/21.
//

import SwiftUI

struct HAColorTileView: View {
    var color: Color
    var edge = 40.0
    var radius = 12.0
    var body: some View {
        Button(action: {
            print("TODO")
        }) {
        
        Rectangle()
            .frame(width: edge, height: edge)
            .cornerRadius(radius)
            .foregroundColor(color)
        }
    }
}

struct HAColorTileView_Previews: PreviewProvider {
    static var previews: some View {
        HAColorTileView(color: ColorManager.haDefaultDark)
    }
}
