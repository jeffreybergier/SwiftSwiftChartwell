//
//  MacChartProtocolExtensions.swift
//  SSChartwell
//
//  Created by Jeffrey Bergier on 11/22/15.
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
        renderingView.backgroundColor = NSColor.whiteColor().colorWithAlphaComponent(0)
        renderingView.attributedStringValue = attributedString
        renderingView.editable = false
        renderingView.sizeToFit()
        let PDF = renderingView.dataWithPDFInsideRect(renderingView.bounds)
        let PDFImage = NSImage(data: PDF)!
        return PDFImage
    }
}