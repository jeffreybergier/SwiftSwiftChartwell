//
//  CocoaExtensions.swift
//  SSChartwell
//
//  Created by Jeffrey Bergier on 11/22/15.
//
//  Copyright © 2015 Jeffrey Bergier.
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

#if os(iOS) || os(tvOS)
    import UIKit
#elseif os(OSX)
    import Cocoa
#endif

public extension CTFont {
    public class func chartwellFont(chartType: ChartDataType, pointSize: CGFloat) -> CTFont {
        let rawFont: CTFont!
        #if os(iOS) || os(tvOS)
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

public extension NSAttributedString {
    public convenience init(chartData: ChartDataType, font: CTFont) {
        let mutableAttributedString = NSMutableAttributedString()
        for component in chartData.components {
            mutableAttributedString.appendAttributedString(NSAttributedString(string: "\(component.value)+", attributes: [NSForegroundColorAttributeName : component.color, NSFontAttributeName : font]))
        }
        self.init(attributedString: mutableAttributedString)
    }
}