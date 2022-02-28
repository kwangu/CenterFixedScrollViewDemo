//
//  ContentView.swift
//  Shared
//
//  Created by 강관구 on 2022/02/28.
//

import SwiftUI
import OffsetScrollView

struct ContentView: View {
    @State var offset: CGPoint = .zero
    @State var currentIndex = 0
    private var itemWidth: CGFloat =  100
    private var spacing: CGFloat = 10
    private var array = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    
    var body: some View {
        VStack {
            Text("offset : \(offset.x)")
                .font(.title)
            
            Text("Index : \(currentIndex)")
                .font(.title)
            
            OffsetScrollView(offset: $offset, showIndicators: false, axis: .horizontal) {
                LazyHStack {
                    ForEach(array, id:\.self) { idx in
                        Rectangle()
                        .frame(width: itemWidth, height: 100)
                        .foregroundColor(currentIndex == idx ? Color.red : Color.blue)
                        .padding(.trailing, spacing)
                    }
                }
                .padding(.horizontal, UIScreen.main.bounds.width/2)
                .onChange(of: offset) { value in
                    let tmpIndex = Int(offset.x) / Int((itemWidth + (spacing*2)))
                    self.currentIndex = tmpIndex >= array.count ? array.count-1 : tmpIndex
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
