//
//  ChartTestViewController.swift
//  SSChartwell
//
//  Created by Jeffrey Bergier on 11/10/15.
//  Copyright © 2015 Jeffrey Bergier. All rights reserved.
//

import Cocoa
import SSChartwell

class ChartTestViewController: NSViewController {
    
    @IBOutlet weak var imageStackView: NSStackView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Bars Vertical 
        
        let barComponents: [ChartDataComponentType] = [
            Chart.BarsVertical.Component(value: 20, color: NSColor.redColor().CGColor),
            Chart.BarsVertical.Component(value: 50, color: NSColor.blueColor().CGColor),
            Chart.BarsVertical.Component(value: 120, color: NSColor.blueColor().CGColor),
            Chart.BarsVertical.Component(value: 100, color: NSColor.redColor().CGColor),
            Chart.BarsVertical.Component(value: 20, color: NSColor.yellowColor().CGColor),
            Chart.BarsVertical.Component(value: 32, color: NSColor.greenColor().CGColor),
            Chart.BarsVertical.Component(value: 75, color: NSColor.blackColor().CGColor),
            Chart.BarsVertical.Component(value: 89, color: NSColor.grayColor().CGColor),
            Chart.BarsVertical.Component(value: 45, color: NSColor.darkGrayColor().CGColor),
            Chart.BarsVertical.Component(value: 22, color: NSColor.lightGrayColor().CGColor),
            Chart.BarsVertical.Component(value: 12, color: NSColor.cyanColor().CGColor),
            Chart.BarsVertical.Component(value: 45, color: NSColor.magentaColor().CGColor),
            Chart.BarsVertical.Component(value: 55, color: NSColor.redColor().CGColor),
            Chart.BarsVertical.Component(value: 66, color: NSColor.blueColor().CGColor)
        ]
        var barsVertical = Chart.BarsVertical(components: barComponents)
        for component in barComponents {
            barsVertical.appendComponent(component)
        }
        for component in barComponents {
            barsVertical.appendComponent(component)
        }
        let barsVerticalRenderer = Chart.Renderer(data: barsVertical, fontSize: 100)
        let barsVerticalTIFFImage = barsVerticalRenderer.TIFFImage
        let barsVerticalImageView = NSImageView()
        barsVerticalImageView.image = barsVerticalTIFFImage
        
        self.imageStackView?.addView(barsVerticalImageView, inGravity: .Bottom)
        
        // MARK: Pies
        
        let pieComponents: [ChartDataComponentType] = [
            Chart.Pies.Component(value: 2, color: NSColor.redColor().CGColor),
            Chart.Pies.Component(value: 3, color: NSColor.blueColor().CGColor),
            Chart.Pies.Component(value: 5, color: NSColor.blueColor().CGColor),
            Chart.Pies.Component(value: 10, color: NSColor.redColor().CGColor),
            Chart.Pies.Component(value: 5, color: NSColor.yellowColor().CGColor),
            Chart.Pies.Component(value: 10, color: NSColor.greenColor().CGColor),
            Chart.Pies.Component(value: 7, color: NSColor.blackColor().CGColor),
            Chart.Pies.Component(value: 5, color: NSColor.grayColor().CGColor),
            Chart.Pies.Component(value: 10, color: NSColor.darkGrayColor().CGColor),
            Chart.Pies.Component(value: 5, color: NSColor.lightGrayColor().CGColor),
            Chart.Pies.Component(value: 5, color: NSColor.cyanColor().CGColor),
            Chart.Pies.Component(value: 5, color: NSColor.magentaColor().CGColor),
            Chart.Pies.Component(value: 5, color: NSColor.redColor().CGColor),
            Chart.Pies.Component(value: 5, color: NSColor.blueColor().CGColor),
            Chart.Pies.Component(value: 5, color: NSColor.redColor().CGColor),
        ]
        var pies = Chart.Pies(components: pieComponents)
        for component in pieComponents {
            pies.appendComponent(component)
        }
        let piesRenderer = Chart.Renderer(data: pies, fontSize: 100)
        let piesTIFFImage = piesRenderer.TIFFImage
        let piesImageView = NSImageView()
        piesImageView.image = piesTIFFImage
        
        self.imageStackView?.addView(piesImageView, inGravity: .Bottom)
        
        // MARK: Rings
        
        let ringComponents: [ChartDataComponentType] = [
            Chart.Rings.Component(value: 10, color: NSColor.redColor().CGColor),
            Chart.Rings.Component(value: 20, color: NSColor.blueColor().CGColor),
            Chart.Rings.Component(value: 310, color: NSColor.yellowColor().CGColor),
            Chart.Rings.Component(value: 40, color: NSColor.greenColor().CGColor),
            Chart.Rings.Component(value: 50, color: NSColor.blackColor().CGColor),
            Chart.Rings.Component(value: 60, color: NSColor.grayColor().CGColor),
            Chart.Rings.Component(value: 70, color: NSColor.darkGrayColor().CGColor),
            Chart.Rings.Component(value: 80, color: NSColor.lightGrayColor().CGColor),
            Chart.Rings.Component(value: 90, color: NSColor.cyanColor().CGColor),
            Chart.Rings.Component(value: 100, color: NSColor.magentaColor().CGColor),
            Chart.Rings.Component(value: 55, color: NSColor.redColor().CGColor),
            Chart.Rings.Component(value: 66, color: NSColor.blueColor().CGColor),
            Chart.Rings.Component(value: 150, color: NSColor.blackColor().CGColor),
            Chart.Rings.Component(value: 89, color: NSColor.grayColor().CGColor),
            Chart.Rings.Component(value: 170, color: NSColor.darkGrayColor().CGColor),
            Chart.Rings.Component(value: 22, color: NSColor.lightGrayColor().CGColor),
            Chart.Rings.Component(value: 12, color: NSColor.cyanColor().CGColor),
            Chart.Rings.Component(value: 45, color: NSColor.magentaColor().CGColor),
            Chart.Rings.Component(value: 55, color: NSColor.redColor().CGColor),
            Chart.Rings.Component(value: 66, color: NSColor.blueColor().CGColor)
        ]
        var rings = Chart.Rings(components: ringComponents)
        for component in ringComponents {
            let _ = rings.appendComponent(component)
        }
        let ringsRenderer = Chart.Renderer(data: rings, fontSize: 300)
        let ringsTIFFImage = ringsRenderer.TIFFImage
        let ringsImageView = NSImageView()
        ringsImageView.image = ringsTIFFImage
        
        self.imageStackView?.addView(ringsImageView, inGravity: .Bottom)
    }
}
