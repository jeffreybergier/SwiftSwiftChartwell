//
//  ChartTestViewController.swift
//  SSChartwell
//
//  Created by Jeffrey Bergier on 11/10/15.
//  Copyright © 2015 Jeffrey Bergier. All rights reserved.
//

import Cocoa

class ChartTestViewController: NSViewController {
    
    @IBOutlet weak var imageStackView: NSStackView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textArray = [10,30,50,70,40,80,90,100,10,20,30,40,50,60,70,80,90,100,10,30,50,70,40,80,90,100,10,20,30,40,50,60,70,80,90,100,10,30,50,70,40,80,90,100,10,20,30,40,50,60,70,80,90,100]
        
        let textTuple = [
            (value: 10, color: NSColor.redColor()),
            (value: 20, color: NSColor.yellowColor()),
            (value: 30, color: NSColor.greenColor()),
            (value: 40, color: NSColor.blueColor()),
            (value: 50, color: NSColor.grayColor()),
            (value: 60, color: NSColor.darkGrayColor()),
            (value: 70, color: NSColor.lightGrayColor()),
            (value: 80, color: NSColor.blueColor()),
            (value: 90, color: NSColor.brownColor()),
            (value: 100, color: NSColor.magentaColor()),
            (value: 10, color: NSColor.cyanColor()),
            (value: 20, color: NSColor.orangeColor()),
            (value: 30, color: NSColor.redColor()),
            (value: 40, color: NSColor.redColor()),
            (value: 50, color: NSColor.greenColor()),
            (value: 60, color: NSColor.grayColor()),
            (value: 70, color: NSColor.yellowColor()),
            (value: 80, color: NSColor.darkGrayColor()),
            (value: 90, color: NSColor.orangeColor()),
            (value: 100, color: NSColor.redColor()),
            (value: 10, color: NSColor.blueColor()),
            (value: 20, color: NSColor.greenColor()),
            (value: 30, color: NSColor.magentaColor()),
            (value: 40, color: NSColor.cyanColor()),
            (value: 50, color: NSColor.blueColor()),
            (value: 60, color: NSColor.redColor()),
            (value: 70, color: NSColor.blueColor()),
            (value: 80, color: NSColor.greenColor()),
            (value: 90, color: NSColor.magentaColor()),
            (value: 100, color: NSColor.cyanColor())
        ]
        
        let rendererArray = [
            ChartWellFontRenderer(style: .Bars, pointSize: 100),
            ChartWellFontRenderer(style: .BarsVertical, pointSize: 100),
            ChartWellFontRenderer(style: .Lines, pointSize: 100),
            ChartWellFontRenderer(style: .Pies, pointSize: 100),
            ChartWellFontRenderer(style: .Radar, pointSize: 100),
            ChartWellFontRenderer(style: .Rings, pointSize: 200),
            ChartWellFontRenderer(style: .Rose, pointSize: 100)
        ]
        
        let chartImageArray = rendererArray.map() { font -> PDFData in
            return font.chartImageFromIntegerArray(textArray, chartColor: NSColor.blueColor())
        }
        
        let chartColoredArray = rendererArray.map() { font -> PDFData in
            return font.chartImageFromTuple(textTuple)
        }
        
        // MARK: For some reason native views only show in the stackview if there are also imageviews
        
        for (_, data) in chartColoredArray.enumerate() {
            let imageView = NSImageView()
            imageView.image = NSImage(data: data)
            self.imageStackView?.addView(imageView, inGravity: .Bottom)
        }
        
        for (_, data) in chartImageArray.enumerate() {
            let imageView = NSImageView()
            imageView.image = NSImage(data: data)
            self.imageStackView?.addView(imageView, inGravity: .Bottom)
        }
        
        // MARK: For Future
        
        for colorRenderer in rendererArray {
            let newView = colorRenderer.chartViewFromTuple(textTuple)
            self.imageStackView?.addView(newView, inGravity: .Bottom)
        }
        
        for bwRenderer in rendererArray {
            let newView = bwRenderer.chartViewFromIntegerArray(textArray, chartColor: NSColor.redColor())
            self.imageStackView?.addView(newView, inGravity: .Bottom)
        }
        
    }
    
}
