//
//  LoadingThreeBallsTriangle.swift
//  LCActivityIndicator
//
//  Created by DevLiuSir on 2020/3/26.
//

import SwiftUI
import Combine



/// 三个点形成三角形的旋转视图
/// - 视图中有三个圆形，按照等边三角形的形式排列并旋转
/// - 动画效果是三个圆形在垂直方向和水平方向上来回偏移，并且视图整体旋转
struct LoadingThreeBallsTriangle: View {
    
    /// 用于控制动画是否启动的状态
    @State private var isAnimating: Bool = false
    
    /// 动画的持续时间
    let timing: Double
    
    /// 最大的圆形数量
    private let maxCounter = 3
    
    /// 视图的尺寸
    private let frame: CGSize
    
    /// 圆形的颜色
    private let primaryColor: Color
    
    /// 初始化视图
    /// - Parameters:
    ///   - color: 旋转点的颜色，默认是黑色
    ///   - size: 视图的大小，默认是 50
    ///   - speed: 动画速度，默认是 0.5
    init(color: Color = .black, size: CGFloat = 50, speed: Double = 0.5) {
        self.primaryColor = color
        self.frame = CGSize(width: size, height: size)
        self.timing = speed * 2
    }
    
    var body: some View {
        ZStack {
            // 第一个圆，垂直方向偏移
            Circle()
                .fill(primaryColor)
                .frame(height: frame.height / 3)
                .offset(
                    x: 0,
                    y: isAnimating ? -frame.height / 3 : 0)
            
            // 第二个圆，水平和垂直方向偏移
            Circle()
                .fill(primaryColor)
                .frame(height: frame.height / 3)
                .offset(
                    x: isAnimating ? -frame.height / 3 : 0,
                    y: isAnimating ? frame.height / 3 : 0)
            
            // 第三个圆，水平和垂直方向偏移
            Circle()
                .fill(primaryColor)
                .frame(height: frame.height / 3)
                .offset(
                    x: isAnimating ? frame.height / 3 : 0,
                    y: isAnimating ? frame.height / 3 : 0)
        }
        // 设置视图的宽度和高度，并确保中心对齐
        .frame(width: frame.width, height: frame.height, alignment: .center)
        
        // 添加旋转效果，持续 360 度旋转
        .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
        
        // 启动动画并设置动画效果
        .onAppear {
            // 通过动画触发圆形位置的变化，并使其重复
            withAnimation(Animation.easeInOut(duration: timing).repeatForever(autoreverses: true)) {
                isAnimating = true
            }
        }
    }
}
