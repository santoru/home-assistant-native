//
//  HAMainTextView.swift
//  homeassistant-native
//
//  Created by santoru on 25/12/21.
//

import SwiftUI

struct HAMainTextView: View {
    var text: String
    var darkColorScheme: Bool = true
    var body: some View {
        let color: Color = darkColorScheme ? ColorManager.haDefaultDark : ColorManager.haDefaultLighter

        Text(text)
            .fontWeight(.medium)
            .foregroundColor(color)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct HAMainTextView_Previews: PreviewProvider {
    static var previews: some View {
        HAMainTextView(text:"Test")
    }
}
