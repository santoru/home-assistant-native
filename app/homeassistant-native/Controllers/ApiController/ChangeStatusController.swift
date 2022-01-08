//
//  ChangeStatusController.swift
//  homeassistant-native
//
//  Created by santoru on 08/01/22.
//


import Foundation
import Combine

class ChangeStatusController: ObservableObject {
    
    @Published var responseObj: HomeAssistantStateObjectModel = HomeAssistantStateObjectModel(state: "on")
    
    let entityId: String
    
    init(entityId: String) {
        self.entityId = entityId
        toggle()
    }
    
    
    private func toggle() {
        let url = URL(string: Config.lightToggleEndpoint)!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue(Config.authorizationHeader, forHTTPHeaderField: "Authorization")
        
        let json: [String: Any] = ["entity_id": entityId]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        request.httpBody = jsonData
        
        URLSession.shared.dataTaskPublisher(for: request)
            .tryMap() { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                          print("HTTP Error, status code: \(String(describing: (element.response as? HTTPURLResponse)?.statusCode))")
                          throw URLError(.badServerResponse)
                      }
                return element.data
            }
            .receive(on: DispatchQueue.main)
            .handleEvents(receiveOutput: { response in
            })
            .map({ response in
                return self.responseObj
            })
            .catch({ error -> AnyPublisher<HomeAssistantStateObjectModel, Never> in
                if error is URLError {
                    print("URLError: \(error)")
                    return Just(HomeAssistantStateObjectModel(state: "on"))
                        .eraseToAnyPublisher()
                } else {
                    print("Generic error: \(error)")
                    return Empty(completeImmediately: true)
                        .eraseToAnyPublisher()
                }
            }).assign(to: &$responseObj)
    }
}
