//
//  FlickeringDotsIndicatorView.swift
//  LCActivityIndicator
//
//  Created by DevLiuSir on 2020/3/26.
//

import SwiftUI

/// **闪烁点指示器**
///
/// 该组件显示一组动态闪烁的点，可用于加载指示器或音频可视化效果。
struct FlickeringDotsIndicatorView: View {
    
    /// **点的数量**
    let count: Int
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {   // 确保所有点放置在同一层级
                ForEach(0..<count, id: \.self) { index in
                    FlickeringDotsIndicatorItemView(index: index, count: count, size: geometry.size)
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

/// **单个闪烁点**
///
/// 该视图用于生成一个会动态缩放和闪烁的圆点，并根据索引控制动画延迟。
struct FlickeringDotsIndicatorItemView: View {
    
    /// **当前点的索引**
    let index: Int
    
    /// **点的总数量**
    let count: Int
    
    /// **父容器的尺寸**
    let size: CGSize
    
    /// **缩放比例状态**
    @State private var scale: CGFloat = 1.0
    
    /// **透明度状态**
    @State private var opacity: Double = 1.0
    
    var body: some View {
        
        let duration = 0.5
        
        /// **单个点的大小**
        let itemSize = size.height / 5
        
        /// **计算点的偏移角度**
        let angle = 2 * CGFloat.pi / CGFloat(count) * CGFloat(index)
        let x = (size.width / 2 - itemSize / 2) * cos(angle)
        let y = (size.height / 2 - itemSize / 2) * sin(angle)
        
        /// **定义动画**
        let animation = Animation.linear(duration: duration)
            .repeatForever(autoreverses: true)
            .delay(duration * Double(index) / Double(count) * 2)
        
        Circle()
            .frame(width: itemSize, height: itemSize)
            .scaleEffect(scale)      // 绑定缩放比例
            .opacity(opacity)        // 绑定透明度
            .onAppear {
                withAnimation(animation) {
                    scale = 0.5
                    opacity = 0.3
                }
            }
            .offset(x: x, y: y)
    }
}
