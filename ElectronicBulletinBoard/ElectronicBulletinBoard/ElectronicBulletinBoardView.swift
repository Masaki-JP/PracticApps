//
//  ElectronicBulletinBoardView.swift
//  ElectronicBulletinBoard
//
//  Created by Masaki Doi on 2023/10/23.
//

import SwiftUI

struct ElectronicBulletinBoardView: View {
    let characters: [Character]
    let bitSize: CGFloat
    let width: CGFloat
    let height: CGFloat
    let quarterOfBitSize: CGFloat
    let onColor: Color
    let offColor: Color
    
    var body: some View {
        HStack(spacing: quarterOfBitSize) {
            ForEach(characters.indices, id: \.self) { i in
                if i != 0 {
                    BitsRowAsSpacer(bitSize: bitSize, offColor: offColor)
                }
                CharacterView(data: AvailableCharacters(rawValue: characters[i])!.data, bitSize: bitSize, onColor: onColor, offColor: offColor)
            }
        }
        .frame(width: width, height: height)
    }
}


struct BitsRowAsSpacer: View {
    let bitSize: CGFloat
    let quarterOfBitSize: CGFloat
    let offColor: Color
    
    init(bitSize: CGFloat, offColor: Color) {
        self.bitSize = bitSize
        self.quarterOfBitSize = bitSize / 4
        self.offColor = offColor
    }
    
    var body: some View {
        VStack(spacing: quarterOfBitSize) {
            ForEach(0..<7) { _ in
                RoundedRectangle(cornerSize: CGSize(width: quarterOfBitSize, height: quarterOfBitSize), style: .continuous)
                    .foregroundStyle(offColor)
                    .frame(width: bitSize, height: bitSize)
            }
        }
    }
}


extension ElectronicBulletinBoardView {
    init(
        text: String,
        width acceptWidth: CGFloat,
        onColor: Color = .orange,
        offColor: Color = .init(red: 0.2, green: 0.2, blue: 0.2)
    ) {
        self.onColor = onColor
        self.offColor = offColor
        
        // メッセージを一文字ずつ分割し、charactersに追加
        var characters = [Character]()
        for i in text.indices {
            characters.append(text[i])
        }
        self.characters = characters
        
        var 列数 = 0
        for i in characters.indices {
            guard let availableCharacter = AvailableCharacters(rawValue: characters[i])
            else { fatalError() }
            列数 += availableCharacter.data.count
        }
        
        // ビッツスペーサーの列数を追加
        列数 += characters.count - 1
        
        // ビット間のスペースを何列分かで表し、列数に追加
        列数 += (列数 - 1) / 4
        
        let bitSize = acceptWidth / CGFloat(列数)
        let width = (bitSize * CGFloat(17)) + (bitSize / CGFloat(4) * CGFloat(16))
        let height = (bitSize * CGFloat(7)) + (bitSize / CGFloat(4) * CGFloat(6))
        
        self.bitSize = bitSize
        self.width = width
        self.height = height
        self.quarterOfBitSize = self.bitSize / 4
    }
}


#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        ElectronicBulletinBoardView(text: "ABC", width: 300)
    }
}
