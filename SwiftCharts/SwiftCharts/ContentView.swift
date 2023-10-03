//
//  ContentView.swift
//  SwiftCharts
//
//  Created by Masaki Doi on 2023/10/02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ChartView1()
            
            ChartView2()
            
            ChartView3()
            
            ChartView4()
            
            ChartView5()
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ContentView()
}
