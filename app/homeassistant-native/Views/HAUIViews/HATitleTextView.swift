//
//  HATitleTextView.swift
//  homeassistant-native
//
//  Created by santoru on 25/12/21.
//

import SwiftUI

struct HATitleTextView: View {
    var text: String
    var icon: String
    
    var body: some View {
        HStack{
            Image(systemName: icon)
                .font(Font.title.weight(.bold))
            Text(text)                .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .font(.largeTitle)
        .foregroundColor(ColorManager.haDefaultDark)
        
    }
}

struct HATitleTextView_Previews: PreviewProvider {
    static var previews: some View {
        HATitleTextView(text:"Test", icon:"house.fill")
    }
}
