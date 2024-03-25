//
//  AppDelegate.swift
//  Bankey
//
//  Created by MoonlitPrins8 on 12.02.24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    
    
    var window: UIWindow?
    let loginViewController = LoginViewController()
    let onboardingContainerViewController = OnboardingContainerViewController()
    let dummyViewController = DummyViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        loginViewController.delegate = self
        onboardingContainerViewController.delegate = self
        dummyViewController.logoutDelegate = self
        window?.rootViewController = loginViewController
//        window?.rootViewController = onboardingContainerViewController

        
        
        return true
    }
    
}

extension AppDelegate:  LoginViewControllerDelegate {
    func didLogin(_ sender: LoginViewController) {
            
    }
    
    func didLogin() {
        if LocalState.hasOnBoarded {
            setRootViewController(dummyViewController)
        } else {
            setRootViewController(onboardingContainerViewController)
        }
        
    }
}


extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didFinishOnBoarding() {
        LocalState.hasOnBoarded = true
        setRootViewController(dummyViewController)
        print("DEBUG: finished onboarding")
    }
}


extension AppDelegate: LogOutDelegate {
    func didLogout() {
        setRootViewController(loginViewController)
    }
}
extension AppDelegate {
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
    }
}


