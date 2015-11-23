//
//  CocoaExtensions.swift
//  SSChartwell
//
//  Created by Jeffrey Bergier on 11/22/15.
//  Copyright © 2015 Jeffrey Bergier. All rights reserved.
//

#if os(iOS) || os(tvOS)
    import UIKit
#elseif os(OSX)
    import Cocoa
#endif

    public extension CTFont {        
        public class func chartwellFont(chartType: ChartDataType, pointSize: CGFloat) -> CTFont {
            let rawFont: CTFont!
            #if os(iOS) || os(tvOS)
                rawFont = UIFont(name: chartType.dynamicType.style.fontName, size: pointSize)
            #elseif os(OSX)
                rawFont = NSFont(name: chartType.dynamicType.style.fontName, size: pointSize)
            #endif
            
            let rawFontDescriptor = CTFontCopyFontDescriptor(rawFont)
            let mutableRawFontDescriptor = CTFontDescriptorCreateCopyWithFeature(rawFontDescriptor,
                NSNumber(int: 35), // Number Case
                NSNumber(int: 2)) // Lining Figures
            let adjustedFont = CTFontCreateWithFontDescriptor(mutableRawFontDescriptor, pointSize, nil)
            return adjustedFont
        }
    }
    
    public extension NSAttributedString {
        public convenience init(chartData: ChartDataType, font: CTFont) {
            let mutableAttributedString = NSMutableAttributedString()
            for component in chartData.components {
                mutableAttributedString.appendAttributedString(NSAttributedString(string: "\(component.value)+", attributes: [NSForegroundColorAttributeName : component.color, NSFontAttributeName : font]))
            }
            self.init(attributedString: mutableAttributedString)
        }
}