//
//  SSChartwell.swift
//  SSChartwell
//
//  Created by Jeffrey Bergier on 11/17/15.
//  Copyright © 2015 Jeffrey Bergier. All rights reserved.
//

import CoreGraphics
import Foundation

public protocol ChartSumDataType: ChartDataType {}

public protocol ChartDataType {
    static var fontName: String { get }
    static var fontFileName: String { get }
    static var max: UInt? { get }
    static var style: Chart.Style { get }
    static var componentType: ChartDataComponentType.Type { get }
    var components: [ChartDataComponentType] { get set }
    init(components: [ChartDataComponentType])
    mutating func appendComponent(newComponent: ChartDataComponentType) -> Bool
    // WORKAROUND FOR SWIFT PROTOCOL EXTENSION
    // ISSUES WITH INITIALIZERS
    init()
    // END WORKAROUND
}

public protocol ChartDataComponentType {
    static var max: UInt? { get }
    var value: UInt { get set }
    var color: CGColor! { get set }
    init(value: UInt, color: CGColor)
    // WORKAROUND FOR SWIFT PROTOCOL EXTENSION
    // ISSUES WITH INITIALIZERS
    init()
    // END WORKAROUND
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