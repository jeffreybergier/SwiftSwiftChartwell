//
//  ChartRendererType.swift
//  SSChartwell
//
//  Created by Jeffrey Bergier on 11/29/15.
//  Copyright © 2015 Jeffrey Bergier. All rights reserved.
//


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
        let myComponents = self.data.components
        guard let myDataType = self.data?.dynamicType as? ChartSumDataType.Type else { return [] }
        guard let myComponentType = myComponents.first?.dynamicType else { return [] }
        
        let data = (0 ..< frameCount).map() { count -> [ChartDataComponentType] in
            if count >= frameCount - 1 {
                return myComponents // in the last loop, I want to return what we started with
            } else {
                let newComponents = myComponents.map() { component -> ChartDataComponentType in
                    let offsetCalculation: UInt
                    if component.value > frameCount {
                        // if the total framecount is less than the component value, I need to adjust each frame
                        // because there is not a 1 to 1 relationship between frames and values.
                        let animationPercentage = Double(count) / Double(frameCount != 0 ? frameCount : 1)
                        offsetCalculation = UInt(round(animationPercentage * Double(component.value)))//averageValuePerComponent))
                    } else {
                        offsetCalculation = count
                    }
                    let compareCalculationToFinalValue = offsetCalculation <= component.value ? offsetCalculation : component.value
                    let newComponent = myComponentType.init(value: compareCalculationToFinalValue, color: component.color)
                    return newComponent
                }
                return newComponents
            }
            }.map() { components -> ChartSumDataType in
                let newData = myDataType.init(components: components)
                return newData!
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
                return newData!
        }
        return data
    }
}