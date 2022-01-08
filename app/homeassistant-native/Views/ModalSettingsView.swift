//
//  ModalSettingsView.swift
//  homeassistant-native
//
//  Created by santoru on 25/12/21.
//

import SwiftUI

struct ModalSettingsView: View {
    
    @Environment(\.presentationMode)
    var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0){
                HATitleTextView(text: "Settings", icon: "gear")
                    .padding()
                List {
                    Section(){
                        UserSettingTileView()
                    }
                    Section() {
                        HASettingItemView(text: "General", icon: "gear", foregroundColor: .white, backgroundColor: .gray)
                        HASettingItemView(text: "Appearance", icon: "textformat.size", foregroundColor: .white, backgroundColor: .blue)
                        HASettingItemView(text: "Networking", icon: "globe", foregroundColor: .white, backgroundColor: .green)
                        HASettingItemView(text: "Rate me", icon: "heart.fill", foregroundColor: .white, backgroundColor: .red)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                trailing:
                    Button("Dismiss", action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                          ).accentColor(ColorManager.haDefaultDark))
        }
        .background(Color(.systemGroupedBackground))

    }
}


struct ModalSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ModalSettingsView()
    }
}
