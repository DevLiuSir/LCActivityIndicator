//
//  GradientIndicatorView.swift
//  LCActivityIndicator
//
//  Created by DevLiuSir on 2020/3/26.
//

import SwiftUI

/// 渐变指示器
///
/// 该组件显示一个旋转的渐变圆环，常用于加载动画。
struct GradientIndicatorView: View {
    
    /// 颜色渐变数组
    let colors: [Color]
    
    /// 线条端点样式
    let lineCap: CGLineCap
    
    /// 线条宽度
    let lineWidth: CGFloat
    
    /// 旋转角度状态
    @State private var rotation: Double = 0
    
    var body: some View {
        let gradientColors = Gradient(colors: colors)
        let conic = AngularGradient(gradient: gradientColors, center: .center, startAngle: .zero, endAngle: .degrees(360))
        
        let animation = Animation
            .linear(duration: 1.5)
            .repeatForever(autoreverses: false)
        
        ZStack {
            // 背景圆环（仅用于占位）
            Circle()
                .stroke(Color.clear, lineWidth: lineWidth)
            
            // 旋转的渐变圆环
            Circle()
                .trim(from: lineWidth / 500, to: 1 - lineWidth / 500)
                .stroke(conic, style: StrokeStyle(lineWidth: lineWidth, lineCap: lineCap))
                .rotationEffect(.degrees(rotation))
                .onAppear {
                    withAnimation(animation) {
                        rotation = 360
                    }
                }
        }
    }
}
