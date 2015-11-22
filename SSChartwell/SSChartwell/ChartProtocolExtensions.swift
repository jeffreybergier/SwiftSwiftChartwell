//
//  ChartProtocolExtensions.swift
//  SSChartwell
//
//  Created by Jeffrey Bergier on 11/22/15.
//  Copyright © 2015 Jeffrey Bergier. All rights reserved.
//

#if os(iOS)
    import UIKit
#elseif os(OSX)
    import Cocoa
#endif

extension ChartValueDataType {
    init(components: [ChartDataComponentType]) {
        self.init()
        if let max = self.dynamicType.max {
            var inputMaxIndex = 0
            var inputValueCounter = UInt(0)
            for (index, component) in components.enumerate() {
                inputValueCounter += component.value
                if inputValueCounter <= max {
                    inputMaxIndex = index
                } else {
                    NSLog("Components total value exceeds MAX: \(max). Ignoring \(components.count - inputMaxIndex) components.")
                    break
                }
            }
            for i in 0...inputMaxIndex {
                self.components.append(components[i])
            }
        } else {
            self.components = components
        }
    }
    
    mutating func appendComponent(newComponent: ChartDataComponentType) -> Bool {
        if let max = self.dynamicType.max {
            var existingComponentsValue = UInt(0)
            for component in self.components {
                existingComponentsValue += component.value
            }
            if existingComponentsValue + newComponent.value <= max {
                self.components.append(newComponent)
                return true
            } else {
                NSLog("Could not append component. Existing Value: \(existingComponentsValue) plus New Value: \(newComponent.value) exceeds MAX: \(max)")
                return false
            }
        } else {
            self.components.append(newComponent)
            return true
        }
    }
}

extension ChartDataType {
    init(components: [ChartDataComponentType]) {
        self.init()
        if let max = self.dynamicType.max {
            let maxInt = Int(max)
            if components.count <= maxInt {
                self.components = components
            } else {
                NSLog("Components Count: \(components.count) exceeds MAX. Using only first \(max) components.")
                (0..<maxInt).forEach() { self.components.append(components[$0]) }
            }
        } else {
            self.components = components
        }
    }
    mutating func appendComponent(newComponent: ChartDataComponentType) -> Bool {
        if let max = self.dynamicType.max {
            let maxInt = Int(max)
            if self.components.count < maxInt {
                self.components.append(newComponent)
                return true
            } else {
                NSLog("Failed to append component. Already at MAX: \(max)")
                return false
            }
        } else {
            self.components.append(newComponent)
            return true
        }
    }
}

extension ChartDataComponentType {
    init(value: UInt, color: CGColor) {
        self.init()
        self.color = color
        
        if let max = self.dynamicType.max {
            if value <= max {
                self.value = value
            } else {
                NSLog("Value: \(value) exceeds MAX. Setting to MAX value: \(max)")
                self.value = max
            }
        } else {
            self.value = value
        }
    }
}

extension ChartRendererType {
    init(data: ChartDataType, fontSize: CGFloat) {
        self.init()
        self.data = data
        self.fontSize = fontSize
    }
}

#if os(iOS)
    extension ChartRendererType {
        var image: UIImage {
            let font = CTFont.chartwellFont(self.data, pointSize: self.fontSize)
            let attributedString = NSAttributedString(chartData: self.data, font: font)
            let renderingView = UILabel()
            renderingView.lineBreakMode = NSLineBreakMode.ByClipping
            renderingView.attributedText = attributedString
            renderingView.sizeToFit()
            UIGraphicsBeginImageContextWithOptions(renderingView.bounds.size, renderingView.opaque, 0.0)
            renderingView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return image
        }
    }
#elseif os(OSX)
    extension ChartRendererType {
        var TIFFImage: NSImage {
            let PDFImage = self.PDFImage
            let TIFF = PDFImage.TIFFRepresentation!
            let TIFFImage = NSImage(data: TIFF)!
            return TIFFImage
        }
        var PDFImage: NSImage {
            let font = CTFont.chartwellFont(self.data, pointSize: self.fontSize)
            let attributedString = NSAttributedString(chartData: self.data, font: font)
            let renderingView = NSTextField()
            renderingView.lineBreakMode = NSLineBreakMode.ByClipping
            renderingView.attributedStringValue = attributedString
            renderingView.editable = false
            renderingView.sizeToFit()
            let PDF = renderingView.dataWithPDFInsideRect(renderingView.bounds)
            let PDFImage = NSImage(data: PDF)!
            return PDFImage
        }
    }
#endif
