//
//  ArcsIndicatorView.swift
//  LCActivityIndicator
//
//  Created by DevLiuSir on 2020/3/26.
//

import SwiftUI


/// 弧形指示器
///
/// 该组件显示一组旋转的弧形线条，可用于加载动画或视觉效果。
struct ArcsIndicatorView: View {
    
    // 弧形的数量
    let count: Int
    
    // 弧形的线条宽度
    let lineWidth: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            ForEach(0..<count, id: \.self) { index in
                ArcsIndicatorItemView(lineWidth: lineWidth, index: index, count: count, size: geometry.size)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

/// 单个弧形指示器
///
/// 该视图用于生成一个会不断旋转的弧形，并根据索引控制旋转速度。
struct ArcsIndicatorItemView: View {
    
    // 弧形的线条宽度
    let lineWidth: CGFloat
    
    // 当前弧形的索引
    let index: Int
    
    // 弧形的总数量
    let count: Int
    
    // 父容器的尺寸
    let size: CGSize
    
    // 旋转角度状态
    @State private var rotation: Double = 0
    
    var body: some View {
        // 定义动画，速度随机，避免所有弧形同时旋转导致动画不自然
        let animation = Animation.default
            .speed(Double.random(in: 0.2...0.5))
            .repeatForever(autoreverses: false)
        
        Path { path in
            // 计算弧形的半径
            let radius = size.width / 2 - CGFloat(index) * CGFloat(count)
            // 计算弧形的结束角度，范围在 120° 到 300° 之间
            let endAngle = Double(Int.random(in: 120...300))
            path.addArc(center: CGPoint(x: size.width / 2, y: size.height / 2),
                        radius: radius,
                        startAngle: .degrees(0),
                        endAngle: .degrees(endAngle),
                        clockwise: true)
        }
        .stroke(lineWidth: lineWidth) // 使用 stroke 绘制路径
        .frame(width: size.width, height: size.height)
        .rotationEffect(.degrees(rotation)) // 绑定旋转角度
        .onAppear {
            rotation = 0
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                withAnimation(animation) {
                    rotation = 360 // 旋转一整圈
                }
            }
        }
    }
}
