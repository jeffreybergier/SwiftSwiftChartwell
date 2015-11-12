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
        
        var data = ChartwellRingData()
        data.ring1 = ChartwellRingValue(size: .Ten, color: NSColor.blueColor())
        data.ring2 = ChartwellRingValue(size: .Twenty, color: NSColor.redColor())
        data.ring3 = ChartwellRingValue(size: .Thirty, color: NSColor.yellowColor())
        data.ring4 = ChartwellRingValue(size: .Forty, color: NSColor.greenColor())
        data.ring5 = ChartwellRingValue(size: .Fifty, color: NSColor.blackColor())
        data.ring6 = ChartwellRingValue(size: .Sixty, color: NSColor.grayColor())
        data.ring7 = ChartwellRingValue(size: .Seventy, color: NSColor.darkGrayColor())
        data.ring8 = ChartwellRingValue(size: .Eighty, color: NSColor.lightGrayColor())
        data.ring9 = ChartwellRingValue(size: .Ninety, color: NSColor.cyanColor())
        data.ring10 = ChartwellRingValue(size: .OneHundred, color: NSColor.magentaColor())

        let renderer = ChartwellRingRenderer(data: data, pointSize: 100)
        let tiff = renderer.TIFFImage
        print(tiff)
    }
}
