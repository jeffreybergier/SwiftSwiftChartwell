//
//  iOSChartProtocolDeclarations.swift
//  SSChartwell
//
//  Created by Jeffrey Bergier on 11/22/15.
//  Copyright © 2015 Jeffrey Bergier. All rights reserved.
//

import UIKit

public protocol ChartRendererType {
    var fontSize: CGFloat { get set }
    var data: ChartDataType! { get set }
    var image: UIImage { get }
    init(data: ChartDataType, fontSize: CGFloat)
    // WORKAROUND FOR SWIFT PROTOCOL EXTENSION
    // ISSUES WITH INITIALIZERS
    init()
    // END WORKAROUND
}