//
//  Main.swift
//  Cobalt
//
//  Created by Bezaleel Ashefor on 27/08/2020.
//  Copyright © 2020 Bezaleel Ashefor. All rights reserved.
//

import Foundation
import CoreMediaIO


/// this is the main entry point of the plugin

@_cdecl("CobaltMain")
public func CobaltMain(allocator: CFAllocator, requestedTypeUUID: CFUUID) -> CMIOHardwarePlugInRef{
    return pluginRef
}
