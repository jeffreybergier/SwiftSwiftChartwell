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
        
        // MARK: Bars Vertical 
        
//        let barComponents: [ChartDataComponentType] = [
//            Chart.BarsVertical.Component(value: 20, color: NSColor.redColor()),
//            Chart.BarsVertical.Component(value: 50, color: NSColor.blueColor()),
//            Chart.BarsVertical.Component(value: 120, color: NSColor.blueColor()),
//            Chart.BarsVertical.Component(value: 100, color: NSColor.redColor()),
//            Chart.BarsVertical.Component(value: 20, color: NSColor.yellowColor()),
//            Chart.BarsVertical.Component(value: 32, color: NSColor.greenColor()),
//            Chart.BarsVertical.Component(value: 75, color: NSColor.blackColor()),
//            Chart.BarsVertical.Component(value: 89, color: NSColor.grayColor()),
//            Chart.BarsVertical.Component(value: 45, color: NSColor.darkGrayColor()),
//            Chart.BarsVertical.Component(value: 22, color: NSColor.lightGrayColor()),
//            Chart.BarsVertical.Component(value: 12, color: NSColor.cyanColor()),
//            Chart.BarsVertical.Component(value: 45, color: NSColor.magentaColor()),
//            Chart.BarsVertical.Component(value: 55, color: NSColor.redColor()),
//            Chart.BarsVertical.Component(value: 66, color: NSColor.blueColor())
//        ]
//        let barsVertical = Chart.BarsVertical(components: barComponents)
//        let barsVerticalRenderer = Chart.Renderer(data: barsVertical, fontSize: 100)
//        let barsVerticalTIFFImage = barsVerticalRenderer.TIFFImage
//        let barsVerticalImageView = NSImageView()
//        barsVerticalImageView.image = barsVerticalTIFFImage
//        
//        self.imageStackView?.addView(barsVerticalImageView, inGravity: .Bottom)
        
        // MARK: Pies
        
//        let pieComponents: [ChartDataComponentType] = [
//            Chart.Pies.Component(value: 20, color: NSColor.redColor()),
//            Chart.Pies.Component(value: 50, color: NSColor.blueColor()),
//            Chart.Pies.Component(value: 120, color: NSColor.blueColor()),
//            Chart.Pies.Component(value: 100, color: NSColor.redColor()),
//            Chart.Pies.Component(value: 20, color: NSColor.yellowColor()),
//            Chart.Pies.Component(value: 32, color: NSColor.greenColor()),
//            Chart.Pies.Component(value: 75, color: NSColor.blackColor()),
//            Chart.Pies.Component(value: 89, color: NSColor.grayColor()),
//            Chart.Pies.Component(value: 45, color: NSColor.darkGrayColor()),
//            Chart.Pies.Component(value: 22, color: NSColor.lightGrayColor()),
//            Chart.Pies.Component(value: 12, color: NSColor.cyanColor()),
//            Chart.Pies.Component(value: 45, color: NSColor.magentaColor()),
//            Chart.Pies.Component(value: 55, color: NSColor.redColor()),
//            Chart.Pies.Component(value: 66, color: NSColor.blueColor())
//        ]
//        let pies = Chart.Pies(components: pieComponents)
//        let piesRenderer = Chart.Renderer(data: pies, fontSize: 100)
//        let piesTIFFImage = piesRenderer.TIFFImage
//        let piesImageView = NSImageView()
//        piesImageView.image = piesTIFFImage
//        
//        self.imageStackView?.addView(piesImageView, inGravity: .Bottom)
        
        // MARK: Rings
        
        let ringComponents: [ChartDataComponentType] = [
            Chart.Rings.Component(value: 10, color: NSColor.redColor()),
            Chart.Rings.Component(value: 20, color: NSColor.blueColor()),
            Chart.Rings.Component(value: 30, color: NSColor.yellowColor()),
            Chart.Rings.Component(value: 40, color: NSColor.greenColor()),
            Chart.Rings.Component(value: 50, color: NSColor.blackColor()),
            Chart.Rings.Component(value: 60, color: NSColor.grayColor()),
            Chart.Rings.Component(value: 70, color: NSColor.darkGrayColor()),
            Chart.Rings.Component(value: 80, color: NSColor.lightGrayColor()),
            Chart.Rings.Component(value: 90, color: NSColor.cyanColor()),
            Chart.Rings.Component(value: 100, color: NSColor.magentaColor()),
            Chart.Rings.Component(value: 55, color: NSColor.redColor()),
            Chart.Rings.Component(value: 66, color: NSColor.blueColor()),
//            Chart.Rings.Component(value: 75, color: NSColor.blackColor()),
//            Chart.Rings.Component(value: 89, color: NSColor.grayColor()),
//            Chart.Rings.Component(value: 45, color: NSColor.darkGrayColor()),
//            Chart.Rings.Component(value: 22, color: NSColor.lightGrayColor()),
//            Chart.Rings.Component(value: 12, color: NSColor.cyanColor()),
//            Chart.Rings.Component(value: 45, color: NSColor.magentaColor()),
//            Chart.Rings.Component(value: 55, color: NSColor.redColor()),
//            Chart.Rings.Component(value: 66, color: NSColor.blueColor())
        ]
        let rings = Chart.Rings(components: ringComponents)
        let ringsRenderer = Chart.Renderer(data: rings, fontSize: 300)
        let ringsTIFFImage = ringsRenderer.TIFFImage
        let ringsImageView = NSImageView()
        ringsImageView.image = ringsTIFFImage
        
        self.imageStackView?.addView(ringsImageView, inGravity: .Bottom)
    }
}
