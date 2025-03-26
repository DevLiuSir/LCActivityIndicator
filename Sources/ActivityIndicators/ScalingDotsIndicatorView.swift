//
//  ScalingDotsIndicatorView.swift
//  LCActivityIndicator
//
//  Created by DevLiuSir on 2020/3/26.
//

import SwiftUI

/// 缩放点指示器
///
/// 该组件显示一组动态缩放的圆点，可用于加载指示器或动画效果。
struct ScalingDotsIndicatorView: View {
    
    /// **点的数量**
    let count: Int
    
    /// **点之间的间距**
    let spacing: Int
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: CGFloat(spacing)) {
                /// 生成多个缩放点
                ForEach(0..<count, id: \.self) { index in
                    ScalingDotsIndicatorItemView(index: index, count: count, inset: spacing, size: geometry.size)
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

/// 单个缩放点
///
/// 该视图用于生成一个会动态缩放的圆点，并根据索引控制动画延迟。
struct ScalingDotsIndicatorItemView: View {
    
    /// 当前点的索引
    let index: Int
    
    /// 点的总数量
    let count: Int
    
    /// 点之间的间距
    let inset: Int
    
    /// 父容器的尺寸
    let size: CGSize
    
    /// 缩放比例状态
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        /// 计算单个点的大小
        let itemSize = (size.width - CGFloat(inset) * CGFloat(count - 1)) / CGFloat(count)
        
        /// 定义动画
        let animation = Animation.easeOut
            .repeatForever(autoreverses: true)
            .delay(Double(index) / Double(count) / 2)
        
        Circle()
            .frame(width: itemSize, height: itemSize)
            .scaleEffect(scale)     // 绑定缩放比例
            .onAppear {
                /// 使用 `withAnimation` 触发动画，防止首次渲染问题
                withAnimation(animation) {
                    scale = 0.3
                }
            }
            .offset(x: (itemSize + CGFloat(inset)) * CGFloat(index) - size.width / 2 + itemSize / 2)
    }
}
