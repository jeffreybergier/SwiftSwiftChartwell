//
//  Pies.swift
//  SSChartwell
//
//  Created by Jeffrey Bergier on 11/17/15.
//  Copyright © 2015 Jeffrey Bergier. All rights reserved.
//

import Cocoa

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
        var color: NSColor = NSColor.blackColor()
        
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
        var color: NSColor = NSColor.blackColor()
        
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
        var color: NSColor = NSColor.blackColor()

        // WORKAROUND FOR SWIFT PROTOCOL EXTENSION
        // ISSUES WITH INITIALIZERS
        init() { }
        // END WORKAROUND
    }
}

