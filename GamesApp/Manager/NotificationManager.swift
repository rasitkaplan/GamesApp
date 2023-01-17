//
//  NotificationManager.swift
//  GamesApp
//
//  Created by rasit on 16.01.2023.
//

import Foundation
import UserNotifications
class NotificationManager: NSObject {
    static let shared = NotificationManager()
    let center = UNUserNotificationCenter.current()

    func createNotfications(name: String) {
        let content = UNMutableNotificationContent()
        content.title = "Added to favorites"
        content.body = name
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)

        let identifier = "FirstUserNotification"
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        center.add(request) { (error) in
            if error != nil {
                print("Something wrong")
            }
        }
        center.delegate = self
    }
}
extension NotificationManager: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .badge, .sound])
    }
}
