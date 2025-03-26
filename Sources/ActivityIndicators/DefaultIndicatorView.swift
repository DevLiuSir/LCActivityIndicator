//
//  DefaultIndicatorView.swift
//  LCActivityIndicator
//
//  Created by DevLiuSir on 2020/3/26.
//

import SwiftUI


/// 默认指示器视图
///
/// 该视图会创建 `count` 个小矩形，并让它们沿着圆形路径排列。
/// 每个矩形都会依次变换透明度，形成类似旋转加载动画的效果。
struct DefaultIndicatorView: View {
    
    /// 指示器的矩形数量
    let count: Int
    
    var body: some View {
        GeometryReader { geometry in
            // 生成 `count` 个指示器元素
            ForEach(0..<count, id: \.self) { index in
                DefaultIndicatorItemView(index: index, count: count, size: geometry.size)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

/// 单个指示器矩形视图
///
/// - 该矩形会按照索引计算它在圆形路径上的位置
/// - 透明度会周期性变化，以形成动画效果
struct DefaultIndicatorItemView: View {
    
    /// 当前矩形的索引
    let index: Int
    
    /// 矩形总数量
    let count: Int
    
    /// 父容器的尺寸
    let size: CGSize
    
    /// 透明度状态
    @State private var opacity: Double = 1.0
    
    var body: some View {
        /// 矩形的高度
        let height = size.height / 3.2
        
        /// 矩形的宽度（使其保持合适比例）
        let width = height / 2
        
        /// 计算当前矩形的旋转角度（均匀分布）
        let angle = 2 * .pi / CGFloat(count) * CGFloat(index)
        
        /// 计算矩形的 x 坐标（以父视图中心为圆心）
        let x = (size.width / 2 - height / 2) * cos(angle)
        
        /// 计算矩形的 y 坐标（以父视图中心为圆心）
        let y = (size.height / 2 - height / 2) * sin(angle)
        
        /// 定义动画（循环渐变透明度）
        let animation = Animation.default
            .repeatForever(autoreverses: true)
            .delay(Double(index) / Double(count) * 0.8) // 让每个矩形依次开始动画
        
        RoundedRectangle(cornerRadius: width / 2 + 1)
            .frame(width: width, height: height)
            .rotationEffect(Angle(radians: Double(angle + CGFloat.pi / 2))) // 旋转至正确方向
            .offset(x: x, y: y) // 将矩形放置在计算出的圆形路径上
            .opacity(opacity) // 动态控制透明度
            .onAppear {
                withAnimation(animation) {
                    opacity = 0.3
                }
            }
    }
}
