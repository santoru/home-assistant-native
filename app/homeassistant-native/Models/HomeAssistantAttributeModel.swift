//
//  HomeAssistantAttributeModel.swift
//  homeassistant-native
//
//  Created by santoru on 07/01/22.
//

import Foundation

struct HomeAssistantAttributeModel: Decodable {
    let friendly_name: String?
    let icon: String?
    
    enum CodingKeys: String, CodingKey {
            case friendly_name
            case icon
        }


    init(friendly_name: String, icon: String){
        self.friendly_name = friendly_name
        self.icon = icon
    }
    
}
