//
//  CalendarService.swift
//  EventKit-Calendar
//
//  Created by Masaki Doi on 2023/10/11.
//

import Foundation
import EventKit

final class CalendarService {
    static let shared = CalendarService()
    private init() {}
    
    private let eventStore = EKEventStore()
    
    func requestAccess()  {
        Task { try? await eventStore.requestWriteOnlyAccessToEvents() }
    }
    
    private func getAuthorizationStatus() -> Bool {
        let status = EKEventStore.authorizationStatus(for: .event)
        switch status {
        case .fullAccess, .writeOnly:
            return true
        default:
            return false
        }
    }
    
    func addEvent(startDate: Date, endDate: Date, title: String) {
        guard getAuthorizationStatus() else { print("アクセス未許可"); return; }
        
        let event = EKEvent(eventStore: eventStore)
        event.title = title
        event.startDate = startDate
        event.endDate = endDate
        event.calendar = eventStore.defaultCalendarForNewEvents
        
        try! eventStore.save(event, span: .thisEvent)
        print("作成完了")
    }
}
