//
//  AccordionView.swift
//  LCActivityIndicator
//
//  Created by DevLiuSir on 2020/3/26.
//

import SwiftUI

/// 手风琴视图
struct AccordionView: View {
    
    /// 动画开关
    @State private var isAnimating: Bool = false
    
    /// 矩形的数量
    let count: Int
    
    var body: some View {
        HStack(alignment: .center, spacing: isAnimating ? 15 : 5) {
            // 根据 count 动态生成指示器
            ForEach(0 ..< count, id: \.self) { index in
                // 根据 index 是否为偶数来创建不同高度的矩形
                if index % 2 == 0 {             // 偶数
                    Capsule(style: .continuous)
                        .frame(width: 10, height: isAnimating ? 50 : 30) // 动态高度
                } else {                       // 奇数
                    Capsule(style: .continuous)
                        .frame(width: 10, height: isAnimating ? 30 : 50) // 动态高度
                }
            }
        }
        .frame(width: isAnimating ? 150 : 100)
        .animation(Animation.easeInOut(duration: 0.4)
            .repeatForever(autoreverses: true), value: isAnimating)
        .onAppear {
            self.isAnimating = true // 启动动画
        }
        .onDisappear {
            self.isAnimating = false // 停止动画
        }
    }
}
