//
//  ChartView5.swift
//  SwiftCharts
//
//  Created by Masaki Doi on 2023/10/03.
//

import SwiftUI
import Charts

///
/// アニメーションが割とクセになる。

fileprivate struct Profit: Identifiable {
    let product: String
    let date: Date
    var profit: Int
    let id = UUID()
    
    init(product: String, year: Int, month: Int, profit: Int) {
        self.product = product
        let calendar = Calendar.autoupdatingCurrent
        self.date = calendar.date(from: DateComponents(year: year, month: month))!
        self.profit = profit
    }
}


fileprivate let mockData: [Profit] = [
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

struct ChartView5: View {
    @State private var data: [Profit] = mockData
    
    var body: some View {
        VStack {
            Chart(data) {
                LineMark(x: .value("Date", $0.date), y: .value("Profit", $0.profit))
                    .foregroundStyle(by: .value("Product", $0.product))
                
                PointMark(x: .value("Date", $0.date), y: .value("Profit", $0.profit))
                    .foregroundStyle(by: .value("Product", $0.product))
            }
            .frame(height: 300)
            .padding(.horizontal)
            
            Button("数値を変更") {
                withAnimation {
                    data[data.count-1].profit += 10
                }
            }
            .buttonStyle(.borderedProminent).padding(.top)
        }
    }
}


#Preview {
    ChartView5()
}
