//
//  Pies.swift
//  SSChartwell
//
//  Created by Jeffrey Bergier on 11/17/15.
//
//  Copyright © 2015 Jeffrey Bergier.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//
//

import CoreGraphics
import Foundation

// MARK: Pies

public extension Chart {
    public struct Pies: ChartSumDataType {
        public static let fontName: String = "Chartwell Pies"
        public static let fontFileName: String = "ChartwellPies"
        public static let max: UInt? = 100
        public static let style: Chart.Style = Chart.Style.Pies
        public static let componentType: ChartDataComponentType.Type = Chart.Pies.Component.self
        public var components: [ChartDataComponentType] = []
        
        // WORKAROUND FOR SWIFT PROTOCOL EXTENSION
        // ISSUES WITH INITIALIZERS
        public init() { }
        // END WORKAROUND
    }
}

public extension Chart.Pies {
    public struct Component: ChartDataComponentType {
        public static var max: UInt? = 100
        public var value: UInt = 0
        public var color: CGColor!
        
        // WORKAROUND FOR SWIFT PROTOCOL EXTENSION
        // ISSUES WITH INITIALIZERS
        public init() { }
        // END WORKAROUND
    }
}

// MARK: Rings

public extension Chart {
    public struct Rings: ChartDataType {
        public static let fontName: String = "Chartwell Rings"
        public static let fontFileName: String = "ChartwellRings"
        public static let max: UInt? = 10
        public static let style: Chart.Style = Chart.Style.Rings
        public static let componentType: ChartDataComponentType.Type = Chart.Rings.Component.self
        public var components: [ChartDataComponentType] = []
        
        // WORKAROUND FOR SWIFT PROTOCOL EXTENSION
        // ISSUES WITH INITIALIZERS
        public init() { }
        // END WORKAROUND
    }
}

public extension Chart.Rings {
    public struct Component: ChartDataComponentType {
        public static var max: UInt? = 100
        public var value: UInt = 0
        public var color: CGColor!
        
        // WORKAROUND FOR SWIFT PROTOCOL EXTENSION
        // ISSUES WITH INITIALIZERS
        public init() { }
        // END WORKAROUND
    }
}

// MARK: Bars Horizontal

public extension Chart {
    public struct Bars: ChartDataType {
        public static let fontName: String = "Chartwell Bars"
        public static let fontFileName: String = "ChartwellBars"
        public static let max: UInt? = .None
        public static let style: Chart.Style = Chart.Style.Bars
        public static let componentType: ChartDataComponentType.Type = Chart.Bars.Component.self
        public var components: [ChartDataComponentType] = []
        
        // WORKAROUND FOR SWIFT PROTOCOL EXTENSION
        // ISSUES WITH INITIALIZERS
        public init() { }
        // END WORKAROUND
    }
}

public extension Chart.Bars {
    public struct Component: ChartDataComponentType {
        public static var max: UInt? = 1000
        public var value: UInt = 0
        public var color: CGColor!
        
        // WORKAROUND FOR SWIFT PROTOCOL EXTENSION
        // ISSUES WITH INITIALIZERS
        public init() { }
        // END WORKAROUND
    }
}

// MARK: Rose

public extension Chart {
    public struct Rose: ChartDataType {
        public static let fontName: String = "Chartwell Rose"
        public static let fontFileName: String = "ChartwellRose"
        public static let max: UInt? = 30
        public static let style: Chart.Style = Chart.Style.Rose
        public static let componentType: ChartDataComponentType.Type = Chart.Rose.Component.self
        public var components: [ChartDataComponentType] = []
        
        // WORKAROUND FOR SWIFT PROTOCOL EXTENSION
        // ISSUES WITH INITIALIZERS
        public init() { }
        // END WORKAROUND
    }
}

public extension Chart.Rose {
    public struct Component: ChartDataComponentType {
        public static var max: UInt? = 100
        public var value: UInt = 0
        public var color: CGColor!
        
        // WORKAROUND FOR SWIFT PROTOCOL EXTENSION
        // ISSUES WITH INITIALIZERS
        public init() { }
        // END WORKAROUND
    }
}

// MARK: Lines

public extension Chart {
    public struct Lines: ChartDataType {
        public static let fontName: String = "Chartwell Lines"
        public static let fontFileName: String = "ChartwellLines"
        public static let max: UInt? = .None
        public static let style: Chart.Style = Chart.Style.Lines
        public static let componentType: ChartDataComponentType.Type = Chart.Lines.Component.self
        public var components: [ChartDataComponentType] = []
        
        // WORKAROUND FOR SWIFT PROTOCOL EXTENSION
        // ISSUES WITH INITIALIZERS
        public init() { }
        // END WORKAROUND
    }
}

public extension Chart.Lines {
    public struct Component: ChartDataComponentType {
        public static var max: UInt? = 100
        public var value: UInt = 0
        public var color: CGColor!
        
        // WORKAROUND FOR SWIFT PROTOCOL EXTENSION
        // ISSUES WITH INITIALIZERS
        public init() { }
        // END WORKAROUND
    }
}


// MARK: Bars Vertical

public extension Chart {
    public struct BarsVertical: ChartDataType {
        public static let fontName: String = "Chartwell Bars Vertical"
        public static let fontFileName: String = "ChartwellBarsVertical"
        public static let max: UInt? = .None
        public static let style: Chart.Style = Chart.Style.BarsVertical
        public static let componentType: ChartDataComponentType.Type = Chart.BarsVertical.Component.self
        public var components: [ChartDataComponentType] = []
        
        // WORKAROUND FOR SWIFT PROTOCOL EXTENSION
        // ISSUES WITH INITIALIZERS
        public init() { }
        // END WORKAROUND
    }
}

public extension Chart.BarsVertical {
    public struct Component: ChartDataComponentType {
        public static var max: UInt? = 100
        public var value: UInt = 0
        public var color: CGColor!

        // WORKAROUND FOR SWIFT PROTOCOL EXTENSION
        // ISSUES WITH INITIALIZERS
        public init() { }
        // END WORKAROUND
    }
}

// MARK: Radar

public extension Chart {
    public struct Radar: ChartDataType {
        public static let fontName: String = "Chartwell Radar"
        public static let fontFileName: String = "ChartwellRadar"
        public static let max: UInt? = 10
        public static let style: Chart.Style = Chart.Style.Radar
        public static let componentType: ChartDataComponentType.Type = Chart.Radar.Component.self
        public var components: [ChartDataComponentType] = []
        
        // WORKAROUND FOR SWIFT PROTOCOL EXTENSION
        // ISSUES WITH INITIALIZERS
        public init() { }
        // END WORKAROUND
    }
}

public extension Chart.Radar {
    public struct Component: ChartDataComponentType {
        public static var max: UInt? = 100
        public var value: UInt = 0
        public var color: CGColor!
        
        // WORKAROUND FOR SWIFT PROTOCOL EXTENSION
        // ISSUES WITH INITIALIZERS
        public init() { }
        // END WORKAROUND
    }
}

// MARK: Possible Chart Styles

public struct Chart {
    public enum Style: RawRepresentable {
        case Bars, BarsVertical, Lines, Pies, Radar, Rings, Rose
        
        public var rawValue: ChartDataType.Type {
            switch self {
            case .Bars:
                return Chart.Bars.self
            case .BarsVertical:
                return Chart.BarsVertical.self
            case .Lines:
                return Chart.Lines.self
            case .Pies:
                return Chart.Pies.self
            case .Radar:
                return Chart.Radar.self
            case .Rings:
                return Chart.Rings.self
            case .Rose:
                return Chart.Rose.self
            }
        }
        
        public init?(rawValue: ChartDataType.Type) {
            self = rawValue.style
        }
    }
}


