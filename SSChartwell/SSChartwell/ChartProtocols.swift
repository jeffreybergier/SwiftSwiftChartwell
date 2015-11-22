//
//  SSChartwell.swift
//  SSChartwell
//
//  Created by Jeffrey Bergier on 11/17/15.
//  Copyright © 2015 Jeffrey Bergier. All rights reserved.
//

import Cocoa

struct Chart {
    enum Style {
        case Bars
        case BarsVertical
        case Lines
        case Pies
        case Radar
        case Rings
        case Rose
        
        var fontName: String {
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
}

protocol ChartDataType {
    static var max: UInt? { get }
    static var fontName: String { get }
    var components: [ChartDataComponentType] { get set }
    init(components: [ChartDataComponentType])
    mutating func appendComponent(newComponent: ChartDataComponentType) -> Bool
    // WORKAROUND FOR SWIFT PROTOCOL EXTENSION
    // ISSUES WITH INITIALIZERS
    init()
    // END WORKAROUND
}

protocol ChartDataComponentType {
    static var max: UInt? { get }
    var value: UInt { get set }
    var color: NSColor { get set }
    init(value: UInt, color: NSColor)
    // WORKAROUND FOR SWIFT PROTOCOL EXTENSION
    // ISSUES WITH INITIALIZERS
    init()
    // END WORKAROUND
}

protocol ChartRendererType {
    var fontSize: CGFloat { get set }
    var data: ChartDataType! { get set }
    var TIFFImage: NSImage { get }
    var PDFImage: NSImage { get }
    init(data: ChartDataType, fontSize: CGFloat)
    // WORKAROUND FOR SWIFT PROTOCOL EXTENSION
    // ISSUES WITH INITIALIZERS
    init()
    // END WORKAROUND
}

extension ChartDataType {
    init(components: [ChartDataComponentType]) {
        self.init()
        if let max = self.dynamicType.max {
            let maxInt = Int(max)
            if components.count <= maxInt {
                self.components = components
            } else {
                NSLog("Components exceed MAX. Using only first \(max) components.")
                (0..<maxInt).forEach() { self.components.append(components[$0]) }
            }
        } else {
            self.components = components
        }
    }
    mutating func appendComponent(newComponent: ChartDataComponentType) -> Bool {
        if let max = self.dynamicType.max {
            let maxInt = Int(max)
            if self.components.count < maxInt {
                self.components.append(newComponent)
                return true
            } else {
                NSLog("Failed to append component. Already at MAX: \(max)")
                return false
            }
        } else {
            self.components.append(newComponent)
            return true
        }
    }
}

extension ChartDataComponentType {
    init(value: UInt, color: NSColor) {
        self.init()
        self.color = color
        
        if let max = self.dynamicType.max {
            if value <= max {
                self.value = value
            } else {
                NSLog("Component exceeds MAX. Setting to MAX value: \(max)")
                self.value = max
            }
        } else {
            self.value = value
        }
    }
}

extension ChartRendererType {
    init(data: ChartDataType, fontSize: CGFloat) {
        self.init()
        self.data = data
        self.fontSize = fontSize
    }
    
    var TIFFImage: NSImage {
        let PDFImage = self.PDFImage
        let TIFF = PDFImage.TIFFRepresentation!
        let TIFFImage = NSImage(data: TIFF)!
        return TIFFImage
    }
    var PDFImage: NSImage {
        let font = NSFont.chartwellFont(self.data, pointSize: self.fontSize)
        let attributedString = NSAttributedString(chartData: self.data, font: font)
        let renderingView = NSTextField()
        renderingView.lineBreakMode = NSLineBreakMode.ByClipping
        renderingView.attributedStringValue = attributedString
        renderingView.editable = false
        renderingView.sizeToFit()
        let PDF = renderingView.dataWithPDFInsideRect(renderingView.bounds)
        let PDFImage = NSImage(data: PDF)!
        return PDFImage
    }
}

extension Chart {
    struct Renderer: ChartRendererType {
        var data: ChartDataType!
        var fontSize: CGFloat = 0
        
        // WORKAROUND FOR SWIFT PROTOCOL EXTENSION
        // ISSUES WITH INITIALIZERS
        init() { }
        // END WORKAROUND
    }
}

extension NSFont {
    class func chartwellFont(chartType: ChartDataType, pointSize: CGFloat) -> NSFont {
        let rawFont = NSFont(name: chartType.dynamicType.fontName, size: pointSize)
        let rawFontDescriptor = CTFontCopyFontDescriptor(rawFont!)
        let mutableRawFontDescriptor = CTFontDescriptorCreateCopyWithFeature(rawFontDescriptor,
            NSNumber(int: 35), // Number Case
            NSNumber(int: 2)) // Lining Figures
        let adjustedFont = CTFontCreateWithFontDescriptor(mutableRawFontDescriptor, pointSize, nil)
        return adjustedFont
    }
}

extension NSAttributedString {
    convenience init(chartData: ChartDataType, font: NSFont) {
        let mutableAttributedString = NSMutableAttributedString()
        for component in chartData.components {
            mutableAttributedString.appendAttributedString(NSAttributedString(string: "\(component.value)+", attributes: [NSForegroundColorAttributeName : component.color, NSFontAttributeName : font]))
        }
        self.init(attributedString: mutableAttributedString)
    }
}