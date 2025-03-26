//
//  EqualizerIndicatorView.swift
//  LCActivityIndicator
//
//  Created by DevLiuSir on 2020/3/26.
//

import SwiftUI

/// 均衡器指示器
struct EqualizerIndicatorView: View {
    
    /// 均衡器柱形的数量
    let count: Int
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: geometry.size.width / CGFloat(count) / 2) {
                /// 生成多个均衡器柱形
                ForEach(0..<count, id: \.self) { index in
                    EqualizerIndicatorItemView(index: index, count: count, size: geometry.size)
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

/// 单个均衡器柱形
///
/// 该视图用于生成一个动态跳动的均衡器柱形，动画效果由索引控制。
struct EqualizerIndicatorItemView: View {
    
    /// 当前柱形的索引
    let index: Int
    
    /// 柱形总数量
    let count: Int
    
    /// 父容器的尺寸
    let size: CGSize
    
    /// 缩放比例状态
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        /// 计算单个柱形的宽度
        let itemSize = size.width / CGFloat(count) / 2
        
        /// 定义动画
        let animation = Animation.easeOut
            .repeatForever(autoreverses: true) // 无限循环且来回缩放
            .delay(Double(index) * 0.1) // 让每个柱形依次跳动
        
        RoundedRectangle(cornerRadius: 3)
            .frame(width: itemSize, height: size.height)
            .scaleEffect(x: 1, y: scale, anchor: .center) /// 仅缩放高度
            .onAppear {
                /// 启动动画
                withAnimation(animation) {
                    scale = 0.4
                }
            }
    }
}
