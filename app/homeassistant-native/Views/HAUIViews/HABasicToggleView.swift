//
//  HABasicToggleView.swift
//  homeassistant-native
//
//  Created by santoru on 25/12/21.
//

import SwiftUI


class ToggleObserver: ObservableObject {
    
    private var entityId: String = ""
    private var initialized: Bool = false
    
    @Published var toggleValue: Bool = false {
        didSet {            
            if entityId != "" {
                _ = ChangeStatusController(entityId: self.entityId)
            }
            
        }
    }
    func setToggleStatus(state: String){
        if initialized{
            return
        }
        self.toggleValue = state == "on" ? true : false
        self.initialized = true
    }
    
    func setEntityId(entityId: String){
        if self.entityId != "" {
            return
        }
        self.entityId = entityId
    }
}

struct HABasicToggleView: View {
    @ObservedObject(initialValue: ToggleObserver()) var viewModel: ToggleObserver
    
    var state: String
    var entityId: String
    
    private let haptic = UINotificationFeedbackGenerator()
    
    
    init(_ state: String, _ entityId: String) {
        self.state = state
        self.entityId = entityId
        
        viewModel.setToggleStatus(state: self.state)
        viewModel.setEntityId(entityId: self.entityId)
        
        
    }
    
    var body: some View {
        Toggle(isOn: $viewModel.toggleValue, label: {
            Text("")
        })
            .labelsHidden()
            .frame(maxWidth: .infinity, alignment: .trailing)
            .toggleStyle(PowerToggleStyle())
            .padding(.trailing)
            .onTapGesture {
                self.haptic.notificationOccurred(.error)
                
            }
    }
}

struct HABasicToggleView_Previews: PreviewProvider {
    static var previews: some View {
        HABasicToggleView("on", "dummy_id")
    }
}

struct PowerToggleStyle: ToggleStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        
        return HStack {
            configuration.label
            Spacer()
            Image(systemName: configuration.isOn ? "power.circle.fill" : "circle")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(configuration.isOn ? ColorManager.haDefaultDark : ColorManager.haDefaultLighter)
                .font(.system(size: 20, weight: .bold, design: .default))
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
        
    }
}
