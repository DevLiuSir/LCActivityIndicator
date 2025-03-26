//
//  PulseCircleIndicatorView.swift
//  LCActivityIndicator
//
//  Created by DevLiuSir on 2020/3/26.
//

import SwiftUI


/// 脉冲圆形指示器
struct PulseCircleIndicatorView: View {

    @State private var scale: CGFloat = 0
    @State private var opacity: Double = 0

    var body: some View {
        let animation = Animation
            .easeIn(duration: 1.1)
            .repeatForever(autoreverses: false)

        return Circle()
            .scaleEffect(scale)
            .opacity(opacity)
            .onAppear {
                scale = 0
                opacity = 1
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                    withAnimation(animation) {
                        scale = 1
                        opacity = 0
                    }
                }
            }
    }
}
