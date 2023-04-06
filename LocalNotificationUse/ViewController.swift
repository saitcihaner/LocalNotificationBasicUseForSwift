//
//  ViewController.swift
//  LocalNotificationUse
//
//  Created by Sait Cihaner on 6.04.2023.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationManager.shared.setDelegateMethod(vc: self)
        NotificationManager.shared.requestNotificationAuthorization()
    }
}

extension ViewController: UNUserNotificationCenterDelegate {
    // LOCAL NOTİFİCATİONA BASILDI
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        UIApplication.shared.applicationIconBadgeNumber = 0
    }
// LOCAL NOTİFİCATİON GÖSTERİLDİ
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
}
