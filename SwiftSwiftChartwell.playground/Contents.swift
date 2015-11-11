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

if let chartwellBarsVerticalFont = NSBundle.mainBundle().URLForResource("ChartwellBarsVertical", withExtension: "ttf") {
    CTFontManagerRegisterFontsForURL(chartwellBarsVerticalFont, CTFontManagerScope.Process, nil)
}
if let chartwellBars = NSBundle.mainBundle().URLForResource("ChartwellBars", withExtension: "ttf") {
    CTFontManagerRegisterFontsForURL(chartwellBars, CTFontManagerScope.Process, nil)
}
if let chartwellLines = NSBundle.mainBundle().URLForResource("ChartwellLines", withExtension: "ttf") {
    CTFontManagerRegisterFontsForURL(chartwellLines, CTFontManagerScope.Process, nil)
}
if let chartwellPies = NSBundle.mainBundle().URLForResource("ChartwellPies", withExtension: "ttf") {
    CTFontManagerRegisterFontsForURL(chartwellPies, CTFontManagerScope.Process, nil)
}
if let chartwellRadar = NSBundle.mainBundle().URLForResource("ChartwellRadar", withExtension: "ttf") {
    CTFontManagerRegisterFontsForURL(chartwellRadar, CTFontManagerScope.Process, nil)
}
if let chartwellRings = NSBundle.mainBundle().URLForResource("ChartwellRings", withExtension: "ttf") {
    CTFontManagerRegisterFontsForURL(chartwellRings, CTFontManagerScope.Process, nil)
}
if let chartwellRose = NSBundle.mainBundle().URLForResource("ChartwellRose", withExtension: "ttf") {
    CTFontManagerRegisterFontsForURL(chartwellRose, CTFontManagerScope.Process, nil)
}


typealias PDFData = NSData

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
    private let renderingTextField: NSTextField
    
    init(style: ChartwellStyle, pointSize: CGFloat) {
        
        let rawFont = style.fontOfSize(pointSize)
        let rawFontDescriptor = CTFontCopyFontDescriptor(rawFont)
        let mutableRawFontDescriptor = CTFontDescriptorCreateCopyWithFeature(rawFontDescriptor,
            NSNumber(int: 35), // Number Case
            NSNumber(int: 2)) // Lining Figures
        let adjustedFont = CTFontCreateWithFontDescriptor(mutableRawFontDescriptor, pointSize, nil)
        
        self.renderingTextField = NSTextField()
        self.renderingTextField.font = adjustedFont
        self.renderingTextField.lineBreakMode = NSLineBreakMode.ByClipping
        
        self.font = adjustedFont
        self.style = style
    }
    
    func chartImageFromTuple(array: [(value: Int, color: NSColor)]) -> PDFData {
        let inputString = self.chartStringFromTupleArray(array)
        self.renderingTextField.attributedStringValue = inputString
        self.renderingTextField.sizeToFit()
        let data = self.renderingTextField.dataWithPDFInsideRect(self.renderingTextField.bounds)
        return data
    }
    
    func chartImageFromIntegerArray(chartInput: [Int], chartColor: NSColor) -> PDFData {
        let inputString = self.chartStringFromIntegerArray(chartInput)
        self.renderingTextField.stringValue = inputString
        self.renderingTextField.textColor = chartColor
        self.renderingTextField.sizeToFit()
        let data = self.renderingTextField.dataWithPDFInsideRect(self.renderingTextField.bounds)
        return data
    }
    
    private func chartStringFromIntegerArray(integerArray: [Int]) -> String {
        var outputString = ""
        integerArray.forEach() { integer in
            outputString += "\(integer)+"
        }
        return outputString
    }
    
    private func chartStringFromTupleArray(array: [(value: Int, color: NSColor)]) -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString()
        array.forEach() { tuple in
            let attributes = [
                NSForegroundColorAttributeName : tuple.color,
                NSFontAttributeName : self.font
            ]
            let tinyString = NSAttributedString(string: "\(tuple.value)+", attributes: attributes)
            mutableAttributedString.appendAttributedString(tinyString)
        }
        let outputAttributedString = mutableAttributedString.copy() as! NSAttributedString
        return outputAttributedString
    }
}

let textArray = [10,30,50,70,40,80,90,100,10,20,30,40,50,60,70,80,90,100,10,30,50,70,40,80,90,100,10,20,30,40,50,60,70,80,90,100,10,30,50,70,40,80,90,100,10,20,30,40,50,60,70,80,90,100]

let textTuple = [
    (value: 10, color: NSColor.redColor()),
    (value: 20, color: NSColor.yellowColor()),
    (value: 30, color: NSColor.greenColor()),
    (value: 40, color: NSColor.blueColor()),
    (value: 50, color: NSColor.grayColor()),
    (value: 60, color: NSColor.darkGrayColor()),
    (value: 70, color: NSColor.lightGrayColor()),
    (value: 80, color: NSColor.blueColor()),
    (value: 90, color: NSColor.brownColor()),
    (value: 100, color: NSColor.magentaColor()),
    (value: 10, color: NSColor.cyanColor()),
    (value: 20, color: NSColor.orangeColor()),
    (value: 30, color: NSColor.redColor()),
    (value: 40, color: NSColor.redColor()),
    (value: 50, color: NSColor.greenColor()),
    (value: 60, color: NSColor.grayColor()),
    (value: 70, color: NSColor.yellowColor()),
    (value: 80, color: NSColor.darkGrayColor()),
    (value: 90, color: NSColor.orangeColor()),
    (value: 100, color: NSColor.redColor()),
    (value: 10, color: NSColor.blueColor()),
    (value: 20, color: NSColor.greenColor()),
    (value: 30, color: NSColor.magentaColor()),
    (value: 40, color: NSColor.cyanColor()),
    (value: 50, color: NSColor.blueColor()),
    (value: 60, color: NSColor.redColor()),
    (value: 70, color: NSColor.blueColor()),
    (value: 80, color: NSColor.greenColor()),
    (value: 90, color: NSColor.magentaColor()),
    (value: 100, color: NSColor.cyanColor())
]

let fontArray = [
    ChartWellFont(style: .Bars, pointSize: 100),
    ChartWellFont(style: .BarsVertical, pointSize: 100),
    ChartWellFont(style: .Lines, pointSize: 100),
    ChartWellFont(style: .Pies, pointSize: 100),
    ChartWellFont(style: .Radar, pointSize: 100),
    ChartWellFont(style: .Rings, pointSize: 200),
    ChartWellFont(style: .Rose, pointSize: 100)
]

let chartImageArray = fontArray.map() { font -> PDFData in
    return font.chartImageFromIntegerArray(textArray, chartColor: NSColor.blueColor())
}

let chartColoredArray = fontArray.map() { font -> PDFData in
    return font.chartImageFromTuple(textTuple)
}

let url = NSFileManager.defaultManager().URLsForDirectory(NSSearchPathDirectory.CachesDirectory, inDomains: .UserDomainMask).first

for (index, data) in chartImageArray.enumerate() {
    let fileURL = url!.URLByAppendingPathComponent("singleColor\(index).pdf")
    print(fileURL)
    data.writeToURL(fileURL, atomically: true)
}

for (index, data) in chartColoredArray.enumerate() {
    let fileURL = url!.URLByAppendingPathComponent("multiColor\(index).pdf")
    print(fileURL)
    data.writeToURL(fileURL, atomically: true)
}

