//
//  WidgetDataSource.swift
//  homeassistant-native
//
//  Created by santoru on 07/01/22.
//

import Foundation
import Combine

class WidgetDataSource: ObservableObject {
    @Published var items = [HomeAssistantEntityModel]()
    
    init() {
        loadEntities()
    }
    
    
    private func loadEntities() {
        print("Loading HomeAssistant entities")
        let decoder = JSONDecoder()
        //decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        //let dateFormatter = DateFormatter()
        //dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        //dateFormatter.locale = Locale(identifier: "it_IT")
        //dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        //decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        let url = URL(string: Config.statesEndpoint)!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(Config.authorizationHeader, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTaskPublisher(for: request)
            .tryMap() { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                          print("HTTP Error, status code: \(String(describing: (element.response as? HTTPURLResponse)?.statusCode))")
                          throw URLError(.badServerResponse)
                      }
                return element.data
            }
            .decode(type: [HomeAssistantDecodableEntityModel].self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .handleEvents(receiveOutput: { response in
            })
            .map({ response in
                var results = [HomeAssistantEntityModel]()
                for entity in response {
                    let type = entity.entity_id.components(separatedBy: ".")[0]
                    if type != "light" {
                        continue
                    }
                    let full_name = entity.entity_id.components(separatedBy: ".")[1]
                    if Config.DEBUG {
                        print("Entity \(type) with name \(full_name)")
                        print("Friendly name \(String(describing: entity.attributes.friendly_name))")
                        print("Status: \(entity.state)")
                    }
                    let richEntity = entity.enrich(
                        type:type,
                        full_name: full_name
                    )
                    results.append(richEntity)
                }
                return self.items + results
            })
            .catch({ error -> AnyPublisher<[HomeAssistantEntityModel], Never> in
                if error is URLError {
                    print("URLError: \(error)")
                    return Just([])
                        .eraseToAnyPublisher()
                } else {
                    print("Generic error: \(error)")
                    return Empty(completeImmediately: true)
                        .eraseToAnyPublisher()
                }
            })
                    .assign(to: &$items)
    }
}
