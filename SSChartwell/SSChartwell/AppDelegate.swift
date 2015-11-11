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
        
        
        self.mainWindow = NSWindowController(windowNibName: "ChartTestWindowController")
        self.mainWindow!.showWindow(self)
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

