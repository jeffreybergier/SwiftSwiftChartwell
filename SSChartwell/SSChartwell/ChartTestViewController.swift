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
        
        var data = Chart.Ring.Components()
        data.ring1 = Chart.Ring.Component(size: .Ten, color: NSColor.blueColor())
        data.ring2 = Chart.Ring.Component(size: .Twenty, color: NSColor.redColor())
        data.ring3 = Chart.Ring.Component(size: .Thirty, color: NSColor.yellowColor())
        data.ring4 = Chart.Ring.Component(size: .Forty, color: NSColor.greenColor())
        data.ring5 = Chart.Ring.Component(size: .Fifty, color: NSColor.blackColor())
        data.ring6 = Chart.Ring.Component(size: .Sixty, color: NSColor.grayColor())
        data.ring7 = Chart.Ring.Component(size: .Seventy, color: NSColor.darkGrayColor())
        data.ring8 = Chart.Ring.Component(size: .Eighty, color: NSColor.lightGrayColor())
        data.ring9 = Chart.Ring.Component(size: .Ninety, color: NSColor.cyanColor())
        data.ring10 = Chart.Ring.Component(size: .OneHundred, color: NSColor.magentaColor())

        let renderer = Chart.Ring.Renderer(data: data, pointSize: 100)
        let tiff = renderer.TIFFImage
        let imageView = NSImageView()
        imageView.image = tiff
        self.imageStackView?.insertView(imageView, atIndex: 0, inGravity: .Top)
    }
}
