//
//  MacChartProtocolDeclarations.swift
//  SSChartwell
//
//  Created by Jeffrey Bergier on 11/22/15.
//  Copyright © 2015 Jeffrey Bergier. All rights reserved.
//

import Cocoa

public protocol ChartRendererType {
    var fontSize: CGFloat { get set }
    var data: ChartDataType! { get set }
    var TIFFImage: NSImage { get }
    var PDFImage: NSImage { get }
    init(data: ChartDataType, fontSize: CGFloat)
    // WORKAROUND FOR SWIFT PROTOCOL EXTENSION
    // ISSUES WITH INITIALIZERS
    init()
    // END WORKAROUND
}
