//
//  Pies.swift
//  SSChartwell
//
//  Created by Jeffrey Bergier on 11/17/15.
//  Copyright © 2015 Jeffrey Bergier. All rights reserved.
//

import Cocoa

protocol ChartDataType {
    static var max: UInt? { get }
    static var fontName: String { get }
    var components: [ChartDataComponentType] { get set }
    init(components: [ChartDataComponentType]?)
    mutating func appendComponent(newComponent: ChartDataComponentType) -> Bool
}

protocol ChartDataComponentType {
    static var max: UInt? { get }
    var value: UInt { get set }
    var color: NSColor { get set }
    init(value: UInt, color: NSColor)
}

extension ChartDataType {
    init(components: [ChartDataComponentType]?) {
        self.init(components: components)
        self.components = components ?? []
    }
    mutating func appendComponent(newComponent: ChartDataComponentType) -> Bool {
        self.components.append(newComponent)
        return true
    }
}

extension ChartDataComponentType {
    init(value: UInt, color: NSColor) {
        self.init(value: value, color: color)
        self.color = color
        self.value = value
    }
}

extension Chart {
    struct BarsVertical: ChartDataType {
        static var max: UInt? = 100
        static var fontName: String = "Chartwell Bars Vertical"
        var components: [ChartDataComponentType]
    }
}

extension Chart.BarsVertical {
    struct Component: ChartDataComponentType {
        static var max: UInt? = 100
        var value: UInt
        var color: NSColor
    }
}

extension Chart {
    struct Pie {
        private var components = [Component]()
        
        mutating func addComponent(newComponent: Component) -> Bool {
            var currentValue: UInt = 0
            for component in self.components {
                currentValue += component.percentage
            }
            if currentValue + newComponent.percentage > 100 {
                NSLog("Failed to Append New Pie Component to Pie Chart. Total Value Greater than 100%")
                return false
            } else {
                self.components.append(newComponent)
                return true
            }
        }
        
        init() {
            
        }
        
        init(components: [Component]?) {
            // not using forEach() here because it does not allow break command
            if let components = components {
                for component in components {
                    if self.addComponent(component) == false {
                        NSLog("Pie Chart may be missing components. Total component value was greater than 100%")
                        break
                    }
                }
            }
        }
    }
}

extension Chart.Pie {
    struct Component {
        var percentage: UInt
        var color: NSColor
        static var max: UInt {
            return 100
        }
        
        init(percentage: UInt, color: NSColor = NSColor.blackColor()) {
            if percentage > Component.max {
                NSLog("Percentage Exceeds Max: Setting to 100")
                self.percentage = 100
            } else {
                self.percentage = percentage
            }
            self.color = color
        }
    }
}

extension Chart.Pie {
    struct Renderer {
        private var font: NSFont
        private var data: Chart.Pie
        
        init(data: Chart.Pie, pointSize: CGFloat) {
            self.font = NSFont.chartwellFontOfStyle(.Pies, pointSize: pointSize)
            self.data = data
        }
        
        var TIFFImage: NSImage {
            let PDFImage = self.PDFImage
            let TIFF = PDFImage.TIFFRepresentation!
            let TIFFImage = NSImage(data: TIFF)!
            return TIFFImage
        }
        
        var PDFImage: NSImage {
            let renderingView = NSTextField()
            renderingView.lineBreakMode = NSLineBreakMode.ByClipping
            renderingView.attributedStringValue = NSAttributedString(piesComponents: self.data, font: self.font)
            renderingView.editable = false
            renderingView.sizeToFit()
            let PDF = renderingView.dataWithPDFInsideRect(renderingView.bounds)
            let PDFImage = NSImage(data: PDF)!
            return PDFImage
        }
    }
}

extension NSAttributedString {
    convenience init(piesComponents: Chart.Pie, font: NSFont) {
        let mutableAttributedString = NSMutableAttributedString()
        for pieComponent in piesComponents.components {
            mutableAttributedString.appendAttributedString(NSAttributedString(string: "\(pieComponent.percentage)+", attributes: [NSForegroundColorAttributeName : pieComponent.color, NSFontAttributeName : font]))
        }
        self.init(attributedString: mutableAttributedString)
    }
}