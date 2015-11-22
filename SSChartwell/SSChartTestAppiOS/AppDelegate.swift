//
//  AppDelegate.swift
//  SSChartTestAppiOS
//
//  Created by Jeffrey Bergier on 11/22/15.
//  Copyright © 2015 Jeffrey Bergier. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
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
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

