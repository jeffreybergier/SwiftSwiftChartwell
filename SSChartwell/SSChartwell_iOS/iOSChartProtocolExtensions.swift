//
//  iOSChartProtocolExtensions.swift
//  SSChartwell
//
//  Created by Jeffrey Bergier on 11/22/15.
//  Copyright © 2015 Jeffrey Bergier. All rights reserved.
//

import UIKit

public extension ChartRendererType {
    public var image: UIImage {
        let font = CTFont.chartwellFont(self.data, pointSize: self.fontSize)
        let attributedString = NSAttributedString(chartData: self.data, font: font)
        let renderingView = UILabel()
        renderingView.backgroundColor = UIColor.whiteColor()
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