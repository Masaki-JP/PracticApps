//
//  ContentView.swift
//  EventKit-Calendar
//
//  Created by Masaki Doi on 2023/10/11.
//

import SwiftUI

///
/// 「Privacy - Calendars Write Only Usage Description」を追加し、使用理由を記載
///

struct ContentView: View {
    @State private var title = ""
    @State private var startDate = Date()
    @State private var endDate = Date()
    
    let calendarService = CalendarService.shared
    
    var body: some View {
        Group {
            VStack(alignment: .leading) {
                Text("タイトル").padding(.trailing)
                TextField("", text: $title)
                    .textFieldStyle(.roundedBorder)
                
                Divider().padding(.top)
                
                Text("開始日時").padding(.top)
                DatePicker("開始日時", selection: $startDate)
                    .datePickerStyle(.wheel)
                    .environment(\.locale, Locale(identifier: "ja_JP"))
                    .labelsHidden()
                
                Divider()
                
                Text("終了日時").padding(.top)
                DatePicker("終了日時", selection: $endDate)
                    .datePickerStyle(.wheel)
                    .environment(\.locale, Locale(identifier: "ja_JP"))
                    .labelsHidden()
            }
            .padding(.horizontal)
            
            Divider()
            
            Button("イベントを追加") {
                calendarService.addEvent(startDate: startDate, endDate: endDate, title: title)
                title.removeAll()
            }
            .buttonStyle(.borderedProminent).padding(.top)
        }
        .onAppear {
            calendarService.requestAccess()
        }
    }
}

#Preview {
    ContentView()
}
