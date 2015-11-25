//
//  iOSChartProtocolExtensions.swift
//  SSChartwell
//
//  Created by Jeffrey Bergier on 11/22/15.
//  Copyright © 2015 Jeffrey Bergier. All rights reserved.
//

import UIKit

public extension ChartRendererType {
    public var image: UIImage? {
        let font = CTFont.chartwellFont(self.data, pointSize: self.fontSize)
        let attributedString = NSAttributedString(chartData: self.data, font: font)
        
        let renderingView = LabelSingleton.sharedLabel.labelForStyle(self.data?.dynamicType.style ?? Chart.Style.Bars)
        renderingView.attributedText = attributedString
        renderingView.sizeToFit()
        
        let image = self.CGImageFromView(renderingView)
        renderingView.attributedText = .None
        
        return image
    }
    
    public func generateAnimatedImagesWithFrameCount(frameCount: UInt, completionHandler: ([UIImage] -> Void)) {
        let myDataType = self.data?.dynamicType ?? Chart.BarsVertical.self
        if let _ = myDataType as? ChartSumDataType.Type {
            print("DETECTED CHARTSUMDATATYPE!!! \(myDataType)")
            completionHandler([])
        } else {
            let myComponents = self.data.components
            let myComponentType = myComponents.first?.dynamicType ?? Chart.BarsVertical.Component.self
            let myComponentTypeMax = Int(myComponentType.max ?? 100)
            
            let backgroundQueue = dispatch_get_global_queue(Int(QOS_CLASS_USER_INITIATED.rawValue), 0)
            dispatch_async(backgroundQueue) {
                var images = [UIImage]()
                for i in 0 ..< frameCount {
                    let newComponents = myComponents.map() { component -> ChartDataComponentType in
                        let adjustedI = Double(myComponentTypeMax) / Double(frameCount) * Double(i)
                        let math = Double(component.value) / Double(myComponentTypeMax) * adjustedI
                        let roundedMath = UInt(round(math))
                        return myComponentType.init(value: roundedMath, color: component.color)
                    }
                    let newData = myDataType.init(components: newComponents)
                    let newRenderer = self.dynamicType.init(data: newData, fontSize: self.fontSize)
                    if let newImage = newRenderer?.image {
                        images.append(newImage)
                    }
                }
                dispatch_async(dispatch_get_main_queue()) {
                    completionHandler(images)
                }
            }
        }
    }
    
    private func CGImageFromView(view: UIView) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0)
        defer { UIGraphicsEndImageContext() }
        if let currentContext = UIGraphicsGetCurrentContext() {
            view.layer.renderInContext(currentContext)
            return UIGraphicsGetImageFromCurrentImageContext()
        }
        return .None
    }
}

private class LabelSingleton {
    static let sharedLabel = LabelSingleton()
    
    private var barsLabel: UILabel?
    private var barsVerticalLabel: UILabel?
    private var linesLabel: UILabel?
    private var piesLabel: UILabel?
    private var radarLabel: UILabel?
    private var ringsLabel: UILabel?
    private var roseLabel: UILabel?
    
    private var resetTimer: NSTimer?

    @objc private func resetTimerFired(timer: NSTimer?) {
        timer?.invalidate()
        self.resetTimer?.invalidate()
        self.resetTimer = .None
        
        self.resetTimer = .None
        self.barsLabel = .None
        self.barsVerticalLabel = .None
        self.linesLabel = .None
        self.piesLabel = .None
        self.radarLabel = .None
        self.ringsLabel = .None
        self.roseLabel = .None
    }
    
    func labelForStyle(style: Chart.Style) -> UILabel {
        var existingLabel: UILabel?
        
        switch style {
        case .Bars:
            existingLabel = self.barsLabel
        case .BarsVertical:
            existingLabel = self.barsVerticalLabel
        case .Lines:
            existingLabel = self.linesLabel
        case .Pies:
            existingLabel = self.piesLabel
        case .Radar:
            existingLabel = self.radarLabel
        case .Rings:
            existingLabel = self.ringsLabel
        case .Rose:
            existingLabel = self.roseLabel
        }
        
        if existingLabel == .None {
            if self.resetTimer == .None {
                dispatch_async(dispatch_get_main_queue()) {
                    self.resetTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "resetTimerFired:", userInfo: .None, repeats: false)
                }
            }
            
            existingLabel = {
                let label = UILabel()
                label.backgroundColor = UIColor.whiteColor()
                label.lineBreakMode = NSLineBreakMode.ByClipping
                label.sizeToFit()
                return label
            }()
            
            switch style {
            case .Bars:
                self.barsLabel = existingLabel
            case .BarsVertical:
                self.barsVerticalLabel  = existingLabel
            case .Lines:
                self.linesLabel = existingLabel
            case .Pies:
                self.piesLabel = existingLabel
            case .Radar:
                self.radarLabel = existingLabel
            case .Rings:
                self.ringsLabel = existingLabel
            case .Rose:
                self.roseLabel = existingLabel
            }
        }
        
        return existingLabel!
    }
}