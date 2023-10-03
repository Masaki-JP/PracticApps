//
//  ChartView2.swift
//  SwiftCharts
//
//  Created by Masaki Doi on 2023/10/03.
//

import SwiftUI
import Charts

///
/// ChartView1とは軸を逆にし、横棒グラフとしている。

fileprivate struct Product: Identifiable {
    let name: String
    let count: Int
    let id = UUID()
}

fileprivate let products: [Product] = [
    .init(name: "iPhone", count: 140),
    .init(name: "iPad", count: 110),
    .init(name: "Mac", count: 80),
    .init(name: "Apple Watch", count: 50)
]

struct ChartView2: View {
    var body: some View {
        Chart(products) { product in
            BarMark(x: .value("Count", product.count), y: .value("Name", product.name))
        }
        .frame(height: 300)
        .padding(.horizontal)
    }
}

#Preview {
    ChartView2()
}
