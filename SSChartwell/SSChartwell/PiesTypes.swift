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

extension Chart {
    struct Pies: ChartValueDataType {
        static var max: UInt? = 100
        static var fontName: String = "Chartwell Pies"
        var components: [ChartDataComponentType] = []
        
        // WORKAROUND FOR SWIFT PROTOCOL EXTENSION
        // ISSUES WITH INITIALIZERS
        init() { }
        // END WORKAROUND
    }
}

extension Chart.Pies {
    struct Component: ChartDataComponentType {
        static var max: UInt? = 100
        var value: UInt = 0
        var color: CGColor!
        
        // WORKAROUND FOR SWIFT PROTOCOL EXTENSION
        // ISSUES WITH INITIALIZERS
        init() { }
        // END WORKAROUND
    }
}

// MARK: Rings

extension Chart {
    struct Rings: ChartDataType {
        static var max: UInt? = 10
        static var fontName: String = "Chartwell Rings"
        var components: [ChartDataComponentType] = []
        
        // WORKAROUND FOR SWIFT PROTOCOL EXTENSION
        // ISSUES WITH INITIALIZERS
        init() { }
        // END WORKAROUND
    }
}

extension Chart.Rings {
    struct Component: ChartDataComponentType {
        static var max: UInt? = 100
        var value: UInt = 0
        var color: CGColor!
        
        // WORKAROUND FOR SWIFT PROTOCOL EXTENSION
        // ISSUES WITH INITIALIZERS
        init() { }
        // END WORKAROUND
    }
}

// MARK: Bars Vertical

extension Chart {
    struct BarsVertical: ChartDataType {
        static var max: UInt? = .None
        static var fontName: String = "Chartwell Bars Vertical"
        var components: [ChartDataComponentType] = []
        
        // WORKAROUND FOR SWIFT PROTOCOL EXTENSION
        // ISSUES WITH INITIALIZERS
        init() { }
        // END WORKAROUND
    }
}

extension Chart.BarsVertical {
    struct Component: ChartDataComponentType {
        static var max: UInt? = 100
        var value: UInt = 0
        var color: CGColor!

        // WORKAROUND FOR SWIFT PROTOCOL EXTENSION
        // ISSUES WITH INITIALIZERS
        init() { }
        // END WORKAROUND
    }
}

// MARK: Generic Chart

struct Chart { }

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


