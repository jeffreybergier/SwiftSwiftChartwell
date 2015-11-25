//
//  ChartProtocolExtensions.swift
//  SSChartwell
//
//  Created by Jeffrey Bergier on 11/22/15.
//  Copyright © 2015 Jeffrey Bergier. All rights reserved.
//

import CoreGraphics
import Foundation

public extension ChartSumDataType {
    public init(components: [ChartDataComponentType]) {
        self.init()
        guard let chartMaxSum = self.dynamicType.max else {
            self.components = components
            return
        }
        var componentSum = UInt(0)
        let trimmedComponents = components.map() { component -> ChartDataComponentType? in
            if (component.value + componentSum) <= chartMaxSum {
                componentSum += component.value
                return component
            } else {
                return .None
            }
        }.filter() { component -> Bool in
            if let _ = component { return true } else { return false }
        }.map() { component -> ChartDataComponentType in
            return component!
        }
        if trimmedComponents.count != components.count {
            NSLog("Components total value exceeds \(chartMaxSum) max. Using first \(trimmedComponents.count) components, total value of \(componentSum).")
        }
        self.components = trimmedComponents
    }
    
    public mutating func appendComponent(newComponent: ChartDataComponentType) -> Bool {
        guard let chartMaxSum = self.dynamicType.max else {
            self.components.append(newComponent)
            return true
        }
        let existingComponentsSum = self.components.reduce(0) { (totalSoFar, nextComponent) -> UInt in
            return totalSoFar + nextComponent.value
        }
        if existingComponentsSum + newComponent.value <= chartMaxSum {
            self.components.append(newComponent)
            return true
        } else {
            NSLog("Could not append component. Existing Value: \(existingComponentsSum) plus New Value: \(newComponent.value) exceeds \(chartMaxSum) max.")
            return false
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
    public init?(data: ChartDataType, fontSize: CGFloat) {
        if Chart.FontLoader.sharedInstance.fontAvailableForStyle(data.dynamicType.style) == false {
            return nil
        }
        
        self.init()
        self.data = data
        self.fontSize = fontSize
    }
    
    func animationReadyChartSumDataTypeArrayWithFrameCount(frameCount: UInt) -> [ChartSumDataType] {
        guard let myDataType = self.data?.dynamicType as? ChartSumDataType.Type else { return [] }
        guard let myComponentType = self.data.components.first?.dynamicType else { return [] }
        let myComponents = self.data.components
        
        let data = (0 ..< frameCount).map() { count -> [ChartDataComponentType] in
            if count >= frameCount - 1 {
                return myComponents // in the last loop, I want to return what we started with
            } else {
                let newComponents = myComponents.map() { component -> ChartDataComponentType in
                    let value = count <= component.value ? count : component.value
                    let newComponent = myComponentType.init(value: value, color: component.color)
                    return newComponent
                }
                return newComponents
            }
            }.map() { components -> ChartSumDataType in
                let newData = myDataType.init(components: components)
                return newData
        }
        return data
    }
    
    func animationReadyChartDataTypeArrayWithFrameCount(frameCount: UInt) -> [ChartDataType] {
        guard let myDataType = self.data?.dynamicType else { return [] }
        guard let myComponentType = self.data.components.first?.dynamicType else { return [] }
        let myComponents = self.data.components
        
        let data = (0 ..< frameCount).map() { count -> [ChartDataComponentType] in
            if count >= frameCount - 1 {
                return myComponents // in the last loop, I want to return what we started with.
            } else {
                let newComponents = myComponents.map() { component -> ChartDataComponentType in
                    let adjustedCount = Double(component.value) / Double(frameCount) * Double(count)
                    let roundedMath = UInt(round(adjustedCount))
                    return myComponentType.init(value: roundedMath, color: component.color)
                }
                return newComponents
            }
            }.map() { components -> ChartDataType in
                let newData = myDataType.init(components: components)
                return newData
        }
        return data
    }
}
