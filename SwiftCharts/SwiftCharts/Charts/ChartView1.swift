//
//  ChartView1.swift
//  SwiftCharts
//
//  Created by Masaki Doi on 2023/10/03.
//

import SwiftUI
import Charts

///
/// Chartは暗黙的に最大サイズとなる。
/// X軸とY軸を間違えて逆に書くとプレビューがクラッシュする。

struct ChartView1: View {
    var body: some View {
        Chart {
            BarMark(x: .value("Name", "iPhone"), y: .value("count", 140))
                .foregroundStyle(.pink)
            
            BarMark(x: .value("Name", "iPad"), y: .value("count", 110))
                .foregroundStyle(.blue)
            
            BarMark(x: .value("Name", "Mac"), y: .value("count", 80))
                .foregroundStyle(.orange)
            
            BarMark(x: .value("Name", "Apple Watch"), y: .value("count", 50))
                .foregroundStyle(.green)
        }
        .frame(height: 300)
        .padding(.horizontal)
    }
}

#Preview {
    ChartView1()
}
