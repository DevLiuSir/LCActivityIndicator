//
//  GrowingArcIndicatorView.swift
//  LCActivityIndicator
//
//  Created by DevLiuSir on 2020/3/26.
//

import SwiftUI

/// 增长弧形指示器
///
/// 该组件显示一个动态增长的弧形指示器，常用于加载动画。
struct GrowingArcIndicatorView: View {
    
    /// 弧形颜色
    let color: Color
    
    /// 线条宽度
    let lineWidth: CGFloat
    
    /// 可动画参数
    @State private var animatableParameter: Double = 0
    
    var body: some View {
        // 定义动画，使用 easeIn 动画曲线，持续 2 秒，且不反向播放
        let animation = Animation
            .easeIn(duration: 2)
            .repeatForever(autoreverses: false)
        
        // 绘制增长弧形，并应用动画
        GrowingArc(p: animatableParameter)
            .stroke(color, lineWidth: lineWidth)
            .onAppear {
                // 当视图出现时，启动动画，使参数从 0 增加到 1
                withAnimation(animation) {
                    animatableParameter = 1
                }
            }
    }
}

/// 可增长的弧形
///
/// 该 `Shape` 组件用于绘制动态增长的弧形动画。
struct GrowingArc: Shape {
    
    /// 最大弧长（弧度）
    var maxLength = 2 * Double.pi - 0.7
    
    /// 变化延迟
    var lag = 0.35
    
    /// 动画参数（范围 0 ~ 1）
    var p: Double
    
    /// SwiftUI 动画数据
    var animatableData: Double {
        get {
            return p
        }
        set {
            p = newValue
        }
    }
    
    /// 在`指定区域内``绘制路径`
    ///
    /// - Parameter rect: 绘制区域的尺寸
    /// - Returns: 生成的路径
    func path(in rect: CGRect) -> Path {
        // 将动画参数 p 范围映射到 0 到 2 之间
        let h = p * 2
        // 初始弧线的长度
        var length = h * maxLength
        
        // 根据 p 的值调整弧线的长度，达到动态变化效果
        if h > 1 && h < lag + 1 {
            length = maxLength
        }
        if h > lag + 1 {
            let coeff = 1 / (1 - lag)
            let n = h - 1 - lag
            length = (1 - n * coeff) * maxLength
        }
        
        // 定义弧形的起始和结束角度
        let startAngle = Double.pi / 2
        let endAngle = 4 * Double.pi - startAngle
        
        // 根据 p 计算弧形的结束角度
        var end = h * startAngle
        if h > 1 {
            end = startAngle + (h - 1) * endAngle
        }
        
        // 计算弧形的起始角度
        let start = end + length
        
        // 创建路径
        var path = Path()
        // 在指定区域内绘制弧形路径
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                    radius: rect.width / 2,  // 半径为容器的一半
                    startAngle: Angle(radians: start),
                    endAngle: Angle(radians: end),
                    clockwise: true)
        return path
    }
}
