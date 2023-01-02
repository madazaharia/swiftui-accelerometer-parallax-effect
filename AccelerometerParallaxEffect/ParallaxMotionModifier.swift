//
//  ParallaxMotionModifier.swift
//  AccelerometerParallaxEffect
//
//  Created by Madalin Zaharia on 02.01.2023.
//

import SwiftUI

struct ParallaxMotionModifier: ViewModifier {
    
    @StateObject var manager: MotionManager = MotionManager()
    var magnitude: Double
    
    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(0.2),
                    radius: 32,
                    x: -CGFloat(manager.roll * magnitude),
                    y: -CGFloat(manager.pitch * magnitude)
            )
            .offset(x: CGFloat(manager.roll * magnitude),
                    y: CGFloat(manager.pitch * magnitude)
            )
    }
}

extension View {
    func parallaxMotion(magnitude: Double) -> some View {
        return self.modifier(ParallaxMotionModifier(magnitude: magnitude))
    }
}
