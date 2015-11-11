//
//  AppDelegate.swift
//  SSChartwell
//
//  Created by Jeffrey Bergier on 11/10/15.
//  Copyright © 2015 Jeffrey Bergier. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow?
    var mainWindow: NSWindowController?


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        
        if let chartwellBarsVerticalFont = NSBundle.mainBundle().URLForResource("ChartwellBarsVertical", withExtension: "ttf") {
            CTFontManagerRegisterFontsForURL(chartwellBarsVerticalFont, CTFontManagerScope.Process, nil)
        }
        if let chartwellBars = NSBundle.mainBundle().URLForResource("ChartwellBars", withExtension: "ttf") {
            CTFontManagerRegisterFontsForURL(chartwellBars, CTFontManagerScope.Process, nil)
        }
        if let chartwellLines = NSBundle.mainBundle().URLForResource("ChartwellLines", withExtension: "ttf") {
            CTFontManagerRegisterFontsForURL(chartwellLines, CTFontManagerScope.Process, nil)
        }
        if let chartwellPies = NSBundle.mainBundle().URLForResource("ChartwellPies", withExtension: "ttf") {
            CTFontManagerRegisterFontsForURL(chartwellPies, CTFontManagerScope.Process, nil)
        }
        if let chartwellRadar = NSBundle.mainBundle().URLForResource("ChartwellRadar", withExtension: "ttf") {
            CTFontManagerRegisterFontsForURL(chartwellRadar, CTFontManagerScope.Process, nil)
        }
        if let chartwellRings = NSBundle.mainBundle().URLForResource("ChartwellRings", withExtension: "ttf") {
            CTFontManagerRegisterFontsForURL(chartwellRings, CTFontManagerScope.Process, nil)
        }
        if let chartwellRose = NSBundle.mainBundle().URLForResource("ChartwellRose", withExtension: "ttf") {
            CTFontManagerRegisterFontsForURL(chartwellRose, CTFontManagerScope.Process, nil)
        }
        
        
        self.mainWindow = NSWindowController(windowNibName: "ChartTestWindowController")
        self.mainWindow!.showWindow(self)
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

