//
//  Pies.swift
//  SSChartwell
//
//  Created by Jeffrey Bergier on 11/17/15.
//  Copyright © 2015 Jeffrey Bergier. All rights reserved.
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

// MARK: Generic Chart

public struct Chart {
    public enum Style: RawRepresentable {
        case Bars, BarsVertical, Lines, Pies, Radar, Rings, Rose
        
        public var rawValue: ChartDataType.Type {
            switch self {
            case .Bars:
                return Chart.BarsVertical.self
            case .BarsVertical:
                return Chart.BarsVertical.self
            case .Lines:
                return Chart.BarsVertical.self
            case .Pies:
                return Chart.Pies.self
            case .Radar:
                return Chart.BarsVertical.self
            case .Rings:
                return Chart.Rings.self
            case .Rose:
                return Chart.Rose.self
            }
        }
        
        public init?(rawValue: ChartDataType.Type) {
            self = rawValue.style
        }
        
//        public var fontName: String {
//            switch self {
//            case .Bars:
//                return "Chartwell Bars"
//            case .BarsVertical:
//                return "Chartwell Bars Vertical"
//            case .Lines:
//                return "Chartwell Lines"
//            case .Pies:
//                return "Chartwell Pies"
//            case .Radar:
//                return "Chartwell Radar"
//            case .Rings:
//                return "Chartwell Rings"
//            case .Rose:
//                return "Chartwell Rose"
//            }
//        }
//        
//        public var fontFileName: String {
//            switch self {
//            case .Bars:
//                return "ChartwellBars"
//            case .BarsVertical:
//                return "ChartwellBarsVertical"
//            case .Lines:
//                return "ChartwellLines"
//            case .Pies:
//                return "ChartwellPies"
//            case .Radar:
//                return "ChartwellRadar"
//            case .Rings:
//                return "ChartwellRings"
//            case .Rose:
//                return "ChartwellRose"
//            }
//        }
    }
}

public extension Chart {
    public struct Renderer: ChartRendererType {
        public var data: ChartDataType!
        public var fontSize: CGFloat = 0
        
        // WORKAROUND FOR SWIFT PROTOCOL EXTENSION
        // ISSUES WITH INITIALIZERS
        public init() { }
        // END WORKAROUND
    }
}


