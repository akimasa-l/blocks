//
//  ContentView.swift
//  blocks
//
//  Created by 劉明正 on 2024/05/05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader{ geometry in
            let column = min(3, Int(floor(geometry.size.height/25)))
            let row = Int(floor(geometry.size.width/105))
            let x_space = (geometry.size.width - CGFloat(row * 105 - 5))/2
            
            VStack{
                Grid(horizontalSpacing: 5, verticalSpacing: 5){
                    ForEach(0..<column,id: \.self){ _ in
                        GridRow{
                            ForEach(0..<row,id: \.self){ _ in
                                Rectangle().frame(width: 100,height: 20).foregroundColor(.blue)
                            }
                        }
                    }
                }.padding([.leading, .trailing], x_space)
                Text("width: \(geometry.size.width), height: \(geometry.size.height)")
            }
        }
    }
}
