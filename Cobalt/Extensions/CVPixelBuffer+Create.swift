//
//  dal.swift
//  Cobalt
//
//  Created by Bezaleel Ashefor on 27/08/2020.
//  Copyright © 2020 Bezaleel Ashefor. All rights reserved.
//

import Foundation


/// helper extenstion to create the Pixel Buffer and achieving the locking for drawing to the buffer
extension CVPixelBuffer {
    static func create(size: CGSize) -> CVPixelBuffer? {
        var pixelBuffer: CVPixelBuffer?
        let options = [
            kCVPixelBufferCGImageCompatibilityKey as String: true,
            kCVPixelBufferCGBitmapContextCompatibilityKey as String: true,
        ] as [String: Any]

        let error = CVPixelBufferCreate(
            kCFAllocatorSystemDefault,
            Int(size.width),
            Int(size.height),
            kCVPixelFormatType_32ARGB,
            options as CFDictionary,
            &pixelBuffer)

        guard error == noErr else {
            log("CVPixelBufferCreate error: \(error)")
            return nil
        }
        return pixelBuffer
    }

    var width: Int {
        return CVPixelBufferGetWidth(self)
    }
    var height: Int {
        return CVPixelBufferGetHeight(self)
    }

    func modifyWithContext(callback: (CGContext) -> Void) {
        CVPixelBufferLockBaseAddress(self, CVPixelBufferLockFlags(rawValue: 0))
        let data = CVPixelBufferGetBaseAddress(self)

        let colorSpace = CGColorSpaceCreateDeviceRGB();
        let bytesPerRow = CVPixelBufferGetBytesPerRow(self)

        let context = CGContext(
            data: data,
            width: width, height: height, bitsPerComponent: 8,
            bytesPerRow: bytesPerRow,
            space: colorSpace,
            bitmapInfo: CGImageAlphaInfo.premultipliedFirst.rawValue | CGBitmapInfo.byteOrder32Big.rawValue)

        if let context = context {
            callback(context)
        }

        CVPixelBufferUnlockBaseAddress(self, CVPixelBufferLockFlags(rawValue: 0))
    }
}
