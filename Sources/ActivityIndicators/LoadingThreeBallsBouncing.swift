//
//  LoadingThreeBallsBouncing.swift
//  LCActivityIndicator
//
//  Created by DevLiuSir on 2020/3/26.
//

import SwiftUI
import Combine


/// 三个圆形上下弹跳的加载动画
/// - 该视图通过三个圆形在垂直方向上的浮动动画，模拟出弹跳效果。
struct LoadingThreeBallsBouncing: View {
    
    /// 当前激活的圆形索引
    @State var counter = 0
    
    /// 定时器，用于控制圆形弹跳的频率
    let timer: Publishers.Autoconnect<Timer.TimerPublisher>
    
    /// 动画的时长
    let timing: Double
    
    /// 圆形的数量
    var maxCounter: Int
    
    /// 视图的尺寸
    let frame: CGSize
    
    /// 圆形的颜色
    let primaryColor: Color
    
    /// 初始化视图
    /// - Parameters:
    ///   - color: 圆形的颜色，默认是黑色
    ///   - size: 视图的大小，默认是 50
    ///   - count: 圆形的数量，默认是 3
    ///   - speed: 动画的速度，默认是 0.5
    init(color: Color = .black, size: CGFloat = 50, count: Int = 3, speed: Double = 0.5) {
        // 计算动画时长，并设置定时器
        timing = speed / 2
        timer = Timer.publish(every: timing, on: .main, in: .common).autoconnect()
        
        // 设置视图的尺寸和颜色
        frame = CGSize(width: size, height: size)
        primaryColor = color
        
        // 设置圆形的数量
        self.maxCounter = count
    }
    
    var body: some View {
        // 水平排列的圆形，使用 HStack 实现
        HStack(spacing: 5) {
            ForEach(0..<maxCounter, id: \.self) { index in
                // 圆形视图
                Circle()
                    .offset(y: counter == index ? -frame.height / 10 : frame.height / 10) // 根据当前激活的圆形调整上下偏移量
                    .fill(primaryColor) // 填充圆形颜色
            }
        }
        .frame(width: frame.width, height: frame.height, alignment: .center) // 设置 HStack 的宽高
        .onReceive(timer, perform: { _ in
            // 每次定时器触发时，更新当前激活的圆形索引
            withAnimation(.easeInOut(duration: timing * 2)) {
                // 通过动画效果控制圆形索引的变换，实现圆形的浮动
                counter = counter == (maxCounter - 1) ? 0 : counter + 1
            }
        })
    }
}
