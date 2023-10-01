//
//  ViewModel.swift
//  RemindersAPI
//
//  Created by Masaki Doi on 2023/10/01.
//

import Foundation
//import EventKit // ReminderAPIModelのみでOK

final class ViewModel {
    static let shared = ViewModel()
    private init() {}
    
    private let reminderAPI = ReminderAPIModel.shared
    
    // リマインダーアプリへのアクセス要求
    func requestAccessToReminders() {
        reminderAPI.requestAccessToReminders()
    }
    
    // リマインダーの作成
    func createReminder() {
        reminderAPI.create()
    }
}
