//
//  Plugin.swift
//  Cobalt
//
//  Created by Bezaleel Ashefor on 27/08/2020.
//  Copyright © 2020 Bezaleel Ashefor. All rights reserved.
//

import Foundation

class Plugin: Object {
    var objectID: CMIOObjectID = 0
    let name = "Cobalt"

    lazy var properties: [Int : Property] = [
        kCMIOObjectPropertyName: Property(name),
    ]
}
