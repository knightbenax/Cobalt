//
//  Device.swift
//  Cobalt
//
//  Created by Bezaleel Ashefor on 27/08/2020.
//  Copyright © 2020 Bezaleel Ashefor. All rights reserved.
//

import Foundation
import IOKit

/// this mocks an actual device
class Device: Object {
    var objectID: CMIOObjectID = 0
    var streamID: CMIOStreamID = 0
    let name = "Cobalt"
    let manufacturer = "Ephod"
    let deviceUID = "Cobalt Device"
    let modelUID = "Cobalt Model II"
    var excludeNonDALAccess: Bool = false
    var deviceMaster: Int32 = -1

    lazy var properties: [Int : Property] = [
        kCMIOObjectPropertyName: Property(name),
        kCMIOObjectPropertyManufacturer: Property(manufacturer),
        kCMIODevicePropertyDeviceUID: Property(deviceUID),
        kCMIODevicePropertyModelUID: Property(modelUID),
        kCMIODevicePropertyTransportType: Property(UInt32(kIOAudioDeviceTransportTypeBuiltIn)),
        kCMIODevicePropertyDeviceIsAlive: Property(UInt32(1)),
        kCMIODevicePropertyDeviceIsRunning: Property(UInt32(1)),
        kCMIODevicePropertyDeviceIsRunningSomewhere: Property(UInt32(1)),
        kCMIODevicePropertyDeviceCanBeDefaultDevice: Property(UInt32(1)),
        kCMIODevicePropertyCanProcessAVCCommand: Property(UInt32(0)),
        kCMIODevicePropertyCanProcessRS422Command: Property(UInt32(0)),
        kCMIODevicePropertyHogMode: Property(Int32(-1)),
        kCMIODevicePropertyStreams: Property { [unowned self] in self.streamID },
        kCMIODevicePropertyExcludeNonDALAccess: Property(
            getter: { [unowned self] () -> UInt32 in self.excludeNonDALAccess ? 1 : 0 },
            setter: { [unowned self] (value: UInt32) -> Void in self.excludeNonDALAccess = value != 0  }
        ),
        kCMIODevicePropertyDeviceMaster: Property(
            getter: { [unowned self] () -> Int32 in self.deviceMaster },
            setter: { [unowned self] (value: Int32) -> Void in self.deviceMaster = value  }
        ),
    ]
}
