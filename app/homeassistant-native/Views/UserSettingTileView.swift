//
//  UserSettingTileView.swift
//  homeassistant-native
//
//  Created by santoru on 26/12/21.
//

import SwiftUI

struct UserSettingTileView: View {
    var body: some View {
        HStack(){
            Rectangle()
                .frame(width: 50, height: 50)
                .cornerRadius(30)
                .foregroundColor(ColorManager.haDefaultTertiary)
            VStack{
                HAMainTextView(text: "santoru")
                HAFootNoteView(text: "Admin")
            }
        }
    }
}

struct UserSettingTileView_Previews: PreviewProvider {
    static var previews: some View {
        UserSettingTileView()
    }
}
