//
//  LCIndicatorType.swift
//  LCActivityIndicator
//
//  Created by DevLiuSir on 2020/3/26.
//


import SwiftUI

/// 动画类型枚举
public enum LCIndicatorType {
    
    /// 默认类型，传入点的数量
    case `default`(count: Int)
    
    /// 弧形指示器，创建多个弧线
    case arcs(count: Int, lineWidth: CGFloat)
    
    /// 旋转点指示器，多个点旋转
    case rotatingDots(count: Int)
    
    /// 闪烁点指示器，点在变化中不断闪烁
    case flickeringDots(count: Int)
    
    /// 缩放点指示器，点会缩放变化
    case scalingDots(count: Int, spacing: Int)
    
    /// 透明度点指示器，点的透明度不断变化
    case opacityDots(count: Int, inset: Int)
    
    /// 音乐波形均衡器，基于声音频率的动态均衡器
    case audioWaveEqualizer(Color, count: Int)
    
    /// 等效器指示器，显示类似音频频率的动态条
    case equalizer(count: Int)
    
    /// 增长弧形指示器，弧形不断增长
    case growingArc(Color, lineWidth: CGFloat)
    
    /// 脉冲圆形指示器，圆形随着时间不断变化
    case pulseCircle
    
    /// 手风琴指示器，多个条形在不同高度之间跳动
    case accordion(count: Int)
    
    /// 渐变指示器，圆形的渐变效果
    case gradient(colors: [Color], lineCap: CGLineCap, lineWidth: CGFloat)
}
