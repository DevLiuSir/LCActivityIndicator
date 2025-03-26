//
//  AudioEqualizer.swift
//  LCActivityIndicator
//
//  Created by DevLiuSir on 2020/3/26.
//
import SwiftUI

/// 音频均衡器
struct AudioWaveEqualizer: View {
    
    /// 均衡器柱形的数量
    let count: Int
    /// 颜色
    let color: Color
    
    @State private var isAnimating: Bool = true
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: geometry.size.width / CGFloat(self.count) / 2) {
                // 生成多个均衡器柱形
                ForEach(0..<self.count, id: \.self) { index in
                    AuidoEqualizerIndicatorItemView(index: index, count: self.count, size: geometry.size)
                        .foregroundColor(color)
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .onAppear {
                self.isAnimating = true // 启动动画
            }
            .onDisappear {
                self.isAnimating = false // 停止动画
            }
        }
    }
}

/// 单个均衡器柱形
struct AuidoEqualizerIndicatorItemView: View {
    
    /// 当前柱形的索引
    let index: Int
    
    /// 柱形总数量
    let count: Int
    
    /// 父容器的尺寸
    let size: CGSize
    
    /// 高度的缩放比例
    @State private var scale: CGFloat = 1.0
    
    private let durations: [Double] = [0.6, 0.8, 0.7, 0.5, 0.9] // 动画持续时间
    
    var body: some View {
        // 计算单个柱形的宽度
        let itemSize = size.width / CGFloat(count) / 2
        
        // 定义动画
        let animation = Animation.easeOut
            .repeatForever(autoreverses: true) // 无限循环且来回缩放
            .delay(Double(index) * 0.1) // 让每个柱形依次跳动
        
        Rectangle()
            .frame(width: itemSize, height: size.height)
            .scaleEffect(x: 1, y: scale, anchor: .bottom) /// 仅缩放高度，底部对齐
            .onAppear {
                // 启动动画
                withAnimation(animation) {
                    scale = 0.2
                }
            }
    }
}
