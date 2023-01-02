//
//  MotionManager.swift
//  AccelerometerParallaxEffect
//
//  Created by Madalin Zaharia on 02.01.2023.
//

import CoreMotion

class MotionManager: ObservableObject {
    
    @Published var pitch: Double = 0.0
    @Published var roll: Double = 0.0
    
    private var manager: CMMotionManager
    
    init() {  /// receive motion updates from the device within our class
        self.manager = CMMotionManager()
        self.manager.deviceMotionUpdateInterval = 1/60  /// update interval to 60 times per second
        
        self.manager.startDeviceMotionUpdates(to: .main) { (motionData, error) in
            if let error = error {
                debugPrint(error)
                return
            }
            
            if let motionData = motionData {
                self.pitch = motionData.attitude.pitch
                self.roll = motionData.attitude.roll
            }
        }
    }
}
