//
//  SSChartwell.swift
//  SSChartwell
//
//  Created by Jeffrey Bergier on 11/17/15.
//  Copyright © 2015 Jeffrey Bergier. All rights reserved.
//

import Cocoa

enum ZeroOneHundredInt: Int, CustomStringConvertible {
    case Zero = 0, One, Two, Three, Four, Five, Size, Seven, Eight, Nine, Ten, Eleven, Twelve, Thirteen, Fourteen, Fifteen, Sixteen, Seventeen, Eighteen, Nineteen, Twenty, TwentyOne, TwentyTwo, TwentyThree, TwentyFour, TwentyFive, TwentySix, TwentySeven, TwentyEight, TwentyNine, Thirty, ThirtyOne, ThirtyTwo, ThirtyThree, ThirtyFour, ThirtyFive, ThirtySix, ThirtySeven, ThirtyEight, ThirtyNine, Forty, FortyOne, FortyTwo, FortyThree, Fortyfour, FortyFive, FortySix, FortySeven, FortyEight, FortyNine, Fifty, FiftyOne, FiftyTwo, FiftyThree, FiftyFour, FiftyFive, FiftySix, FiftySeven, FiftyEight, FiftyNine, Sixty, SixtyOne, SixtyTwo, SixtyThree, SixtyFour, SixtyFive, SixtySix, SixtySeven, SixtyEight, SixtyNine, Seventy, SeventyOne, SeventyTwo, SeventyThree, SeventyFour, SeventyFive, SeventySix, SeventySeven, SeventyEight, SeventyNine, Eighty, EightyOne, EightyTwo, EightyThree, EightyFour, EightyFive, EightySix, EightySeven, EightyEight, EightyNine, Ninety, NinetyOne, NinetyTwo, NinetyThree, NinetyFour, NinetyFive, NinetySix, NinetySeven, NinetyEight, NinetyNine, OneHundred
    
    var description: String {
        return "\(self.rawValue)"
    }
}

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

extension NSFont {
    class func chartwellFontOfStyle(chartwell: Chart.Style, pointSize: CGFloat) -> NSFont {
        let rawFont = NSFont(name: chartwell.fontName, size: pointSize)
        let rawFontDescriptor = CTFontCopyFontDescriptor(rawFont!)
        let mutableRawFontDescriptor = CTFontDescriptorCreateCopyWithFeature(rawFontDescriptor,
            NSNumber(int: 35), // Number Case
            NSNumber(int: 2)) // Lining Figures
        let adjustedFont = CTFontCreateWithFontDescriptor(mutableRawFontDescriptor, pointSize, nil)
        return adjustedFont
    }
}