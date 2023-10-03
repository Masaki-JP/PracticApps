//
//  ChartView4.swift
//  SwiftCharts
//
//  Created by Masaki Doi on 2023/10/03.
//

import SwiftUI
import Charts

///
///

fileprivate struct Profit: Identifiable {
    let product: String
    let date: Date
    let profit: Int
    let id = UUID()
    
    init(product: String, year: Int, month: Int, profit: Int) {
        self.product = product
        let calendar = Calendar.autoupdatingCurrent
        self.date = calendar.date(from: DateComponents(year: year, month: month))!
        self.profit = profit
    }
}

private let data: [Profit] = [
    .init(product: "iPhone", year: 2022, month: 1, profit: Int.random(in: 20...250)),
    .init(product: "iPad", year: 2022, month: 1, profit: Int.random(in: 20...250)),
    .init(product: "Mac", year: 2022, month: 1, profit: Int.random(in: 20...250)),
    .init(product: "Apple Watch", year: 2022, month: 1, profit: Int.random(in: 20...250)),
    .init(product: "iPhone", year: 2022, month: 2, profit: Int.random(in: 20...250)),
    .init(product: "iPad", year: 2022, month: 2, profit: Int.random(in: 20...250)),
    .init(product: "Mac", year: 2022, month: 2, profit: Int.random(in: 20...250)),
    .init(product: "Apple Watch", year: 2022, month: 2, profit: Int.random(in: 20...250)),
    .init(product: "iPhone", year: 2022, month: 3, profit: Int.random(in: 20...250)),
    .init(product: "iPad", year: 2022, month: 3, profit: Int.random(in: 20...250)),
    .init(product: "Mac", year: 2022, month: 3, profit: Int.random(in: 20...250)),
    .init(product: "Apple Watch", year: 2022, month: 3, profit: Int.random(in: 20...250)),
    .init(product: "iPhone", year: 2022, month: 4, profit: Int.random(in: 20...250)),
    .init(product: "iPad", year: 2022, month: 4, profit: Int.random(in: 20...250)),
    .init(product: "Mac", year: 2022, month: 4, profit: Int.random(in: 20...250)),
    .init(product: "Apple Watch", year: 2022, month: 4, profit: Int.random(in: 20...250)),
    .init(product: "iPhone", year: 2022, month: 5, profit: Int.random(in: 20...250)),
    .init(product: "iPad", year: 2022, month: 5, profit: Int.random(in: 20...250)),
    .init(product: "Mac", year: 2022, month: 5, profit: Int.random(in: 20...250)),
    .init(product: "Apple Watch", year: 2022, month: 5, profit: Int.random(in: 20...250)),
    .init(product: "iPhone", year: 2022, month: 6, profit: Int.random(in: 20...250)),
    .init(product: "iPad", year: 2022, month: 6, profit: Int.random(in: 20...250)),
    .init(product: "Mac", year: 2022, month: 6, profit: Int.random(in: 20...250)),
    .init(product: "Apple Watch", year: 2022, month: 6, profit: Int.random(in: 20...250))
]


struct ChartView4: View {
    var body: some View {
        Chart(data) {
            LineMark(x: .value("Date", $0.date), y: .value("Profit", $0.profit))
                .foregroundStyle(by: .value("Product", $0.product))
            
            PointMark(x: .value("Date", $0.date), y: .value("Profit", $0.profit))
                .foregroundStyle(by: .value("Product", $0.product))
        }
        .frame(height: 300)
        .padding(.horizontal)
    }
}

#Preview {
    ChartView4()
}
