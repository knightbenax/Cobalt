//
//  Log.swift
//  Cobalt
//
//  Created by Bezaleel Ashefor on 27/08/2020.
//  Copyright © 2020 Bezaleel Ashefor. All rights reserved.
//

import Foundation

func log(_ message: Any = "", function: String = #function) {
    NSLog("Cobalt: \(function): \(message)")
}
