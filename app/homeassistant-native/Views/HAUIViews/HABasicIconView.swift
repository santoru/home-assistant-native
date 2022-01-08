//
//  HABasicIconView.swift
//  homeassistant-native
//
//  Created by santoru on 27/12/21.
//

import SwiftUI

struct HABasicIconView: View {
    var icon: String
    var darkColorScheme: Bool = true
    var body: some View {
        let color: Color = darkColorScheme ? ColorManager.haDefaultDark : ColorManager.haDefaultLighter
        Image(systemName: icon)
            .foregroundColor(color)
    }
}

struct HABasicIconView_Previews: PreviewProvider {
    static var previews: some View {
        HABasicIconView(icon:"gear")
    }
}
