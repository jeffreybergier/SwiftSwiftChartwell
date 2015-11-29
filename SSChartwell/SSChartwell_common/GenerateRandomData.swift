//
//  GenerateRandomData.swift
//  SSChartwell
//
//  Created by Jeffrey Bergier on 11/28/15.
//  Copyright © 2015 Jeffrey Bergier. All rights reserved.
//

import Foundation

extension ChartDataType {
    
    public static func generateRandomData() -> [ChartDataComponentType] {
        let dataType = self
        if let _ = dataType as? ChartSumDataType.Type {
            return self.generateRandomDataForSumType()
        } else {
            return self.generateRandomDataForNonSumType()
        }
    }
    
    private static func generateRandomDataForSumType() -> [ChartDataComponentType] {
        let componentType = self.componentType
        let chartMaxValue = UInt(componentType.max ?? 10)
        var componentCount = UInt(0)
        let lower : UInt32 = 1
        let upper : UInt32 = 30
        
        var components: [ChartDataComponentType] = []
        for _ in 0 ..< 100 {
            let value = UInt(arc4random_uniform(upper - lower) + lower)
            if (componentCount + value) <= chartMaxValue {
                let newComponent = componentType.init(value: value, color: self.randomColor())
                components.append(newComponent)
                componentCount += value
            } else {
                break
            }
        }
        return components
    }
    
    private static func generateRandomDataForNonSumType() -> [ChartDataComponentType] {
        let componentType = self.componentType
        let componentMaxValue = UInt32(componentType.max ?? 100)
        let chartMaxNumberComponents = Int(componentType.max ?? 10)
        let lower : UInt32 = 0
        let upper : UInt32 = componentMaxValue
        
        var components: [ChartDataComponentType] = []
        for _ in 0 ..< Int(chartMaxNumberComponents) {
            let value = UInt(arc4random_uniform(upper - lower) + lower)
            let newComponent = componentType.init(value: value, color: self.randomColor())
            components.append(newComponent)
        }
        return components
    }
    
    private static func randomColor() -> CGColor {
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        #if os(iOS) || os(tvOS)
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0).CGColor
        #elseif os(OSX)
            return NSColor(red: red, green: green, blue: blue, alpha: 1.0).CGColor
        #endif
    }
}