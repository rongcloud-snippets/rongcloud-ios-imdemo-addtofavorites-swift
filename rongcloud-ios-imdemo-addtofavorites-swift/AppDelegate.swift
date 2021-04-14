//
//  AppDelegate.swift
//  rongcloud-ios-imdemo-addtofavorites-swift
//
//  Created by Jue on 2021/4/14.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        initRongCloud()
        
        setRootViewController()
        
        connectRongCloud()
        
        return true
    }

    func initRongCloud() {
        // SDK 的 init 方法。所有 SDK 操作都需要在此之后进行
        // 参考文档：https://docs.rongcloud.cn/v3/views/im/ui/guide/private/setting/init/ios.html
        RCIM.shared()?.initWithAppKey(Appkey)
    }
    
    func setRootViewController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        // 设置需要显示的类型和需要聚合的类型
        // 注意：未设置的会话类型不会被显示出来！！！
        let conversationListViewController:RCSConversationListViewController = RCSConversationListViewController(displayConversationTypes: [
        RCConversationType.ConversationType_PRIVATE.rawValue,
        RCConversationType.ConversationType_GROUP.rawValue
        ], collectionConversationType: [])

        let navigationController:UINavigationController = UINavigationController(rootViewController: conversationListViewController)
        window?.rootViewController = navigationController
    }
    
    func connectRongCloud() {
        RCIM.shared()?.connect(withToken: Token, dbOpened: { (DBErrorCode) in
            // 数据库打开
        }, success: { (userId) in
            // 连接成功
        }, error: { (ConnectErrorCode) in
            // 连接失败
        })
    }



}

