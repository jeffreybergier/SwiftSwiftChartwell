//
//  FontManager.swift
//  SSChartwell
//
//  Created by Jeffrey Bergier on 11/22/15.
//  Copyright © 2015 Jeffrey Bergier. All rights reserved.
//

public extension Chart {
    public class FontLoader {
        public static let sharedManager = FontLoader()
        
        public static let attemptedFonts = [
            Chart.Style.Bars,
            Chart.Style.BarsVertical,
            Chart.Style.Lines,
            Chart.Style.Pies,
            Chart.Style.Radar,
            Chart.Style.Rings,
            Chart.Style.Rose
        ]
        
        public let failedFonts: [Chart.Style]
        public let availableFonts: [Chart.Style]
        
        private init() {
            var availableFonts: [Chart.Style] = []
            var failedFonts: [Chart.Style] = []
            for fontStyle in self.dynamicType.attemptedFonts {
                if let font = NSBundle.mainBundle().URLForResource(fontStyle.fontFileName, withExtension: "ttf") {
                    CTFontManagerRegisterFontsForURL(font, CTFontManagerScope.Process, nil)
                    availableFonts.append(fontStyle)
                } else {
                    failedFonts.append(fontStyle)
                }
            }
            
            self.availableFonts = availableFonts
            self.failedFonts = failedFonts
        }
        
        public func fontAvailableForStyle(aStyle: Chart.Style) -> Bool {
            for existingStyle in self.failedFonts {
                if existingStyle == aStyle {
                    return false
                }
            }
            return true
        }
    }
}