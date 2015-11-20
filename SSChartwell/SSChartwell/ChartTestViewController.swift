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
        
        let barComponents: [ChartDataComponentType] = [
            Chart.BarsVertical.Component(value: 20, color: NSColor.redColor()),
            Chart.BarsVertical.Component(value: 50, color: NSColor.blueColor()),
            Chart.BarsVertical.Component(value: 120, color: NSColor.blueColor()),
            Chart.BarsVertical.Component(value: 100, color: NSColor.redColor()),
            Chart.BarsVertical.Component(value: 20, color: NSColor.yellowColor()),
            Chart.BarsVertical.Component(value: 32, color: NSColor.greenColor()),
            Chart.BarsVertical.Component(value: 75, color: NSColor.blackColor()),
            Chart.BarsVertical.Component(value: 89, color: NSColor.grayColor()),
            Chart.BarsVertical.Component(value: 45, color: NSColor.darkGrayColor()),
            Chart.BarsVertical.Component(value: 22, color: NSColor.lightGrayColor()),
            Chart.BarsVertical.Component(value: 12, color: NSColor.cyanColor()),
            Chart.BarsVertical.Component(value: 45, color: NSColor.magentaColor()),
            Chart.BarsVertical.Component(value: 55, color: NSColor.redColor()),
            Chart.BarsVertical.Component(value: 66, color: NSColor.blueColor())
        ]
        let barsVertical = Chart.BarsVertical(components: barComponents)
        let renderer = Chart.Renderer(data: barsVertical, fontSize: 100)
        let tiffImage = renderer.TIFFImage
        let imageView = NSImageView()
        imageView.image = tiffImage
        
        self.imageStackView?.addView(imageView, inGravity: .Top)
    }
}
