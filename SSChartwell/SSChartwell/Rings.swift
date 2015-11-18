//
//  Ring.swift
//  SSChartwell
//
//  Created by Jeffrey Bergier on 11/17/15.
//  Copyright © 2015 Jeffrey Bergier. All rights reserved.
//

import Cocoa

extension Chart {
    struct Rings {
        private var components: [Component]
        
        init() {
            self.components = []
        }
        
        init(components: [Component]?) {
            self.components = []
            if let components = components {
                for component in components {
                    if self.addComponent(component) == false {
                        NSLog("Ring components have been truncated. A ring chart can only support 10 rings.")
                        break
                    }
                }
            }
        }
        
        mutating func addComponent(newComponent: Chart.Rings.Component) -> Bool {
            if self.components.count >= 10 {
                NSLog("Unable to add Ring Component. Ring Charts only support 10 rings.")
                return false
            } else {
                self.components.append(newComponent)
                return true
            }
        }
    }
}

extension Chart.Rings {
    struct Component {
        var size: UInt
        var color: NSColor
        static var max: UInt {
            return 100
        }
        
        init(size: UInt, color: NSColor = NSColor.blackColor()) {
            if size > Component.max {
                NSLog("Size Exceeds Max: Setting to 100")
                self.size = 100
            } else {
                self.size = size
            }
            self.color = color
        }
    }
}

extension Chart.Rings {
    struct Renderer {
        private var font: NSFont
        private var data: Chart.Rings
        
        init(data: Chart.Rings, pointSize: CGFloat) {
            self.font = NSFont.chartwellFontOfStyle(.Rings, pointSize: pointSize)
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
            renderingView.attributedStringValue = NSAttributedString(rings: self.data, font: self.font)
            renderingView.editable = false
            renderingView.sizeToFit()
            let PDF = renderingView.dataWithPDFInsideRect(renderingView.bounds)
            let PDFImage = NSImage(data: PDF)!
            return PDFImage
        }
    }
}

extension NSAttributedString {
    convenience init(rings: Chart.Rings, font: NSFont) {
        let mutableAttributedString = NSMutableAttributedString()
        for ringComponent in rings.components {
            mutableAttributedString.appendAttributedString(NSAttributedString(string: "\(ringComponent.size)+", attributes: [NSForegroundColorAttributeName : ringComponent.color, NSFontAttributeName : font]))
        }
        self.init(attributedString: mutableAttributedString)
    }
}