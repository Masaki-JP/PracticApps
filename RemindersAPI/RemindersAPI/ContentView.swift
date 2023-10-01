//
//  ContentView.swift
//  RemindersAPI
//
//  Created by Masaki Doi on 2023/10/01.
//

///
/// EventKitよりAPIが提供される。
///
/// 以下を想定
/// iOS17より前とiOS17以降
/// アクセス許可
///
/// TargetのInfoに「Privacy - Reminders Full Access Usage Description」と「Privacy - Reminders Usage Description」の二つのKeyを追加し、Valueにアクセス許可の際の文言を記述する。
///
/// アクセスはiOSのバージョンによってメソッドを変える。
/// requestFullAccessToReminders or requestAccess
///
///

import SwiftUI
//import EventKit // ReminderAPIModelのみでOK

struct ContentView: View {
    let vm = ViewModel.shared
    
    var body: some View {
        Button("アクセス要求") {
            vm.requestAccessToReminders()
        }.padding(.top)
        
        Button("リマインダーを作成") {
            vm.createReminder()
        }.padding(.top)
    }
}

#Preview {
    ContentView()
}
