//
//  ContentView.swift
//  day3-Lecture 2
//
//  Created by 邹灿灿 on 2023/11/26.
//

import SwiftUI

struct ContentView: View {
    let emojs = ["👻","👿","👽","🎃","🤡","😺","🙀","😼","👺","🤠"]
    @State var cardCount = 3
    var body: some View {
        VStack{
            ScrollView{
                cards
            }
            carCountAdjuster
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount , id: \.self) { index in
                CardView(content: emojs[index])
                    .aspectRatio(2/3 , contentMode: .fit)
            }
        }
        .foregroundColor(. orange)
    }
    
    func carCountAddOrRemove(by offset : Int , symbol : String) -> some View{
        Button(action: {
                cardCount += offset
        }, label: {
            Image(systemName: symbol)
        }).disabled(cardCount + offset <  1  || cardCount + offset > emojs.count)
    }
    
    var carCountAdjuster: some View {
        HStack{
            carCountAddOrRemove(by : +1 ,symbol: "rectangle.stack.fill.badge.plus")
            Spacer()
            carCountAddOrRemove(by : -1 ,symbol: "rectangle.stack.fill.badge.minus")
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUP  = true
    var body: some View {
        ZStack {
            let base  = RoundedRectangle(cornerRadius: 12) //Type inference
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 1.0)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUP ? 1 : 0)
            base.fill(.orange).opacity(isFaceUP ? 0 : 1)
          
        }.onTapGesture {
            //Bool has a function called toggle
            isFaceUP.toggle()
        }
    }
}

#Preview {
    ContentView()
}
