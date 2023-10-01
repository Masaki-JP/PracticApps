//
//  ReminderAPIModel.swift
//  RemindersAPI
//
//  Created by Masaki Doi on 2023/10/01.
//

import Foundation
import EventKit

final class ReminderAPIModel {
    static let shared = ReminderAPIModel()
    private init() {}
    
    private let store = EKEventStore()
    
    // リマインダーアプリへのアクセス要求
    func requestAccessToReminders() {
        if #available(iOS 17, *) {
            store.requestFullAccessToReminders { result, error in
                print("result:", result, " / ", "error:", error as Any)
            }
        } else {
            store.requestAccess(to: .reminder) { result, error in
                print("result:", result, " / ", "error:", error as Any)
            }
        }
    }
    
    // アクセス可能か確認
    private func isAccessible() -> Bool {
        let status = EKEventStore.authorizationStatus(for: .reminder)
        
        if #available(iOS 17, *) {
            return status == .fullAccess ? true : false // リマインダーにwriteOnlyはない
        } else {
            return status == .authorized ? true : false
//            return status.rawValue == 3 ? true : false // こっちでもいいかも
        }
    }
    
    // リマインダーの作成
    func create() {
        // アクセスが可能であることを確認
        guard self.isAccessible() else { return }
        
        // リマインダーを新規作成
        let reminder = EKReminder(eventStore: store)
        
        // タイトルを設定
        reminder.title = "テスト"
        // リマインダーの追加先を設定
        reminder.calendar = store.defaultCalendarForNewReminders()
        
        // 通知と期限の設定
        let calendar = Calendar.current
        let tenMinutesLater_Date = calendar.date(byAdding: .minute, value: 1, to: Date())! // force unwrap
        let alarm = EKAlarm(absoluteDate: tenMinutesLater_Date)
        reminder.addAlarm(alarm) // 通知
        let tenMinutesLater_DC = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: tenMinutesLater_Date)
        reminder.dueDateComponents = tenMinutesLater_DC // 期限
        
        // コミット
        do {
            try store.save(reminder, commit: true)
            print("リマインダーの作成に成功しました。")
        } catch {
            print("error:", error)
            print("リマインダーの作成に失敗しました。")
        }
    }
}
