//
//  CharacterView.swift
//  ElectronicBulletinBoard
//
//  Created by Masaki Doi on 2023/10/23.
//

import SwiftUI

struct CharacterView: View {
    let data: [[Int]]
    let bitSize: CGFloat
    let quarterOfBitSize: CGFloat
    let onColor: Color
    let offColor: Color
    
    var body: some View {
        HStack(spacing: quarterOfBitSize) {
            ForEach(data.indices, id: \.self) { i in
                VStack(spacing: quarterOfBitSize) {
                    ForEach(0..<7) { j in
                        let isOn = !(data[i].isEmpty) && data[i].contains(j)
                        RoundedRectangle(cornerSize: CGSize(width: quarterOfBitSize, height: quarterOfBitSize), style: .continuous)
                            .foregroundStyle(isOn ? onColor : offColor)
                            .frame(width: bitSize, height: bitSize)
                    }
                }
            }
        }
    }
}

extension CharacterView {
    init(data: [[Int]], bitSize: CGFloat, onColor: Color, offColor: Color) {
        self.data = data
        self.bitSize = bitSize
        self.quarterOfBitSize = bitSize / 4
        self.onColor = onColor
        self.offColor = offColor
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        CharacterView(data: AvailableCharacters.p.data, bitSize: 50, onColor: .orange, offColor: .init(red: 0.1, green: 0.1, blue: 0.1))
    }
}
