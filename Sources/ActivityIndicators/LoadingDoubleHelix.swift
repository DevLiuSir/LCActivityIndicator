//
//  LoadingDoubleHelix.swift
//  LCActivityIndicator
//
//  Created by DevLiuSir on 2020/3/26.
//

import SwiftUI


/// 双螺旋形状的加载动画
/// - 该视图通过两个 HStack 上的圆形组成双螺旋动画效果，每一组圆点上下交替地进行动画，呈现出螺旋旋转的效果。
struct LoadingDoubleHelix: View {
    
    /// 控制动画是否启动的状态
    @State var isAnimating: Bool = false
    
    /// 动画的持续时间
    let timing: Double
    
    /// 圆点的最大数量
    var maxCounter: Int
    
    /// 视图的尺寸
    let frame: CGSize
    
    /// 圆点的颜色
    let primaryColor: Color
    
    /// 初始化视图
    /// - Parameters:
    ///   - color: 圆点的颜色，默认是黑色
    ///   - size: 视图的大小，默认是 50
    ///   - speed: 动画的速度，默认是 0.5
    ///   - count: 圆点的数量，默认是 10
    init(color: Color = .black, size: CGFloat = 50, speed: Double = 0.5, count: Int = 10) {
        self.primaryColor = color
        self.frame = CGSize(width: size, height: size)
        self.timing = speed * 2
        self.maxCounter = count
    }
    
    var body: some View {
        ZStack {
            // 上半部分的圆形动画
            HStack(spacing: frame.width / 40) {
                ForEach(0..<maxCounter, id: \.self) { index in
                    Circle()
                        .fill(primaryColor) // 填充颜色
                        .offset(y: isAnimating ? frame.height / 6 : -frame.height / 6) // 垂直偏移，产生上下浮动效果
                        .animation(
                            Animation
                                .easeInOut(duration: timing) // 设置动画效果和时长
                                .repeatForever(autoreverses: true) // 循环动画
                                .delay(timing / Double(maxCounter) * Double(index)), value: isAnimating) // 为每个圆形设置延迟，交替动画
                        .scaleEffect(isAnimating ? 1.0 : 0.8) // 圆形的缩放效果
                        .opacity(isAnimating ? 1.0 : 0.8) // 圆形的透明度变化
                        .animation(
                            Animation.easeInOut(duration: timing) // 设置透明度变化的动画
                                .repeatForever(autoreverses: true), value: isAnimating) // 循环动画
                }
            }
            
            // 下半部分的圆形动画，效果与上半部分相反
            HStack(spacing: frame.width / 40) {
                ForEach(0..<maxCounter, id: \.self) { index in
                    Circle()
                        .fill(primaryColor) // 填充颜色
                        .offset(y: isAnimating ? -frame.height / 6 : frame.height / 6) // 垂直偏移，产生上下浮动效果
                        .animation(
                            Animation
                                .easeInOut(duration: timing) // 设置动画效果和时长
                                .repeatForever(autoreverses: true) // 循环动画
                                .delay(timing / Double(maxCounter) * Double(index)), value: isAnimating) // 为每个圆形设置延迟，交替动画
                        .scaleEffect(isAnimating ? 0.8 : 1.0) // 圆形的缩放效果
                        .opacity(isAnimating ? 0.8 : 1.0) // 圆形的透明度变化
                        .animation(
                            Animation.easeInOut(duration: timing) // 设置透明度变化的动画
                                .repeatForever(autoreverses: true), value: isAnimating) // 循环动画
                }
            }
            
        }
        .frame(width: frame.width, height: frame.height, alignment: .center) // 设置视图的宽高
        .onAppear {
            // 视图加载时启动动画
            isAnimating.toggle()
        }
    }
}
