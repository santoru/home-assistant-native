//
//  HomeAssistantEntityModel.swift
//  homeassistant-native
//
//  Created by santoru on 07/01/22.
//

import Foundation
import UIKit

struct HomeAssistantEntityModel {
    
    // Attributes from the decoded entity model
    let entity_id: String
    let state: String
    let attributes: HomeAssistantAttributeModel
    let last_changed: String
    let last_updated: String
    //let context: HomeAssistantContextModel
    
    // Attributes from the sample
    var name: String { return "BLA"}
    var room: String { return "AAA"}
    let icon: String
    
    // Attributes from the enriched object
    let type: String
    let full_name: String
    
    var iconMapping = [
        "mdi:led-strip-variant":"light.max",
        "mdi:ceiling-light":"lightbulb",
        "mdi:lightbulb-group":"lightbulb",
        "default": "lightbulb"
    ]
    
    
    init(
        entity_id: String, state:String, last_changed: String, last_updated: String, attributes: HomeAssistantAttributeModel,
        type: String, full_name: String) {
            
            self.entity_id = entity_id
            self.state = state
            self.attributes = attributes
            self.last_changed = last_changed
            self.last_updated = last_updated
            // self.context = context
            
            if let icon = iconMapping[attributes.icon ?? "default"] {
                self.icon = icon
            } else {
                self.icon = iconMapping["default"] ?? "gear"
            }
            
            
            self.type = type
            self.full_name = full_name
            
        }
    
    init(name: String, room:String, icon:String) {
        self.entity_id = UUID().description
        self.icon = icon
        
        self.state = ""
        self.attributes = HomeAssistantAttributeModel(friendly_name: name, icon: icon)
        self.last_changed = ""
        self.last_updated = ""
        
        self.type = room
        self.full_name = name
    }
    
}


extension HomeAssistantEntityModel: Identifiable {
    var id: String { return entity_id }
}



struct HomeAssistantDecodableEntityModel: Decodable {
    
    let entity_id: String
    let state: String
    let attributes: HomeAssistantAttributeModel
    let last_changed: String
    let last_updated: String
    
    var name: String { return "BLA"}
    var room: String { return "AAA"}
    var icon: String { return "gear"}
    
    enum CodingKeys: String, CodingKey {
        case entity_id
        case state
        case last_changed
        case last_updated
        case attributes
    }
    
    init(entity_id: String, state:String, last_changed: String, last_updated: String, attributes: HomeAssistantAttributeModel) {
        self.entity_id = entity_id
        self.state = state
        self.attributes = attributes
        self.last_changed = last_changed
        self.last_updated = last_updated
    }
    
    func enrich(type:String, full_name:String) -> HomeAssistantEntityModel {
        return HomeAssistantEntityModel(
            entity_id: self.entity_id,
            state: self.state,
            last_changed: self.last_changed,
            last_updated: self.last_updated,
            attributes: self.attributes,
            type: type,
            full_name: full_name)
    }
    
}

