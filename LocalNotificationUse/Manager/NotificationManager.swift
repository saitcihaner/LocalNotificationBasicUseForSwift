//
//  NotificationManager.swift
//  LocalNotificationUse
//
//  Created by Sait Cihaner on 6.04.2023.
//

import Foundation
import UserNotifications

final class NotificationManager {
    private init(){}
    static let shared = NotificationManager.init()
    
    private let userNotificationCenter = UNUserNotificationCenter.current()
    
    func requestNotificationAuthorization() {
        let authOptions = UNAuthorizationOptions.init(arrayLiteral: .alert, .badge, .sound)
        self.userNotificationCenter.requestAuthorization(options: authOptions) { [weak self] (success, error) in
            guard let self else {return}
            success ? self.sendNotification() : nil
        }
    }
    
    func setDelegateMethod(vc: UNUserNotificationCenterDelegate) {
        userNotificationCenter.delegate = vc
    }

    func sendNotification() {
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "Test"
        notificationContent.body = "Test body"
        notificationContent.badge = NSNumber(value: 3)
        /// TODO : Png yada başka tipte dosyalar eklemek için kullanılır.
        
//        if let url = Bundle.main.url(forResource: "dune",
//                                    withExtension: "png") {
//            if let attachment = try? UNNotificationAttachment(identifier: "dune",
//                                                            url: url,
//                                                            options: nil) {
//                notificationContent.attachments = [attachment]
//            }
//        }
//
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5,
                                                        repeats: false)
        let request = UNNotificationRequest(identifier: "testNotification",
                                            content: notificationContent,
                                            trigger: trigger)
        
        userNotificationCenter.add(request) { (error) in
            if let error = error {
                print("Notification Error: ", error)
            }
        }
    }
}
