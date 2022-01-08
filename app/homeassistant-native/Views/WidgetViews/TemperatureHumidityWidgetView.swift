//
//  TemperatureHumidityWidgetView.swift
//  homeassistant-native
//
//  Created by santoru on 25/12/21.
//

import SwiftUI

struct TemperatureHumidityWidgetView: View {
    var body: some View {
        ZStack(){
            HStack(alignment: .top, spacing: 0) {
                HStack{
                    HAWidgetImageView(imageName: "thermometer")
                    VStack(){
                        HAMainTextView(text:"23.5 °C")
                        HAFootNoteView(text:"Temperature")
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                HStack{
                    HAWidgetImageView(imageName: "humidity.fill")
                    VStack(){
                        HAMainTextView(text:"40%")
                        HAFootNoteView(text:"Humidity")
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            .background(.white)
            .cornerRadius(30, corners: [.bottomLeft, .bottomRight])
            
        }
        .background(Color(.systemGroupedBackground))
        
    }
}



struct TemperatureHumidityWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureHumidityWidgetView()
    }
}
