//
//  ContentView.swift
//  NSCache
//
//  Created by Masaki Doi on 2023/10/02.
//

import SwiftUI

///
/// NSCache
/// キーとバリューを用いて値を保存する。NSStringやNSNumberを使用するので適宜キャストする必要がある。また、今回は要素数と容量に制限をかけているが、OSの判断によってはキャッシュクリアされる場合もある。
///
///
/// 注意
/// Viewでnumを管理してしまっているが、今回はあくまでもサンプル
/// NSCache<NSNumber, NSString>のインスタンスを複数作成した場合、値は共有されず管理が面倒になるので、クラスを作成し、シングルトン化するのがいい
///


final class TextCache: ObservableObject {
    // シングルトン
    static let shared = TextCache()
    private var cache: NSCache<NSNumber,NSString>
    
    private init() {
        cache = NSCache<NSNumber, NSString>()
        cache.countLimit = 10 // 要素数を10に制限
        cache.totalCostLimit = 100 * 1000 * 1000 // 容量を100MB制限
    }
    
    func add(key: Int, value: String) {
        let key = key as NSNumber
        let value = value as NSString
        
        cache.setObject(value, forKey: key)
    }
    
    func removeAll() {
        cache.removeAllObjects()
        print("removeAll")
    }
    
    func printAll() {
        for i in 1...10 {
            guard let nsStringText = cache.object(forKey: i as NSNumber) else {
                continue
            }
            let value = nsStringText as String
            print("\(i): \(value)")
        }
    }
}


struct ContentView: View {
    @State private var key = 1
    @State private var value = ""
    private let textCache = TextCache.shared
    
    var body: some View {
        VStack {
            Text("デバッグエリアにのみ出力")
            
            TextField("Body", text: $value)
                .textFieldStyle(.roundedBorder).padding(.horizontal)
            
            HStack {
                Button("Add") {
                    // キャッシュに保存
                    textCache.add(key: key, value: value)
                    // キャッシュを出力
                    textCache.printAll()
                    // numを変更
                    key = (key == 10) ? 1 : key + 1
                    // テキストを初期化
                    value.removeAll()
                }.buttonStyle(.borderedProminent).padding(.top)
                
                Button("AllDelete") {
                    textCache.removeAll()
                }
                .buttonStyle(.borderedProminent).tint(.red).padding(.top)
            }
        }
    }
}

#Preview {
    ContentView()
}
