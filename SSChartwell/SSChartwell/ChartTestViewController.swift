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
        
        let ringsComponents = [
            Chart.Rings.Component(size: .Ten, color: NSColor.blueColor()),
            Chart.Rings.Component(size: .Twenty, color: NSColor.redColor()),
            Chart.Rings.Component(size: .Thirty, color: NSColor.yellowColor()),
            Chart.Rings.Component(size: .Forty, color: NSColor.greenColor()),
            Chart.Rings.Component(size: .Fifty, color: NSColor.blackColor()),
            Chart.Rings.Component(size: .Sixty, color: NSColor.grayColor()),
            Chart.Rings.Component(size: .Seventy, color: NSColor.darkGrayColor()),
            Chart.Rings.Component(size: .Eighty, color: NSColor.lightGrayColor()),
            Chart.Rings.Component(size: .Ninety, color: NSColor.cyanColor()),
            Chart.Rings.Component(size: .OneHundred, color: NSColor.magentaColor()),
            Chart.Rings.Component(size: .OneHundred, color: NSColor.redColor()),
            Chart.Rings.Component(size: .OneHundred, color: NSColor.blueColor())

        ]
        let rings = Chart.Rings(components: ringsComponents)
        
        let ringRenderer = Chart.Rings.Renderer(data: rings, pointSize: 100)
        let ringTIFF = ringRenderer.TIFFImage
        let ringImageView = NSImageView()
        ringImageView.image = ringTIFF
        self.imageStackView?.insertView(ringImageView, atIndex: 0, inGravity: .Top)
        
        let pieComponents = [
            Chart.Pie.Component(percentage: .Five, color: NSColor.blueColor()),
            Chart.Pie.Component(percentage: .Ten, color: NSColor.redColor()),
            Chart.Pie.Component(percentage: .Twenty, color: NSColor.yellowColor()),
            Chart.Pie.Component(percentage: .Five, color: NSColor.greenColor()),
            Chart.Pie.Component(percentage: .Eleven, color: NSColor.blackColor()),
            Chart.Pie.Component(percentage: .Two, color: NSColor.grayColor()),
            Chart.Pie.Component(percentage: .Two, color: NSColor.darkGrayColor()),
            Chart.Pie.Component(percentage: .Three, color: NSColor.lightGrayColor()),
            Chart.Pie.Component(percentage: .Fifteen, color: NSColor.cyanColor()),
            Chart.Pie.Component(percentage: .Seven, color: NSColor.magentaColor()),
            Chart.Pie.Component(percentage: .Eight, color: NSColor.yellowColor()),
            Chart.Pie.Component(percentage: .Nine, color: NSColor.orangeColor()),
            Chart.Pie.Component(percentage: .Eight, color: NSColor.yellowColor()),
            Chart.Pie.Component(percentage: .Nine, color: NSColor.orangeColor())
        ]
        let pie = Chart.Pie(components: pieComponents)

        
        let pieRenderer = Chart.Pie.Renderer(data: pie, pointSize: 100)
        let pieTIFF = pieRenderer.TIFFImage
        let pieImageView = NSImageView()
        pieImageView.image = pieTIFF
        self.imageStackView?.insertView(pieImageView, atIndex: 0, inGravity: .Top)

    }
}
