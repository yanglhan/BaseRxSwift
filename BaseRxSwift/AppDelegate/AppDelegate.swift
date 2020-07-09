//
//  AppDelegate.swift
//  BaseRxSwift
//
//  Created by gh on 2020/7/9.
//  Copyright © 2020 gh. All rights reserved.
//

import UIKit
import Reachability
import WCDBSwift

public protocol SelfAware: class {
    static func awake()
}

enum AppLogInOutType {
    case logIn
    case logOut
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    /// 单例
    static let app: AppDelegate = (UIApplication.shared.delegate as? AppDelegate)!
    
    let reachability = Reachability()!
    
    var window: UIWindow?
    
    public lazy var fpsLabel: FPSLabel = {
        let label = FPSLabel.init(frame: CGRect.init(x: kScreenW - 80, y: 90, width: 70, height: 30))
        label.textColor = .white
        label.backgroundColor = .red
        return label
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // app initialize
        appInitializes()
        // init rootViewController
        setupViewController()
        // create db table
        createWcdbTable()
        // FPS
        setupFPSStatus()
        
        return true
    }
    
    private func setupFPSStatus() {
        #if DEBUG
        UIApplication.shared.keyWindow?.addSubview(fpsLabel)
        #endif
    }
    
    func applicationWillResignActive(_ application: UIApplication) {}
    
    func applicationDidEnterBackground(_ application: UIApplication) {}
    
    func applicationWillEnterForeground(_ application: UIApplication) {}
    
    func applicationDidBecomeActive(_ application: UIApplication) {}
    
    func applicationWillTerminate(_ application: UIApplication) {}
    
    
    deinit {
        // 关闭网络状态消息监听
        reachability.stopNotifier()
        // 移除网络状态消息通知
        NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: reachability)
    }
}

