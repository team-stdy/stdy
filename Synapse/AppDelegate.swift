//
//  AppDelegate.swift
//  Synapse
//
//  Created by Allison Trager on 1/19/20.
//  Copyright © 2020 Synapse. All rights reserved.
//

import UIKit
import Firebase

//let primaryColor = UIColor(red: 210/255, green: 109/255, blue: 180/255, alpha: 1)
//let secondaryColor = UIColor(red: 52/255, green: 148/255, blue: 230/255, alpha: 1)

let primaryColor = UIColor(hexString: "BB86FC")
let secondaryColor = UIColor(hexString: "3700B3")

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        UITabBar.appearance().barTintColor = .lightGray
        UITabBar.appearance().tintColor = UIColor(hexString: "3700B3")
        UISearchBar.appearance().tintColor = .white
        //UINavigationBar.appearance().tintColor = UIColor(hex: "#BB86FC")
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedString.Key.font : UIFont(name: "Avenir", size: 20)!,
            NSAttributedString.Key.foregroundColor : UIColor(hexString: "3700B3")
        ]
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}


extension UIColor {
    convenience init?(hexString: String) {
        var chars = Array(hexString.hasPrefix("#") ? hexString.dropFirst() : hexString[...])
        switch chars.count {
        case 3: chars = chars.flatMap { [$0, $0] }; fallthrough
        case 6: chars = ["F","F"] + chars
        case 8: break
        default: return nil
        }
        self.init(red: .init(strtoul(String(chars[2...3]), nil, 16)) / 255,
                green: .init(strtoul(String(chars[4...5]), nil, 16)) / 255,
                 blue: .init(strtoul(String(chars[6...7]), nil, 16)) / 255,
                alpha: .init(strtoul(String(chars[0...1]), nil, 16)) / 255)
    }
}
