//
//  MacChartProtocolExtensions.swift
//  SSChartwell
//
//  Created by Jeffrey Bergier on 11/22/15.
//  Copyright © 2015 Jeffrey Bergier. All rights reserved.
//

import Cocoa

public extension ChartRendererType {
    public var TIFFImage: NSImage {
        let PDFImage = self.PDFImage
        let TIFF = PDFImage.TIFFRepresentation!
        let TIFFImage = NSImage(data: TIFF)!
        return TIFFImage
    }
    public var PDFImage: NSImage {
        let font = CTFont.chartwellFont(self.data, pointSize: self.fontSize)
        let attributedString = NSAttributedString(chartData: self.data, font: font)
        let renderingView = NSTextField()
        renderingView.attributedStringValue = attributedString
        renderingView.editable = false
        renderingView.sizeToFit()
        let PDF = renderingView.dataWithPDFInsideRect(renderingView.bounds)
        let PDFImage = NSImage(data: PDF)!
        return PDFImage
    }
}