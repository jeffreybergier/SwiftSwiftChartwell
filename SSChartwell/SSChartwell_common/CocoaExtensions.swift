//
//  CocoaExtensions.swift
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

extension CTFont {
    class func chartwellFont(chartType: ChartDataType, pointSize: CGFloat) -> CTFont {
        let rawFont: CTFont!
        #if os(iOS)
            rawFont = UIFont(name: chartType.dynamicType.fontName, size: pointSize)
        #elseif os(OSX)
            rawFont = NSFont(name: chartType.dynamicType.fontName, size: pointSize)
        #endif
        
        let rawFontDescriptor = CTFontCopyFontDescriptor(rawFont)
        let mutableRawFontDescriptor = CTFontDescriptorCreateCopyWithFeature(rawFontDescriptor,
            NSNumber(int: 35), // Number Case
            NSNumber(int: 2)) // Lining Figures
        let adjustedFont = CTFontCreateWithFontDescriptor(mutableRawFontDescriptor, pointSize, nil)
        return adjustedFont
    }
}

extension NSAttributedString {
    convenience init(chartData: ChartDataType, font: CTFont) {
        let mutableAttributedString = NSMutableAttributedString()
        for component in chartData.components {
            mutableAttributedString.appendAttributedString(NSAttributedString(string: "\(component.value)+", attributes: [NSForegroundColorAttributeName : component.color, NSFontAttributeName : font]))
        }
        self.init(attributedString: mutableAttributedString)
    }
}