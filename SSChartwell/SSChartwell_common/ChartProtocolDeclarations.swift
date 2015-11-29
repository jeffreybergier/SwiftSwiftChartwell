//
//  SSChartwell.swift
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
    static func generateRandomData() -> [ChartDataComponentType]
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