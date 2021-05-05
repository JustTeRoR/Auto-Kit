//
//  AppDelegate.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 28.04.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import UIKit
import VK_ios_sdk

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,AuthServiceDelegate {

    var window: UIWindow?
    var authService: AuthService!
    
    var usingNgrok:Bool = false;
    
    static func shared() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
        window = UIWindow()
        self.authService = AuthService()

        authService.delegate = self

        let scope = ["wall", "friends"]
        VKSdk.wakeUpSession(scope) { (state, _) in
            if state == VKAuthorizationState.authorized {
                self.authServiceSignIn()
            } else {
                self.authVC()
            }
        }
        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        VKSdk.processOpen(url, fromApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String)
        print("url: \(url)")

        return true
    }

    private func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        VKSdk.processOpen(url as URL?, fromApplication: sourceApplication)
        print("url: \(url)")

        return true
    }
  
    // MARK: AuthServiceDelegate
    func authServiceShouldShow(_ viewController: UIViewController) {
        print(#function)
        window?.rootViewController?.present(viewController, animated: true, completion: nil)
    }

    func authServiceSignIn() {
        print(#function)
        let mainVC: MainTabBarController = MainTabBarController.loadFromStoryboard()
        let navVC = UINavigationController(rootViewController: mainVC)
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
    }

    func authVC() {
        print(#function)
        let authVC: LoginViewController = LoginViewController.loadFromStoryboard()
        let navVC = UINavigationController(rootViewController: authVC)
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
    }

    func authServiceDidSignInFail() {
        print(#function)
    }
}
