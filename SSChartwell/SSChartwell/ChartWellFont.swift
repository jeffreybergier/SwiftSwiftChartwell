//
//  ChartWellFont.swift
//  SSChartwell
//
//  Created by Jeffrey Bergier on 11/10/15.
//  Copyright © 2015 Jeffrey Bergier. All rights reserved.
//

import Cocoa

typealias PDFData = NSData

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
        
        let rawFont =  NSFont(chartwell: style, pointSize: pointSize)
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
    convenience init!(chartwell: ChartwellFontStyle, pointSize: CGFloat) {
        self.init(name: chartwell.fontNamedString, size: pointSize)
    }
    
}