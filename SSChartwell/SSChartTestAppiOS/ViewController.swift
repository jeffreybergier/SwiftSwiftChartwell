//
//  ViewController.swift
//  SSChartTestAppiOS
//
//  Created by Jeffrey Bergier on 11/22/15.
//  Copyright © 2015 Jeffrey Bergier. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var chartStackView: UIStackView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // MARK: Bars Vertical
        
        let barComponents: [ChartDataComponentType] = [
            Chart.BarsVertical.Component(value: 20, color: UIColor.redColor().CGColor),
            Chart.BarsVertical.Component(value: 50, color: UIColor.blueColor().CGColor),
            Chart.BarsVertical.Component(value: 120, color: UIColor.blueColor().CGColor),
            Chart.BarsVertical.Component(value: 100, color: UIColor.redColor().CGColor),
            Chart.BarsVertical.Component(value: 20, color: UIColor.yellowColor().CGColor),
            Chart.BarsVertical.Component(value: 32, color: UIColor.greenColor().CGColor),
            Chart.BarsVertical.Component(value: 75, color: UIColor.blackColor().CGColor),
            Chart.BarsVertical.Component(value: 89, color: UIColor.grayColor().CGColor),
            Chart.BarsVertical.Component(value: 45, color: UIColor.darkGrayColor().CGColor),
            Chart.BarsVertical.Component(value: 22, color: UIColor.lightGrayColor().CGColor),
            Chart.BarsVertical.Component(value: 12, color: UIColor.cyanColor().CGColor),
            Chart.BarsVertical.Component(value: 45, color: UIColor.magentaColor().CGColor),
            Chart.BarsVertical.Component(value: 55, color: UIColor.redColor().CGColor),
            Chart.BarsVertical.Component(value: 66, color: UIColor.blueColor().CGColor)
        ]
        var barsVertical = Chart.BarsVertical(components: barComponents)
        for component in barComponents {
            barsVertical.appendComponent(component)
        }
        for component in barComponents {
            barsVertical.appendComponent(component)
        }
        let barsVerticalRenderer = Chart.Renderer(data: barsVertical, fontSize: 100)
        let barsVerticalTIFFImage = barsVerticalRenderer.image
        let barsVerticalImageView = UIImageView()
        barsVerticalImageView.contentMode = UIViewContentMode.Center
        barsVerticalImageView.image = barsVerticalTIFFImage
        
        self.chartStackView?.addArrangedSubview(barsVerticalImageView)
        
        // MARK: Pies
        
        let pieComponents: [ChartDataComponentType] = [
            Chart.Pies.Component(value: 2, color: UIColor.redColor().CGColor),
            Chart.Pies.Component(value: 3, color: UIColor.blueColor().CGColor),
            Chart.Pies.Component(value: 5, color: UIColor.blueColor().CGColor),
            Chart.Pies.Component(value: 10, color: UIColor.redColor().CGColor),
            Chart.Pies.Component(value: 5, color: UIColor.yellowColor().CGColor),
            Chart.Pies.Component(value: 10, color: UIColor.greenColor().CGColor),
            Chart.Pies.Component(value: 7, color: UIColor.blackColor().CGColor),
            Chart.Pies.Component(value: 5, color: UIColor.grayColor().CGColor),
            Chart.Pies.Component(value: 10, color: UIColor.darkGrayColor().CGColor),
            Chart.Pies.Component(value: 5, color: UIColor.lightGrayColor().CGColor),
            Chart.Pies.Component(value: 5, color: UIColor.cyanColor().CGColor),
            Chart.Pies.Component(value: 5, color: UIColor.magentaColor().CGColor),
            Chart.Pies.Component(value: 5, color: UIColor.redColor().CGColor),
            Chart.Pies.Component(value: 5, color: UIColor.blueColor().CGColor),
            Chart.Pies.Component(value: 5, color: UIColor.redColor().CGColor),
        ]
        var pies = Chart.Pies(components: pieComponents)
        for component in pieComponents {
            pies.appendComponent(component)
        }
        let piesRenderer = Chart.Renderer(data: pies, fontSize: 100)
        let piesTIFFImage = piesRenderer.image
        let piesImageView = UIImageView()
        piesImageView.contentMode = UIViewContentMode.Center
        piesImageView.image = piesTIFFImage
        
        self.chartStackView?.addArrangedSubview(piesImageView)
        
        // MARK: Rings
        
        let ringComponents: [ChartDataComponentType] = [
            Chart.Rings.Component(value: 10, color: UIColor.redColor().CGColor),
            Chart.Rings.Component(value: 20, color: UIColor.blueColor().CGColor),
            Chart.Rings.Component(value: 310, color: UIColor.yellowColor().CGColor),
            Chart.Rings.Component(value: 40, color: UIColor.greenColor().CGColor),
            Chart.Rings.Component(value: 50, color: UIColor.blackColor().CGColor),
            Chart.Rings.Component(value: 60, color: UIColor.grayColor().CGColor),
            Chart.Rings.Component(value: 70, color: UIColor.darkGrayColor().CGColor),
            Chart.Rings.Component(value: 80, color: UIColor.lightGrayColor().CGColor),
            Chart.Rings.Component(value: 90, color: UIColor.cyanColor().CGColor),
            Chart.Rings.Component(value: 100, color: UIColor.magentaColor().CGColor),
            Chart.Rings.Component(value: 55, color: UIColor.redColor().CGColor),
            Chart.Rings.Component(value: 66, color: UIColor.blueColor().CGColor),
            Chart.Rings.Component(value: 150, color: UIColor.blackColor().CGColor),
            Chart.Rings.Component(value: 89, color: UIColor.grayColor().CGColor),
            Chart.Rings.Component(value: 170, color: UIColor.darkGrayColor().CGColor),
            Chart.Rings.Component(value: 22, color: UIColor.lightGrayColor().CGColor),
            Chart.Rings.Component(value: 12, color: UIColor.cyanColor().CGColor),
            Chart.Rings.Component(value: 45, color: UIColor.magentaColor().CGColor),
            Chart.Rings.Component(value: 55, color: UIColor.redColor().CGColor),
            Chart.Rings.Component(value: 66, color: UIColor.blueColor().CGColor)
        ]
        var rings = Chart.Rings(components: ringComponents)
        for component in ringComponents {
            let _ = rings.appendComponent(component)
        }
        let ringsRenderer = Chart.Renderer(data: rings, fontSize: 300)
        let ringsTIFFImage = ringsRenderer.image
        let ringsImageView = UIImageView()
        ringsImageView.contentMode = UIViewContentMode.Center
        ringsImageView.image = ringsTIFFImage
        
        self.chartStackView?.addArrangedSubview(ringsImageView)
    }
}

