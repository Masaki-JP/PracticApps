//
//  ContentView.swift
//  Library
//
//  Created by Masaki Doi on 2023/09/29.
//

import SwiftUI
import SomeLibrary


/// 
///
/// ライブラリについて
///
///
/// ターゲットの新規作成から「Framework」で作成し、importして使用する。
///
/// ターゲットメンバーシップはファイルの場所を移動すると自動的に変更される。複数チェックを入れると複数のターゲットに所属していることになるが、普通はimportして使う模様。
///
///
/// 作成したライブラリのビルドを忘れないように注意
/// → 現在は特に意識する必要はないかも
///
/// アクセスレベルが指定されていないものは「internal」のため、そのままではライブラリのメソッドなどを利用することができないため、使用するもののアクセスレベルを「public」にする必要がある。また、構造体などで自動的に生成されるイニシャライザのアクセスレベルは「internal」であることに注意する。
///
/// 名前が競合した場合、内部のものが優先される。外部のものを使用したい場合、「ライブラリ名.メソッド名」のような形で使用できる。
///
///


struct ContentView: View {
    
    private let person = Person(name: "Mike", age: 30)
    private func greeting() { print("Good morning.")}
    
    var body: some View {
        VStack {
            Divider()
            
            Text("\(person.getName())さんは\(String(person.getAge()))歳です。").padding(.top)
            
            Divider().padding(.top)
            
            Button {
                self.greeting()
            } label: {
                Text("greeting")
            }
            .buttonStyle(.borderedProminent).padding(.top)
            
            Button {
                SomeLibrary.greeting()
            } label: {
                Text("SomeLibrary.greeting")
            }
            .buttonStyle(.borderedProminent).padding(.top)
            
            Divider().padding(.top)
        }
    }
}

#Preview {
    ContentView()
}
