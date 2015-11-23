//
//  iOSChartProtocolExtensions.swift
//  SSChartwell
//
//  Created by Jeffrey Bergier on 11/22/15.
//  Copyright © 2015 Jeffrey Bergier. All rights reserved.
//

import UIKit

public extension ChartRendererType {
    public var image: UIImage? {
        let font = CTFont.chartwellFont(self.data, pointSize: self.fontSize)
        let attributedString = NSAttributedString(chartData: self.data, font: font)
        let renderingView = UILabel()
        renderingView.backgroundColor = UIColor.whiteColor()
        renderingView.lineBreakMode = NSLineBreakMode.ByClipping
        renderingView.attributedText = attributedString
        renderingView.sizeToFit()
        UIGraphicsBeginImageContextWithOptions(renderingView.bounds.size, renderingView.opaque, 0.0)
        defer {
            UIGraphicsEndImageContext()
            
        }
        if let currentContext = UIGraphicsGetCurrentContext() {
            renderingView.layer.renderInContext(currentContext)
            if let image = UIGraphicsGetImageFromCurrentImageContext() {
                return image
            }
        }
        return .None
    }
}

public extension ChartRendererType {
    public func generateAnimatedImagesWithFrameCount(frameCount: UInt, completionHandler: ([UIImage] -> Void)) {
        let myComponents = self.data.components
        let myComponentType = myComponents.first?.dynamicType ?? Chart.BarsVertical.Component.self
        let myComponentTypeMax = Int(myComponentType.max ?? 100)
        let myDataType = self.data?.dynamicType ?? Chart.BarsVertical.self
        
        let backgroundQueue = dispatch_get_global_queue(Int(QOS_CLASS_USER_INITIATED.rawValue), 0)
        dispatch_async(backgroundQueue) {
            var images = [UIImage]()
            for i in 0 ..< frameCount {
                let newComponents = myComponents.map() { component -> ChartDataComponentType in
                    let adjustedI = Double(myComponentTypeMax) / Double(frameCount) * Double(i)
                    let math = Double(component.value) / Double(myComponentTypeMax) * adjustedI
                    let roundedMath = UInt(round(math))
                    return myComponentType.init(value: roundedMath, color: component.color)
                }
                let newData = myDataType.init(components: newComponents)
                let newRenderer = self.dynamicType.init(data: newData, fontSize: self.fontSize)
                if let newImage = newRenderer?.image {
                    images.append(newImage)
                }
            }
            dispatch_async(dispatch_get_main_queue()) {
                completionHandler(images)
            }
        }
    }
}