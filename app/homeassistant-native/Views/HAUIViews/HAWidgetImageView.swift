//
//  HAWidgetImageView.swift
//  homeassistant-native
//
//  Created by santoru on 25/12/21.
//

import SwiftUI

struct HAWidgetImageView: View {
    var imageName: String
    var body: some View {
        Image(systemName: imageName)
            .frame(width: 32, height: 32)
            .font(.system(size: 24.0).bold())
            .foregroundColor(ColorManager.haDefaultDark)
            .cornerRadius(5)
    }
}

struct HAWidgetImageView_Previews: PreviewProvider {
    static var previews: some View {
        HAWidgetImageView(imageName: "lightbulb")
    }
}
