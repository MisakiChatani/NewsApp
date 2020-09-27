//
//  AppDelegate.swift
//  NewsApp
//
//  Created by 茶谷美咲 on 2020/09/20.
//  Copyright © 2020 Misaki Chatani. All rights reserved.
//

import UIKit
import UserNotifications
import NotificationCenter


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //Notification登録前のおまじない。テストの為、現在のノーティフケーションを削除します
               UNUserNotificationCenter.current().removeAllPendingNotificationRequests();
               
               //Notification登録前のおまじない。これがないとpermissionエラーが発生するので必要です。
               UNUserNotificationCenter.current().requestAuthorization(options:[.badge, .alert, .sound]) { (granted, error) in if granted {print("通知許可")}
               }
               
               //以下で登録処理
               let content = UNMutableNotificationContent()
               content.title = "Newsアプリ";
               content.body = "60秒ごとに通知が来るよ！";
        content.sound = UNNotificationSound.default
               let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 60, repeats: true)
               let request = UNNotificationRequest.init(identifier: "TestNotification", content: content, trigger: trigger)
               let center = UNUserNotificationCenter.current()
               center.add(request)
               center.delegate = self
        // Override point for customization after application launch.
        return true
    }
    
    //上記のNotificatioを５秒後に受け取る関数
       //ポップアップ表示のタイミングで呼ばれる関数
       //（アプリがアクティブ、非アクテイブ、アプリ未起動,バックグラウンドでも呼ばれる）
       func userNotificationCenter(_ center: UNUserNotificationCenter,
                                   willPresent notification: UNNotification,
                                   withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
           completionHandler([.alert,.sound])
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

