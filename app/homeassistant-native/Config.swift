//
//  Config.swift
//  homeassistant-native
//
//  Created by santoru on 08/01/22.
//

import Foundation

enum Config {
    static let DEBUG: Bool = false
    static let authorizationHeader: String = ""
    
    static let baseEndpoint: String = "http://homeassistant.local:8123/api/"
    static let statesEndpoint: String = baseEndpoint + "states"
    static let lightToggleEndpoint: String = baseEndpoint + "services/light/toggle"
}
