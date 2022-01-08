//
//  HomeAssistantStateObjectModel.swift
//  homeassistant-native
//
//  Created by santoru on 08/01/22.
//

import Foundation

struct HomeAssistantStateObjectModel: Decodable {
    let state: String

    init(state: String) {
        self.state = state
    }
}
