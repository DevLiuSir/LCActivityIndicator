//
//  LoadingThreeBallsRotation.swift
//  LCActivityIndicator
//
//  Created by DevLiuSir on 2020/3/26.
//

import SwiftUI
import Combine


/// 三个点旋转视图
struct LoadingThreeBallsRotation: View {
    
    @State private var isAnimating: Bool = false
    let timing: Double
    
    private let maxCounter = 3
    
    private let primaryColor: Color
    private let size: CGFloat
    
    /// 初始化视图
    /// - Parameters:
    ///   - color: 旋转点的颜色，默认是黑色
    ///   - size: 视图的大小，默认是 50
    ///   - speed: 动画速度，默认是 0.5
    init(color: Color = .black, size: CGFloat = 20, speed: Double = 0.5) {
        self.primaryColor = color
        self.size = size
        self.timing = speed * 1.5
    }
    
    var body: some View {
        GeometryReader { geometry in
            let ballSize = min(geometry.size.width, geometry.size.height) / 3 // 计算圆点大小
            // 计算动态间距
            let spacing = max(geometry.size.width / CGFloat(maxCounter) - ballSize, 5)  // 间距的最小值为 2
            
            HStack(spacing: spacing) {
                ForEach(0..<maxCounter, id: \.self) { index in
                    Circle()
                        .fill(primaryColor)
                        .frame(width: ballSize, height: ballSize)
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)  // 确保居中显示
            .rotationEffect(Angle(degrees: isAnimating ? 180 : 0))  // 控制旋转动画
            .onAppear {
                withAnimation(Animation.easeInOut(duration: timing).repeatForever(autoreverses: false)) {
                    isAnimating = true
                }
            }
        }
        .frame(width: size, height: size)  // 设置外部视图的固定尺寸
    }
}
