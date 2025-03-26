//
//  LCActivityIndicator.swift
//  LCActivityIndicator
//
//  Created by DevLiuSir on 2020/3/26.
//

import SwiftUI


/// 活动指示器
public struct LCActivityIndicator: View {
    
    /// 控制视图是否可见
    @Binding var isVisible: Bool
    
    /// 指示器类型
    var type: LCIndicatorType
    
    // 初始化，传入视图可见状态绑定和指示器类型
    public init(isVisible: Binding<Bool>, type: LCIndicatorType) {
        _isVisible = isVisible
        self.type = type
    }
    
    
    // 根据 `isVisible` 值来显示或隐藏指示器
    public var body: some View {
        if isVisible {
            indicator
        } else {
            EmptyView()
        }
    }
    
    // MARK: - 私有视图
    
    // 根据类型返回对应的指示器视图
    private var indicator: some View {
        Group {
            switch type {
            case .default(let count):
                DefaultIndicatorView(count: count)  // 默认类型指示器
            case .arcs(let count, let lineWidth):
                ArcsIndicatorView(count: count, lineWidth: lineWidth)  // 弧形指示器
            case .rotatingDots(let count):
                RotatingDotsIndicatorView(count: count)  // 旋转点指示器
            case .flickeringDots(let count):
                FlickeringDotsIndicatorView(count: count)  // 闪烁点指示器
            case .scalingDots(let count, let spacing):
                ScalingDotsIndicatorView(count: count, spacing: spacing)  // 缩放点指示器
            case .opacityDots(let count, let inset):
                OpacityDotsIndicatorView(count: count, inset: inset)  // 透明度点指示器
            case .audioWaveEqualizer(let color, let count):
                AudioWaveEqualizer(count: count, color: color)  // 音乐波形均衡器
            case .equalizer(let count):
                EqualizerIndicatorView(count: count)  // 等效器指示器
            case .growingArc(let color, let lineWidth):
                GrowingArcIndicatorView(color: color, lineWidth: lineWidth)  // 增长弧形指示器
            case .pulseCircle:
                PulseCircleIndicatorView()  // 脉冲圆形指示器
            case .accordion(let count):
                AccordionView(count: count)  // 手风琴指示器
            case .gradient(let colors, let lineCap, let lineWidth):
                GradientIndicatorView(colors: colors, lineCap: lineCap, lineWidth: lineWidth)  // 渐变指示器
            }
        }
    }
}
