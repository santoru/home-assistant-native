//
//  RoundedCornerShape.swift
//  homeassistant-native
//
//  Created by santoru on 25/12/21.
//

import SwiftUI
import Foundation

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
