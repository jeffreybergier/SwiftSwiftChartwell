import Cocoa



//: Extensions
extension NSFont {
    
    var coreFont: CTFont {
        return CTFontCreateWithName(self.fontName, self.pointSize, nil)
    }
    
    var alternativeStylisticSetIdentifier: Int {
        return 0
    }
    
    func containsAlternativeStylisticSets() -> Bool {
        let coreFont = CTFontCreateWithName(self.fontName, self.pointSize, nil)
        let features = NSArray(array: CTFontCopyFeatures(coreFont)!)
        
        let filteredArray = features.filter() { item -> Bool in
            guard let featureTypeSelectors = (item as? NSDictionary)?[kCTFontFeatureTypeSelectorsKey as NSString] as? NSArray else { return false }
            print(featureTypeSelectors)
            return true
        }
        
        for (index, item) in features.enumerate() {
            if let item = item as? NSDictionary,
                let featureTypeName =  item[kCTFontFeatureTypeNameKey as NSString] as? String,
                let featureTypeSelectors = item[kCTFontFeatureTypeSelectorsKey as NSString] as? NSArray {
                    print("\(index)) \(item)")
                    for item in featureTypeSelectors {
                        if let item = item as? NSDictionary,
                            let featureSelectorName = item[kCTFontFeatureSelectorNameKey as NSString] as? String {
                                print("\(featureSelectorName)")
                        }
                    }
            }
        }
        
        return false
    }
}

enum ChartwellStyle {
    case Bars
    case BarsVertical
    case Lines
    case Pies
    case Radar
    case Rings
    case Rose
    
    func fontOfSize(pointSize: CGFloat) -> NSFont! {
        switch self {
        case .Bars:
            return NSFont(name: "Chartwell Bars", size: pointSize)
        case .BarsVertical:
            return NSFont(name: "Chartwell Bars Vertical", size: pointSize)
        case .Lines:
            return NSFont(name: "Chartwell Lines", size: pointSize)
        case .Pies:
            return NSFont(name: "Chartwell Pies", size: pointSize)
        case .Radar:
            return NSFont(name: "Chartwell Radar", size: pointSize)
        case .Rings:
            return NSFont(name: "Chartwell Rings", size: pointSize)
        case .Rose:
            return NSFont(name: "Chartwell Rose", size: pointSize)
        }
    }
}

struct ChartWellFont {
    var font: NSFont
    var style: ChartwellStyle
    
    init(style: ChartwellStyle, pointSize: CGFloat) {
        let rawFont = style.fontOfSize(pointSize)
        let rawFontDescriptor = CTFontCopyFontDescriptor(rawFont)
        let mutableRawFontDescriptor = CTFontDescriptorCreateCopyWithFeature(rawFontDescriptor,
            NSNumber(int: 35), // Number Case
            NSNumber(int: 2)) // Lining Figures
        let adjustedFont = CTFontCreateWithFontDescriptor(mutableRawFontDescriptor, pointSize, nil)
        
        self.font = adjustedFont
        self.style = style
    }
    
    func chartImageFromString(inputString: NSString, defaultColor: NSColor, colorRanges: [(range: NSRange, color: NSColor)]?) -> NSImage {
        let attrString = CFAttributedStringCreateMutable(kCFAllocatorDefault, 0)
        CFAttributedStringReplaceString(attrString, CFRangeMake(0, 0), inputString)
        CFAttributedStringSetAttribute(attrString, CFRangeMake(0, inputString.length), kCTForegroundColorAttributeName, defaultColor.CGColor)
        CFAttributedStringSetAttribute(attrString, CFRangeMake(0, inputString.length), kCTFontAttributeName, self.font)
        colorRanges?.forEach() { tuple in
            CFAttributedStringSetAttribute(attrString, CFRange(location: tuple.range.location, length: tuple.range.length), kCTForegroundColorAttributeName, tuple.color.CGColor)
        }
        
        let tuple = __CGImageFromAttributedString(attrString)
        let nsImage = NSImage(CGImage: tuple.image, size: tuple.size)
        
        return nsImage
    }
    
    func chartImageFromString(inputString: NSString, chartColor: NSColor) -> NSImage {
        let attrString = CFAttributedStringCreateMutable(kCFAllocatorDefault, 0)
        CFAttributedStringReplaceString(attrString, CFRangeMake(0, 0), inputString)
        CFAttributedStringSetAttribute(attrString, CFRangeMake(0, inputString.length), kCTForegroundColorAttributeName, chartColor.CGColor)
        CFAttributedStringSetAttribute(attrString, CFRangeMake(0, inputString.length), kCTFontAttributeName, self.font)
        
        let tuple = __CGImageFromAttributedString(attrString)
        let nsImage = NSImage(CGImage: tuple.image, size: tuple.size)
        
        return nsImage
    }
    
    private let recycledContext: CGContextRef = {
        let scale = CGFloat(1.0)
        let size = CGSize(width: 2000, height: 2000)
        let scaledSize = CGSize(width: size.width * scale, height: size.height * scale)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        return CGBitmapContextCreate(nil, Int(round(scaledSize.width)), Int(round(scaledSize.height)), 8, 0, colorSpace, CGImageAlphaInfo.PremultipliedLast.rawValue)!
        }()
    
    private func __CGImageFromAttributedString(attributedString: CFAttributedStringRef) -> (image: CGImage, size: CGSize) {
        let line = CTLineCreateWithAttributedString(attributedString)
        let textFrame = CTLineGetImageBounds(line, self.recycledContext)
        let textSize = CGSize(width: textFrame.size.width + textFrame.origin.x, height: textFrame.size.height + textFrame.origin.y)
        
        let outputContext = CGBitmapContextCreate(nil, Int(round(textSize.width)), Int(round(textSize.height)), 8, 0, CGColorSpaceCreateDeviceRGB(), CGImageAlphaInfo.PremultipliedLast.rawValue)!
        CTLineDraw(line, outputContext)
        
        let cgImage = CGBitmapContextCreateImage(outputContext)!
        return (image: cgImage, size: textSize)
    }
}