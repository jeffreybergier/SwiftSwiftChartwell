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
        
        let barComponents = [
            Chart.BarsVertical.Component(value: 20, color: NSColor.redColor()),
            Chart.BarsVertical.Component(value: 50, color: NSColor.blueColor())
        ]
        let barsVertical = 
        
        let ringsComponents = [
            Chart.Rings.Component(size: 120, color: NSColor.blueColor()),
            Chart.Rings.Component(size: 100, color: NSColor.redColor()),
            Chart.Rings.Component(size: 20, color: NSColor.yellowColor()),
            Chart.Rings.Component(size: 32, color: NSColor.greenColor()),
            Chart.Rings.Component(size: 75, color: NSColor.blackColor()),
            Chart.Rings.Component(size: 89, color: NSColor.grayColor()),
            Chart.Rings.Component(size: 45, color: NSColor.darkGrayColor()),
            Chart.Rings.Component(size: 22, color: NSColor.lightGrayColor()),
            Chart.Rings.Component(size: 12, color: NSColor.cyanColor()),
            Chart.Rings.Component(size: 45, color: NSColor.magentaColor()),
            Chart.Rings.Component(size: 55, color: NSColor.redColor()),
            Chart.Rings.Component(size: 66, color: NSColor.blueColor())

        ]
        let rings = Chart.Rings(components: ringsComponents)
        
        let ringRenderer = Chart.Rings.Renderer(data: rings, pointSize: 100)
        let ringTIFF = ringRenderer.TIFFImage
        let ringImageView = NSImageView()
        ringImageView.image = ringTIFF
        self.imageStackView?.insertView(ringImageView, atIndex: 0, inGravity: .Top)
        
        let pieComponents = [
            Chart.Pie.Component(percentage: 5, color: NSColor.blueColor()),
            Chart.Pie.Component(percentage: 10, color: NSColor.redColor()),
            Chart.Pie.Component(percentage: 20, color: NSColor.yellowColor()),
            Chart.Pie.Component(percentage: 5, color: NSColor.greenColor()),
            Chart.Pie.Component(percentage: 11, color: NSColor.blackColor()),
            Chart.Pie.Component(percentage: 2, color: NSColor.grayColor()),
            Chart.Pie.Component(percentage: 2, color: NSColor.darkGrayColor()),
            Chart.Pie.Component(percentage: 3, color: NSColor.lightGrayColor()),
            Chart.Pie.Component(percentage: 15, color: NSColor.cyanColor()),
            Chart.Pie.Component(percentage: 7, color: NSColor.magentaColor()),
            Chart.Pie.Component(percentage: 8, color: NSColor.yellowColor()),
            Chart.Pie.Component(percentage: 9, color: NSColor.orangeColor()),
            Chart.Pie.Component(percentage: 8, color: NSColor.yellowColor()),
            Chart.Pie.Component(percentage: 9, color: NSColor.orangeColor())
        ]
        let pie = Chart.Pie(components: pieComponents)

        
        let pieRenderer = Chart.Pie.Renderer(data: pie, pointSize: 100)
        let pieTIFF = pieRenderer.TIFFImage
        let pieImageView = NSImageView()
        pieImageView.image = pieTIFF
        self.imageStackView?.insertView(pieImageView, atIndex: 0, inGravity: .Top)

    }
}
