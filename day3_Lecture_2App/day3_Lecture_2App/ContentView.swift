//
//  ContentView.swift
//  day3-Lecture 2
//
//  Created by 邹灿灿 on 2023/11/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUP: true)
            CardView(isFaceUP: false)
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    @State var isFaceUP  = true
    var body: some View {
        ZStack {
            let base  = RoundedRectangle(cornerRadius: 12) //Type inference
            if isFaceUP {
                base.fill(.white)
                base.strokeBorder(lineWidth: 1.0)
                Text("👻").font(.largeTitle)
            }else {
                base.fill(.orange)
            }
        }.onTapGesture {
            //Bool has a function called toggle
            isFaceUP.toggle()
        }
    }
}

#Preview {
    ContentView()
}
