//
//  ChartWellFont.swift
//  SSChartwell
//
//  Created by Jeffrey Bergier on 11/10/15.
//  Copyright © 2015 Jeffrey Bergier. All rights reserved.
//

import Cocoa

typealias PDFData = NSData

enum ZeroOneHundredInt: Int, CustomStringConvertible {
    case Zero = 0, One, Two, Three, Four, Five, Size, Seven, Eight, Nine, Ten, Eleven, Twelve, Thirteen, Fourteen, Fifteen, Sixteen, Seventeen, Eighteen, Nineteen, Twenty, TwentyOne, TwentyTwo, TwentyThree, TwentyFour, TwentyFive, TwentySix, TwentySeven, TwentyEight, TwentyNine, Thirty, ThirtyOne, ThirtyTwo, ThirtyThree, ThirtyFour, ThirtyFive, ThirtySix, ThirtySeven, ThirtyEight, ThirtyNine, Forty, FortyOne, FortyTwo, FortyThree, Fortyfour, FortyFive, FortySix, FortySeven, FortyEight, FortyNine, Fifty, FiftyOne, FiftyTwo, FiftyThree, FiftyFour, FiftyFive, FiftySix, FiftySeven, FiftyEight, FiftyNine, Sixty, SixtyOne, SixtyTwo, SixtyThree, SixtyFour, SixtyFive, SixtySix, SixtySeven, SixtyEight, SixtyNine, Seventy, SeventyOne, SeventyTwo, SeventyThree, SeventyFour, SeventyFive, SeventySix, SeventySeven, SeventyEight, SeventyNine, Eighty, EightyOne, EightyTwo, EightyThree, EightyFour, EightyFive, EightySix, EightySeven, EightyEight, EightyNine, Ninety, NinetyOne, NinetyTwo, NinetyThree, NinetyFour, NinetyFive, NinetySix, NinetySeven, NinetyEight, NinetyNine, OneHundred
    
    var description: String {
        return "\(self.rawValue)"
    }
}

struct ChartwellRingValue {
    var size: ZeroOneHundredInt = .Zero
    var color: NSColor = NSColor.clearColor()
}

struct ChartwellRingData: GeneratorType, SequenceType {
    var ring1 = ChartwellRingValue()
    var ring2 = ChartwellRingValue()
    var ring3 = ChartwellRingValue()
    var ring4 = ChartwellRingValue()
    var ring5 = ChartwellRingValue()
    var ring6 = ChartwellRingValue()
    var ring7 = ChartwellRingValue()
    var ring8 = ChartwellRingValue()
    var ring9 = ChartwellRingValue()
    var ring10 = ChartwellRingValue()
    
    private var iteratingLocation = 0
    
    mutating func next() -> ChartwellRingValue? {
        self.iteratingLocation += 1
        switch self.iteratingLocation {
        case 0:
            return self.ring1
        case 1:
            return self.ring2
        case 2:
            return self.ring3
        case 3:
            return self.ring4
        case 4:
            return self.ring5
        case 5:
            return self.ring6
        case 6:
            return self.ring7
        case 7:
            return self.ring8
        case 8:
            return self.ring9
        case 9:
            return self.ring10
        default:
            self.iteratingLocation = 0
            return .None
        }
    }
}

extension NSAttributedString {
    
    convenience init(ringData: ChartwellRingData, font: NSFont) {
        let mutableAttributedString = NSMutableAttributedString()
        for ring in ringData {
            
        }
        mutableAttributedString.appendAttributedString(NSAttributedString(string: "\(ringData.ring1.size)+", attributes: [NSForegroundColorAttributeName : ringData.ring1.color, NSFontAttributeName : font]))
        mutableAttributedString.appendAttributedString(NSAttributedString(string: "\(ringData.ring2.size)+", attributes: [NSForegroundColorAttributeName : ringData.ring2.color, NSFontAttributeName : font]))
        mutableAttributedString.appendAttributedString(NSAttributedString(string: "\(ringData.ring3.size)+", attributes: [NSForegroundColorAttributeName : ringData.ring3.color, NSFontAttributeName : font]))
        mutableAttributedString.appendAttributedString(NSAttributedString(string: "\(ringData.ring4.size)+", attributes: [NSForegroundColorAttributeName : ringData.ring4.color, NSFontAttributeName : font]))
        mutableAttributedString.appendAttributedString(NSAttributedString(string: "\(ringData.ring5.size)+", attributes: [NSForegroundColorAttributeName : ringData.ring5.color, NSFontAttributeName : font]))
        mutableAttributedString.appendAttributedString(NSAttributedString(string: "\(ringData.ring6.size)+", attributes: [NSForegroundColorAttributeName : ringData.ring6.color, NSFontAttributeName : font]))
        mutableAttributedString.appendAttributedString(NSAttributedString(string: "\(ringData.ring7.size)+", attributes: [NSForegroundColorAttributeName : ringData.ring7.color, NSFontAttributeName : font]))
        mutableAttributedString.appendAttributedString(NSAttributedString(string: "\(ringData.ring8.size)+", attributes: [NSForegroundColorAttributeName : ringData.ring8.color, NSFontAttributeName : font]))
        mutableAttributedString.appendAttributedString(NSAttributedString(string: "\(ringData.ring9.size)+", attributes: [NSForegroundColorAttributeName : ringData.ring9.color, NSFontAttributeName : font]))
        mutableAttributedString.appendAttributedString(NSAttributedString(string: "\(ringData.ring10.size)", attributes: [NSForegroundColorAttributeName : ringData.ring10.color, NSFontAttributeName : font]))
        self.init(attributedString: mutableAttributedString)
        
    }
}

struct ChartwellRingRenderer {
    private var font: NSFont
    private var data: ChartwellRingData
    
    init(data: ChartwellRingData, pointSize: CGFloat) {
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
        renderingView.attributedStringValue = NSAttributedString(ringData: self.data, font: self.font)
        renderingView.editable = false
        renderingView.sizeToFit()
        let PDF = renderingView.dataWithPDFInsideRect(renderingView.bounds)
        let PDFImage = NSImage(data: PDF)!
        return PDFImage
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