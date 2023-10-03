//
//  ChartView3.swift
//  SwiftCharts
//
//  Created by Masaki Doi on 2023/10/03.
//

import SwiftUI
import Charts

///
/// モックデータの作成にはChatGPTが有効
/// → random使ってるから微妙

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
    .init(product: "Apple Watch", year: 2022, month: 6, profit: Int.random(in: 20...250)),
//    .init(product: "iPhone", year: 2022, month: 7, profit: Int.random(in: 20...250)),
//    .init(product: "iPad", year: 2022, month: 7, profit: Int.random(in: 20...250)),
//    .init(product: "Mac", year: 2022, month: 7, profit: Int.random(in: 20...250)),
//    .init(product: "Apple Watch", year: 2022, month: 7, profit: Int.random(in: 20...250)),
//    .init(product: "iPhone", year: 2022, month: 8, profit: Int.random(in: 20...250)),
//    .init(product: "iPad", year: 2022, month: 8, profit: Int.random(in: 20...250)),
//    .init(product: "Mac", year: 2022, month: 8, profit: Int.random(in: 20...250)),
//    .init(product: "Apple Watch", year: 2022, month: 8, profit: Int.random(in: 20...250)),
//    .init(product: "iPhone", year: 2022, month: 9, profit: Int.random(in: 20...250)),
//    .init(product: "iPad", year: 2022, month: 9, profit: Int.random(in: 20...250)),
//    .init(product: "Mac", year: 2022, month: 9, profit: Int.random(in: 20...250)),
//    .init(product: "Apple Watch", year: 2022, month: 9, profit: Int.random(in: 20...250)),
//    .init(product: "iPhone", year: 2022, month: 10, profit: Int.random(in: 20...250)),
//    .init(product: "iPad", year: 2022, month: 10, profit: Int.random(in: 20...250)),
//    .init(product: "Mac", year: 2022, month: 10, profit: Int.random(in: 20...250)),
//    .init(product: "Apple Watch", year: 2022, month: 10, profit: Int.random(in: 20...250)),
//    .init(product: "iPhone", year: 2022, month: 11, profit: Int.random(in: 20...250)),
//    .init(product: "iPad", year: 2022, month: 11, profit: Int.random(in: 20...250)),
//    .init(product: "Mac", year: 2022, month: 11, profit: Int.random(in: 20...250)),
//    .init(product: "Apple Watch", year: 2022, month: 11, profit: Int.random(in: 20...250)),
//    .init(product: "iPhone", year: 2022, month: 12, profit: Int.random(in: 20...250)),
//    .init(product: "iPad", year: 2022, month: 12, profit: Int.random(in: 20...250)),
//    .init(product: "Mac", year: 2022, month: 12, profit: Int.random(in: 20...250)),
//    .init(product: "Apple Watch", year: 2022, month: 12, profit: Int.random(in: 20...250)),
    // 2023年のデータ
//    .init(product: "iPhone", year: 2023, month: 1, profit: Int.random(in: 20...250)),
//    .init(product: "iPad", year: 2023, month: 1, profit: Int.random(in: 20...250)),
//    .init(product: "Mac", year: 2023, month: 1, profit: Int.random(in: 20...250)),
//    .init(product: "Apple Watch", year: 2023, month: 1, profit: Int.random(in: 20...250)),
//    .init(product: "iPhone", year: 2023, month: 2, profit: Int.random(in: 20...250)),
//    .init(product: "iPad", year: 2023, month: 2, profit: Int.random(in: 20...250)),
//    .init(product: "Mac", year: 2023, month: 2, profit: Int.random(in: 20...250)),
//    .init(product: "Apple Watch", year: 2023, month: 2, profit: Int.random(in: 20...250)),
//    .init(product: "iPhone", year: 2023, month: 3, profit: Int.random(in: 20...250)),
//    .init(product: "iPad", year: 2023, month: 3, profit: Int.random(in: 20...250)),
//    .init(product: "Mac", year: 2023, month: 3, profit: Int.random(in: 20...250)),
//    .init(product: "Apple Watch", year: 2023, month: 3, profit: Int.random(in: 20...250)),
//    .init(product: "iPhone", year: 2023, month: 4, profit: Int.random(in: 20...250)),
//    .init(product: "iPad", year: 2023, month: 4, profit: Int.random(in: 20...250)),
//    .init(product: "Mac", year: 2023, month: 4, profit: Int.random(in: 20...250)),
//    .init(product: "Apple Watch", year: 2023, month: 4, profit: Int.random(in: 20...250)),
//    .init(product: "iPhone", year: 2023, month: 5, profit: Int.random(in: 20...250)),
//    .init(product: "iPad", year: 2023, month: 5, profit: Int.random(in: 20...250)),
//    .init(product: "Mac", year: 2023, month: 5, profit: Int.random(in: 20...250)),
//    .init(product: "Apple Watch", year: 2023, month: 5, profit: Int.random(in: 20...250)),
//    .init(product: "iPhone", year: 2023, month: 6, profit: Int.random(in: 20...250)),
//    .init(product: "iPad", year: 2023, month: 6, profit: Int.random(in: 20...250)),
//    .init(product: "Mac", year: 2023, month: 6, profit: Int.random(in: 20...250)),
//    .init(product: "Apple Watch", year: 2023, month: 6, profit: Int.random(in: 20...250)),
//    .init(product: "iPhone", year: 2023, month: 7, profit: Int.random(in: 20...250)),
//    .init(product: "iPad", year: 2023, month: 7, profit: Int.random(in: 20...250)),
//    .init(product: "Mac", year: 2023, month: 7, profit: Int.random(in: 20...250)),
//    .init(product: "Apple Watch", year: 2023, month: 7, profit: Int.random(in: 20...250)),
//    .init(product: "iPhone", year: 2023, month: 8, profit: Int.random(in: 20...250)),
//    .init(product: "iPad", year: 2023, month: 8, profit: Int.random(in: 20...250)),
//    .init(product: "Mac", year: 2023, month: 8, profit: Int.random(in: 20...250)),
//    .init(product: "Apple Watch", year: 2023, month: 8, profit: Int.random(in: 20...250)),
//    .init(product: "iPhone", year: 2023, month: 9, profit: Int.random(in: 20...250)),
//    .init(product: "iPad", year: 2023, month: 9, profit: Int.random(in: 20...250)),
//    .init(product: "Mac", year: 2023, month: 9, profit: Int.random(in: 20...250)),
//    .init(product: "Apple Watch", year: 2023, month: 9, profit: Int.random(in: 20...250)),
//    .init(product: "iPhone", year: 2023, month: 10, profit: Int.random(in: 20...250)),
//    .init(product: "iPad", year: 2023, month: 10, profit: Int.random(in: 20...250)),
//    .init(product: "Mac", year: 2023, month: 10, profit: Int.random(in: 20...250)),
//    .init(product: "Apple Watch", year: 2023, month: 10, profit: Int.random(in: 20...250)),
//    .init(product: "iPhone", year: 2023, month: 11, profit: Int.random(in: 20...250)),
//    .init(product: "iPad", year: 2023, month: 11, profit: Int.random(in: 20...250)),
//    .init(product: "Mac", year: 2023, month: 11, profit: Int.random(in: 20...250)),
//    .init(product: "Apple Watch", year: 2023, month: 11, profit: Int.random(in: 20...250)),
//    .init(product: "iPhone", year: 2023, month: 12, profit: Int.random(in: 20...250)),
//    .init(product: "iPad", year: 2023, month: 12, profit: Int.random(in: 20...250)),
//    .init(product: "Mac", year: 2023, month: 12, profit: Int.random(in: 20...250)),
//    .init(product: "Apple Watch", year: 2023, month: 12, profit: Int.random(in: 20...250)),
]


struct ChartView3: View {
    var body: some View {
        Chart(data) {
            LineMark(
                x: .value("Month", $0.date),
                y: .value("Profit", $0.profit)
            )
            .foregroundStyle(by: .value("Product", $0.product))
        }
        .frame(height: 300)
        .padding()
    }
}

#Preview {
    ChartView3()
}
