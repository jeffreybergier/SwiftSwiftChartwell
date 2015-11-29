//
//  ChartSumDataType.swift
//  SSChartwell
//
//  Created by Jeffrey Bergier on 11/29/15.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//
//


public extension ChartSumDataType {
    public init?(components: [ChartDataComponentType]) {
        let expectedComponentType = Self.componentType
        let receivedComponentType = components.first?.dynamicType
        guard receivedComponentType == expectedComponentType else {
            NSLog("Received component type: \(receivedComponentType) does not match expected component type: \(expectedComponentType)")
            return nil
        }
        
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
