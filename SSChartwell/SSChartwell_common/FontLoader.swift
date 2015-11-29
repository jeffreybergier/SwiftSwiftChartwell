//
//  FontManager.swift
//  SSChartwell
//
//  Created by Jeffrey Bergier on 11/22/15.
//
//  Copyright © 2015 Jeffrey Bergier.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//
//

public extension Chart {
    public class FontLoader {
        public static let sharedInstance = FontLoader()
        
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
                #if os(iOS) || os(tvOS)
                    let optionalFont = UIFont(name: fontStyle.rawValue.fontName, size: 20)
                #elseif os(OSX)
                    let optionalFont = NSFont(name: fontStyle.rawValue.fontName, size: 20)
                #endif
                if let _ = optionalFont {
                    availableFonts.append(fontStyle)
                } else {
                    if let font = NSBundle.mainBundle().URLForResource(fontStyle.rawValue.fontFileName, withExtension: "ttf") {
                        CTFontManagerRegisterFontsForURL(font, CTFontManagerScope.Process, nil)
                        availableFonts.append(fontStyle)
                    } else {
                        failedFonts.append(fontStyle)
                    }
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