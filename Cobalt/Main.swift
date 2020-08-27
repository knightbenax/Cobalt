//
//  Main.swift
//  Cobalt
//
//  Created by Bezaleel Ashefor on 27/08/2020.
//  Copyright © 2020 Bezaleel Ashefor. All rights reserved.
//

import Foundation
import CoreMediaIO

@_cdecl("cobaltMain")
public func cobaltMain(allocator: CFAllocator, requestedTypeUUID: CFUUID) -> CMIOHardwarePlugInRef{
    NSLog("cobaltMain")
    return pluginRef
}
