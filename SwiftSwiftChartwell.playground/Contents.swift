//
//  Created by Jeffrey Bergier on 10/02/15.
//
//  Copyright (c) 2015 Jeffrey Bergier
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF COwNTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//




//: Playground - noun: a place where people can play

import Cocoa

enum ChartwellStyle {
    case Bars
    case BarsVertical
    case Lines
    case Pies
    case Radar
    case Rings
    case Rose
    
    func fontOfSize(pointSize: CGFloat) -> NSFont! {
        switch self {
        case .Bars:
            return NSFont(name: "Chartwell Bars", size: pointSize)
        case .BarsVertical:
            return NSFont(name: "Chartwell Bars Vertical", size: pointSize)
        case .Lines:
            return NSFont(name: "Chartwell Lines", size: pointSize)
        case .Pies:
            return NSFont(name: "Chartwell Pies", size: pointSize)
        case .Radar:
            return NSFont(name: "Chartwell Radar", size: pointSize)
        case .Rings:
            return NSFont(name: "Chartwell Rings", size: pointSize)
        case .Rose:
            return NSFont(name: "Chartwell Rose", size: pointSize)
        }
    }
}

struct ChartWellFont {
    var font: NSFont
    var style: ChartwellStyle
    
    init(style: ChartwellStyle, pointSize: CGFloat) {
        let rawFont = style.fontOfSize(pointSize)
        let rawFontDescriptor = CTFontCopyFontDescriptor(rawFont)
        let mutableRawFontDescriptor = CTFontDescriptorCreateCopyWithFeature(rawFontDescriptor,
            NSNumber(int: 35), // Number Case
            NSNumber(int: 2)) // Lining Figures
        let adjustedFont = CTFontCreateWithFontDescriptor(mutableRawFontDescriptor, pointSize, nil)
        
        self.font = adjustedFont
        self.style = style
    }
    
    func chartImageFromString(inputString: NSString, defaultColor: NSColor, colorRanges: [(range: NSRange, color: NSColor)]?) -> NSImage {
        let attrString = CFAttributedStringCreateMutable(kCFAllocatorDefault, 0)
        CFAttributedStringReplaceString(attrString, CFRangeMake(0, 0), inputString)
        CFAttributedStringSetAttribute(attrString, CFRangeMake(0, inputString.length), kCTForegroundColorAttributeName, defaultColor.CGColor)
        CFAttributedStringSetAttribute(attrString, CFRangeMake(0, inputString.length), kCTFontAttributeName, self.font)
        colorRanges?.forEach() { tuple in
            CFAttributedStringSetAttribute(attrString, CFRange(location: tuple.range.location, length: tuple.range.length), kCTForegroundColorAttributeName, tuple.color.CGColor)
        }
        
        let tuple = __CGImageFromAttributedString(attrString)
        let nsImage = NSImage(CGImage: tuple.image, size: tuple.size)
        
        return nsImage
    }
    
    func chartImageFromString(inputString: NSString, chartColor: NSColor) -> NSImage {
        let attrString = CFAttributedStringCreateMutable(kCFAllocatorDefault, 0)
        CFAttributedStringReplaceString(attrString, CFRangeMake(0, 0), inputString)
        CFAttributedStringSetAttribute(attrString, CFRangeMake(0, inputString.length), kCTForegroundColorAttributeName, chartColor.CGColor)
        CFAttributedStringSetAttribute(attrString, CFRangeMake(0, inputString.length), kCTFontAttributeName, self.font)
        
        let tuple = __CGImageFromAttributedString(attrString)
        let nsImage = NSImage(CGImage: tuple.image, size: tuple.size)
        
        return nsImage
    }
    
    private let recycledContext: CGContextRef = {
        let scale = CGFloat(1.0)
        let size = CGSize(width: 2000, height: 2000)
        let scaledSize = CGSize(width: size.width * scale, height: size.height * scale)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        return CGBitmapContextCreate(nil, Int(round(scaledSize.width)), Int(round(scaledSize.height)), 8, 0, colorSpace, CGImageAlphaInfo.PremultipliedLast.rawValue)!
        }()
    
    private func __CGImageFromAttributedString(attributedString: CFAttributedStringRef) -> (image: CGImage, size: CGSize) {
        let line = CTLineCreateWithAttributedString(attributedString)
        let textFrame = CTLineGetImageBounds(line, self.recycledContext)
        let textSize = CGSize(width: textFrame.size.width + textFrame.origin.x, height: textFrame.size.height + textFrame.origin.y)
        
        let outputContext = CGBitmapContextCreate(nil, Int(round(textSize.width)), Int(round(textSize.height)), 8, 0, CGColorSpaceCreateDeviceRGB(), CGImageAlphaInfo.PremultipliedLast.rawValue)!
        CTLineDraw(line, outputContext)
        
        let cgImage = CGBitmapContextCreateImage(outputContext)!
        return (image: cgImage, size: textSize)
    }
}

let textString = "10+30+50+70+40+80+90+100+10+20+30+40+50+60+70+80+90+100+10+30+50+70+40+80+90+100+10+20+30+40+50+60+70+80+90+100+10+30+50+70+40+80+90+100+10+20+30+40+50+60+70+80+90+100"
let fontArray = [
    ChartWellFont(style: .Bars, pointSize: 100),
    ChartWellFont(style: .BarsVertical, pointSize: 100),
    ChartWellFont(style: .Lines, pointSize: 100),
    ChartWellFont(style: .Pies, pointSize: 100),
    ChartWellFont(style: .Radar, pointSize: 100),
    ChartWellFont(style: .Rings, pointSize: 200),
    ChartWellFont(style: .Rose, pointSize: 100)
]

let chartImageArray = fontArray.map() { font -> NSImage in
    return font.chartImageFromString(textString, chartColor: NSColor.blueColor())
}

let url = NSFileManager.defaultManager().URLsForDirectory(NSSearchPathDirectory.CachesDirectory, inDomains: .UserDomainMask).first

for (index, image) in chartImageArray.enumerate() {
    let data = image.TIFFRepresentation
    let fileURL = url!.URLByAppendingPathComponent("file\(index).tiff")
    print(fileURL)
    data?.writeToURL(fileURL, atomically: true)
}

