//
//  RotatingDotsIndicatorView.swift
//  LCActivityIndicator
//
//  Created by DevLiuSir on 2020/3/26.
//

import SwiftUI

/// 旋转点指示器
///
/// - 该视图会创建 `count` 个小圆点
/// - 圆点会按照环形排列
/// - 每个圆点都会随时间进行旋转和缩放变化，形成动态旋转动画
struct RotatingDotsIndicatorView: View {
    
    /// 圆点的数量
    let count: Int
    
    var body: some View {
        GeometryReader { geometry in
            // 生成 `count` 个旋转点
            ForEach(0..<count, id: \.self) { index in
                RotatingDotsIndicatorItemView(index: index, size: geometry.size)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

/// **单个旋转点视图**
///
/// - 该视图是一个小圆点，会沿着圆环路径运动
/// - 旋转角度和缩放效果根据索引不同而有所差异
struct RotatingDotsIndicatorItemView: View {
    
    /// 当前圆点的索引
    let index: Int
    
    /// 父容器的尺寸
    let size: CGSize
    
    /// 旋转角度
    @State private var rotation: Double = 0
    
    /// 缩放比例
    @State private var scale: CGFloat = 0
    
    var body: some View {
        /// **定义动画**
        /// - 使用 `timingCurve` 使动画更平滑
        /// - `duration: 1.5` 指定动画时长
        /// - `repeatForever(autoreverses: false)` 让动画无限循环
        let animation = Animation
            .timingCurve(0.5, 0.15 + Double(index) / 5, 0.25, 1, duration: 1.5)
            .repeatForever(autoreverses: false)
        
        Circle()
            .frame(width: size.width / 5, height: size.height / 5) // 设置圆点尺寸
            .scaleEffect(scale) // 动态缩放圆点
            .offset(y: size.width / 10 - size.height / 2) // 计算圆点沿着圆环摆放的位置
            .rotationEffect(.degrees(rotation)) // 旋转动画
            .onAppear {
                rotation = 0 // 初始旋转角度
                
                // **初始化缩放比例**
                // - `scale = (5 - CGFloat(index)) / 5` 使不同索引的点大小不同
                scale = (5 - CGFloat(index)) / 5
                
                /// 执行动画
                withAnimation(animation) {
                    rotation = 360 // 旋转 360度，一整圈
                    scale = (1 + CGFloat(index)) / 5    // 变换缩放比例
                }
            }
    }
}
