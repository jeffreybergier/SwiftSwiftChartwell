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