//
//  ChartProtocolExtensions.swift
//  SSChartwell
//
//  Created by Jeffrey Bergier on 11/22/15.
//  Copyright © 2015 Jeffrey Bergier. All rights reserved.
//

import CoreGraphics
import Foundation

public extension ChartValueDataType {
    public init(components: [ChartDataComponentType]) {
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
    
    public mutating func appendComponent(newComponent: ChartDataComponentType) -> Bool {
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

public extension ChartDataType {
    public init(components: [ChartDataComponentType]) {
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
    
    public mutating func appendComponent(newComponent: ChartDataComponentType) -> Bool {
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

public extension ChartDataComponentType {
    public init(value: UInt, color: CGColor) {
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

public extension ChartRendererType {
    public init(data: ChartDataType, fontSize: CGFloat) {
        self.init()
        self.data = data
        self.fontSize = fontSize
    }
}
