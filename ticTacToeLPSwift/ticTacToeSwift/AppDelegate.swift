//
//  AppDelegate.swift
//  ticTacToeSwift
//
//  Created by Sophie Saouma on 2/16/15.
//  Copyright (c) 2015 SSaouma. All rights reserved.
//  
//  This app was designed with Leanplum users in mind. If you didn’t implement
//  your own App Keys, then this sample code will not compile. To find your app
//  keys, simply click on the ‘help’ tab in Leanplum, and click on the ‘setup’
//  tab. There, you will find a section of highlight code that has all the keys
//  you need. Simply copy and replace the code in this app to get it to compile.
//  You’ll soon be able to alter the content of this app (what are the player’s
//  variables in the game, what is the colour of the background or the tiles,
//  and what is the header of the game). This app currently tracks when a player
//  completes a move, who wins, and how many ties.
//

import UIKit
#if DEBUG
    import AdSupport
#endif



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        var mainVC = tictacViewController(nibName: "tictacViewController", bundle: nil)
        
        window?.rootViewController = mainVC
        window?.makeKeyAndVisible()
        
        #if DEBUG
            Leanplum.setDeviceId(ASIdentifierManager.sharedManager().advertisingIdentifier.UUIDString)
            Leanplum.setAppId("INSERT APP KEY", withDevelopmentKey:"INSERT DEV KEY")
            #else
            Leanplum.setAppId("INSERT APP KEY", withProductionKey: "INSERT PROD KEY")
        #endif
        
        // Syncs all the files between your main bundle and Leanplum.
        // This allows you to swap out and A/B test any resource file
        // in your project in realtime.
        Leanplum.syncResourcesAsync(true)
        Leanplum.setVerboseLoggingInDevelopmentMode(true)
        
        // Tracks in-app purchases automatically as the "Purchase" event.
        // To require valid receipts upon purchase or change your reported
        // currency code from USD, update your app settings.
        Leanplum.trackInAppPurchases()
        
        // Tracks all screens in your app as states in Leanplum.
        Leanplum.trackAllAppScreens()
        
        // Starts a new session and updates the app content from Leanplum.
        Leanplum.startWithUserId("SujanStevens")
        
        // Override point for customization after application launch.
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

