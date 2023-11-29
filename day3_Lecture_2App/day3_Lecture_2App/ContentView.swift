//
//  ContentView.swift
//  day3-Lecture 2
//
//  Created by 邹灿灿 on 2023/11/26.
//

import SwiftUI

struct ContentView: View {
    var emojArray = [
         ["👻","👿","👽","🎃","🤡","😺","🙀","😼","👺","🤠"],
         ["🥱","👩🏼‍🦱","👧","👨🏻‍🏫","🤚🏻","😺","🙀","😼","👺","🤠"],
         ["🧒🏻","👩‍🦳","👁️","👩‍🌾","👥","😺","🙀","😼","👺","🤠"],
    ]
    
    @State var cardCount = 6
    @State var arrayIndexValue = 0
    let gameTitle:String = "Meorize Game"
    var body: some View {
        VStack{
            Text(gameTitle)
                .font(.largeTitle)
                .foregroundStyle(Color.blue)
            ScrollView{
                cards
            }
            carCountAdjuster
        }
        .padding()
    }
    
    // theme adjustbutton
    func themAdjustButton (choiceid : Int ,title : String, symbol : String) -> some View {
        Button(action: {
            arrayIndexValue = choiceid
        }, label: {
            VStack{
                Image(systemName: symbol)
                Text(title).font(.system(size: 12))
            }
        })
    }
    var themAdjustButtoner: some View {
        HStack{
            themAdjustButton(choiceid: 0,title: "自然",symbol: "sun.max.circle")
            themAdjustButton(choiceid: 1,title: "人类",symbol:"person.circle")
            themAdjustButton(choiceid: 2,title: "动物",symbol: "dog.circle")
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount , id: \.self) { index in
                CardView(content: emojArray[arrayIndexValue][index])
                    .aspectRatio(1.2 , contentMode: .fit)

            }
        }
        .foregroundColor(. orange)
    }
    
    func carCountAddOrRemove(by offset : Int , symbol : String) -> some View{
        Button(action: {
                cardCount += offset
        }, label: {
            Image(systemName: symbol)
        }).disabled(cardCount + offset <  1  || cardCount + offset > emojArray[arrayIndexValue].count)
    }

    var carCountAdjuster: some View {
        HStack{
            carCountAddOrRemove(by : -1 ,symbol: "rectangle.stack.fill.badge.minus")
            Spacer()
            themAdjustButtoner
            Spacer()
            carCountAddOrRemove(by : +1 ,symbol: "rectangle.stack.fill.badge.plus")
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUP  = false
    var body: some View {
        ZStack {
            let base  = RoundedRectangle(cornerRadius: 12) //Type inference
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2.0)
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
