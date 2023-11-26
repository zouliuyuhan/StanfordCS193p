//
//  ContentView.swift
//  day1-Lecture 1
//
//  Created by 邹灿灿 on 2023/11/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUP: true)
            CardView(isFaceUP: false)
            CardView(isFaceUP: true)
            CardView(isFaceUP: false)
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    var isFaceUP: Bool = false
    var body: some View {
        ZStack(content: {
            if isFaceUP {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2.0)
                Text("👻").font(.largeTitle)
                
            }else {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(.green)
            }
        })
    }
}

#Preview {
    ContentView()
}
