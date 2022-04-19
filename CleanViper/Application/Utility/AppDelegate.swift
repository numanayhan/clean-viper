//
//  AppDelegate.swift
//  CleanViper
//
//  Created by nayhan on 19.04.2022.
//

import UIKit
var rooter:Navigation?
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Thread.sleep(forTimeInterval: 0.0)
         
        //Navigation ile Navigation kontroller rooter olarak alır.

        setNavigation()
        
        return true
    }
    func setNavigation(){
          
        //Window UI
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        //Root App
        rooter = Navigation(window: window!)
        rooter?.startApp()
        
    }
}
