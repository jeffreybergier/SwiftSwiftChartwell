//
//  ChartWellFont.swift
//  SSChartwell
//
//  Created by Jeffrey Bergier on 11/10/15.
//  Copyright © 2015 Jeffrey Bergier. All rights reserved.
//

import Cocoa

typealias PDFData = NSData

struct ChartwellRingData {
    var ring1: UInt = 0
    var ring2: UInt = 0
    var ring3: UInt = 0
    var ring4: UInt = 0
    var ring5: UInt = 0
    var ring6: UInt = 0
    var ring7: UInt = 0
    var ring8: UInt = 0
    var ring9: UInt = 0
    var ring10: UInt = 0
}

struct ChartwellRingRenderer {
    private var font: NSFont
    private var data: ChartwellRingData
    
    init(data: ChartwellRingData, pointSize: CGFloat) {
        self.font = NSFont.chartwellFontOfStyle(.Rings, pointSize: pointSize)
        self.data = data
    }
    
    var TIFFRepresentation: NSData {
        let renderingView = NSTextField()
        renderingView.wantsLayer = true
        renderingView.backgroundColor = NSColor.redColor()
        renderingView.lineBreakMode = NSLineBreakMode.ByClipping
        renderingView.stringValue = "Hello"
        renderingView.editable = false
        renderingView.sizeToFit()
        let bitmapRep = renderingView.bitmapImageRepForCachingDisplayInRect(renderingView.bounds)
        let pdf = renderingView.dataWithPDFInsideRect(renderingView.bounds)
        let pdfImage = NSImage(data: pdf)
        let tiff = pdfImage!.TIFFRepresentation
        return bitmapRep!.TIFFRepresentation!
    }
}

enum ChartwellFontStyle {
    case Bars
    case BarsVertical
    case Lines
    case Pies
    case Radar
    case Rings
    case Rose
    
    var fontNamedString: String {
        switch self {
        case .Bars:
            return "Chartwell Bars"
        case .BarsVertical:
            return "Chartwell Bars Vertical"
        case .Lines:
            return "Chartwell Lines"
        case .Pies:
            return "Chartwell Pies"
        case .Radar:
            return "Chartwell Radar"
        case .Rings:
            return "Chartwell Rings"
        case .Rose:
            return "Chartwell Rose"
        }
    }
}

struct ChartWellFontRenderer {
    var font: NSFont
    var style: ChartwellFontStyle
    private let renderingTextField: NSTextField
    
    init(style: ChartwellFontStyle, pointSize: CGFloat) {
        
        let rawFont =  NSFont.chartwellFontOfStyle(style, pointSize: pointSize)
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
    
    func chartViewFromTuple(array: [(value: Int, color: NSColor)]) -> NSView {
        let inputString = self.chartStringFromTupleArray(array)
        let renderingView = NSTextField()
        renderingView.lineBreakMode = NSLineBreakMode.ByClipping
        renderingView.editable = false
        renderingView.attributedStringValue = inputString
        renderingView.sizeToFit()
        return renderingView
    }
    
    func chartImageFromIntegerArray(chartInput: [Int], chartColor: NSColor) -> PDFData {
        let inputString = self.chartStringFromIntegerArray(chartInput)
        self.renderingTextField.stringValue = inputString
        self.renderingTextField.textColor = chartColor
        self.renderingTextField.sizeToFit()
        let data = self.renderingTextField.dataWithPDFInsideRect(self.renderingTextField.bounds)
        return data
    }
    
    func chartViewFromIntegerArray(chartInput: [Int], chartColor: NSColor) -> NSView {
        let inputString = self.chartStringFromIntegerArray(chartInput)
        let renderingView = NSTextField()
        renderingView.font = self.font
        renderingView.lineBreakMode = NSLineBreakMode.ByClipping
        renderingView.stringValue = inputString
        renderingView.editable = false
        renderingView.textColor = chartColor
        renderingView.sizeToFit()
        return renderingView
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

extension NSFont {
    class func chartwellFontOfStyle(chartwell: ChartwellFontStyle, pointSize: CGFloat) -> NSFont {
        let rawFont = NSFont(name: chartwell.fontNamedString, size: pointSize)
        let rawFontDescriptor = CTFontCopyFontDescriptor(rawFont!)
        let mutableRawFontDescriptor = CTFontDescriptorCreateCopyWithFeature(rawFontDescriptor,
            NSNumber(int: 35), // Number Case
            NSNumber(int: 2)) // Lining Figures
        let adjustedFont = CTFontCreateWithFontDescriptor(mutableRawFontDescriptor, pointSize, nil)
        return adjustedFont
    }
}