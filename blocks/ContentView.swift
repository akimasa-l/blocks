//
//  ContentView.swift
//  blocks
//
//  Created by 劉明正 on 2024/05/05.
//

import SwiftUI

struct ContentView: View {
    @State var x: CGFloat = 0
    @State var y: CGFloat = 0
    var body: some View {
        GeometryReader{ geometry in
            // どうやらCGFloatはFloatかDoubleかのどちらからしい
            let block_width: CGFloat = 125;
            let block_height: CGFloat = 25;
            let spacing: CGFloat = 10;
            let border_width: CGFloat = 1;
            
            
            let row = Int(floor((geometry.size.width - spacing*2 - 2)/(block_width+spacing)))
            let column = min(3, Int(floor(geometry.size.height/(block_height+spacing))))
            let x_space = (geometry.size.width - border_width*2 - ((block_width+spacing)*CGFloat(row) - spacing))/2
            
            
            
            VStack{
                Grid(horizontalSpacing: spacing, verticalSpacing: spacing){
                    ForEach(0..<column, id: \.self){ _ in
                        GridRow{
                            ForEach(0..<row, id: \.self){ _ in
                                Rectangle()
                                    .frame(width: block_width, height: block_height)
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                }
                .padding(.horizontal, x_space)
                .padding(.top, 20)
                // Text("width: \(geometry.size.width), height: \(geometry.size.height)")
            }
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading
            )
            .border(.green, width:1)
            Circle()
                .foregroundColor(.blue)
                .frame(width: 50, height: 50)
                .position(x: x, y: y)
        }
    }
}
