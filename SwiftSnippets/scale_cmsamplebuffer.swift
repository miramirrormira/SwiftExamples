    private func scale(_ sampleBuffer: CMSampleBuffer) -> CVImageBuffer? {
        guard let imgBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
            return nil
        }

        CVPixelBufferLockBaseAddress(imgBuffer, CVPixelBufferLockFlags(rawValue: 0))

        // create vImage_Buffer out of CVImageBuffer
        var inBuff: vImage_Buffer = vImage_Buffer()
        inBuff.width = UInt(CVPixelBufferGetWidth(imgBuffer))
        inBuff.height = UInt(CVPixelBufferGetHeight(imgBuffer))
        inBuff.rowBytes = CVPixelBufferGetBytesPerRow(imgBuffer)
        inBuff.data = CVPixelBufferGetBaseAddress(imgBuffer)
        
        var scaleBuffer: vImage_Buffer = vImage_Buffer()
        scaleBuffer.data = UnsafeMutableRawPointer.allocate(byteCount: Int(MEDIAPIPE.mediapipeInputWidth * MEDIAPIPE.mediapipeInputHeight * 4), alignment: MemoryLayout<UInt>.size)
        scaleBuffer.width = vImagePixelCount(MEDIAPIPE.mediapipeInputWidth)
        scaleBuffer.height = vImagePixelCount(MEDIAPIPE.mediapipeInputHeight)
        scaleBuffer.rowBytes = Int(MEDIAPIPE.mediapipeInputWidth * 4)

        // perform scale
        let err = vImageScale_ARGB8888(&inBuff, &scaleBuffer, nil, 0)
        if err != kvImageNoError {
            print("Can't scale a buffer")
            return nil
        }
        CVPixelBufferUnlockBaseAddress(imgBuffer, CVPixelBufferLockFlags(rawValue: 0))

        var newBuffer: CVPixelBuffer?
        let attributes : [NSObject:AnyObject] = [
            kCVPixelBufferCGImageCompatibilityKey : true as AnyObject,
            kCVPixelBufferCGBitmapContextCompatibilityKey : true as AnyObject
        ]

        let status = CVPixelBufferCreateWithBytes(kCFAllocatorDefault,
                                                  Int(scaleBuffer.width),
                                                  Int(scaleBuffer.height),
                                                  kCVPixelFormatType_32BGRA,
                                                  scaleBuffer.data,
                                                  Int(scaleBuffer.width) * 4,
                                                  nil, nil,
                                                  attributes as CFDictionary?, &newBuffer)

        guard status == kCVReturnSuccess, let b = newBuffer else {
            print("Can't create new CVPixelBuffer")
            return nil
        }
        
        return b
    }
