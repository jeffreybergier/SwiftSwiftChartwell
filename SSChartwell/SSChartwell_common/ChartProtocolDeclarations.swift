//
//  SSChartwell.swift
//  SSChartwell
//
//  Created by Jeffrey Bergier on 11/17/15.
//  Copyright © 2015 Jeffrey Bergier. All rights reserved.
//

import Foundation

public protocol ChartValueDataType: ChartDataType {}

public protocol ChartDataType {
    static var max: UInt? { get }
    static var fontName: String { get }
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