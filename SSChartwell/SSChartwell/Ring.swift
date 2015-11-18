//
//  Ring.swift
//  SSChartwell
//
//  Created by Jeffrey Bergier on 11/17/15.
//  Copyright © 2015 Jeffrey Bergier. All rights reserved.
//

import Cocoa

extension Chart {
    struct Ring {
        struct Component {
            var size: ZeroOneHundredInt = .Zero
            var color: NSColor = NSColor.clearColor()
        }
        
        struct Components {
            var ring1 = Component()
            var ring2 = Component()
            var ring3 = Component()
            var ring4 = Component()
            var ring5 = Component()
            var ring6 = Component()
            var ring7 = Component()
            var ring8 = Component()
            var ring9 = Component()
            var ring10 = Component()
        }
    }
}

extension Chart.Ring {
    struct Renderer {
        private var font: NSFont
        private var data: Chart.Ring.Components
        
        init(data: Chart.Ring.Components, pointSize: CGFloat) {
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
            renderingView.attributedStringValue = NSAttributedString(ringComponents: self.data, font: self.font)
            renderingView.editable = false
            renderingView.sizeToFit()
            let PDF = renderingView.dataWithPDFInsideRect(renderingView.bounds)
            let PDFImage = NSImage(data: PDF)!
            return PDFImage
        }
    }
}

extension Chart.Ring.Components: SequenceType {
    func generate() -> Chart.Ring.Components.Generator {
        return Generator(data: self)
    }
    
    struct Generator: GeneratorType {
        
        private var data: Chart.Ring.Components
        private var iteratingLocation = 0
        
        init(data: Chart.Ring.Components) {
            self.data = data
        }
        
        mutating func next() -> Chart.Ring.Component? {
            switch self.iteratingLocation {
            case 0:
                self.iteratingLocation += 1
                return data.ring1
            case 1:
                self.iteratingLocation += 1
                return data.ring2
            case 2:
                self.iteratingLocation += 1
                return data.ring3
            case 3:
                self.iteratingLocation += 1
                return data.ring4
            case 4:
                self.iteratingLocation += 1
                return data.ring5
            case 5:
                self.iteratingLocation += 1
                return data.ring6
            case 6:
                self.iteratingLocation += 1
                return data.ring7
            case 7:
                self.iteratingLocation += 1
                return data.ring8
            case 8:
                self.iteratingLocation += 1
                return data.ring9
            case 9:
                self.iteratingLocation += 1
                return data.ring10
            default:
                self.iteratingLocation = 0
                return .None
            }
        }
    }
}

extension NSAttributedString {
    convenience init(ringComponents: Chart.Ring.Components, font: NSFont) {
        let mutableAttributedString = NSMutableAttributedString()
        for ringComponent in ringComponents {
            mutableAttributedString.appendAttributedString(NSAttributedString(string: "\(ringComponent.size)+", attributes: [NSForegroundColorAttributeName : ringComponent.color, NSFontAttributeName : font]))
        }
        self.init(attributedString: mutableAttributedString)
    }
}