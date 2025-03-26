<p align="center">
<img src="./Design/Icon.png" width=200>

<p align="center"> <b> LCActivityIndi​​cator 是一个使用 SwiftUI 创建的可移植框架，具有许多预设的加载指示器！</b></p>


<p align="center">
  <a href="https://swiftpackageindex.com/DevLiuSir/LCActivityIndicator">
        <img src="https://img.shields.io/endpoint?url=https://swiftpackageindex.com/api/packages/DevLiuSir/LCActivityIndicator/badge?type=swift-versions" alt="Swift Versions">
    </a>
    <a href="https://swiftpackageindex.com/DevLiuSir/LCActivityIndicator">
        <img src="https://img.shields.io/endpoint?url=https://swiftpackageindex.com/api/packages/DevLiuSir/LCActivityIndicator/badge?type=platforms" alt="Supported Platforms">
    </a>
    
<img src="https://badgen.net/badge/icon/apple?icon=apple&label">
<img src="https://img.shields.io/badge/language-swift-orange.svg">
<img src="https://img.shields.io/badge/macOS-13-blue.svg">
<img src="https://img.shields.io/badge/build-passing-brightgreen">
<img src="https://img.shields.io/github/languages/top/DevLiuSir/LCActivityIndicator?color=blueviolet">
<img src="https://img.shields.io/github/license/DevLiuSir/LCActivityIndicator.svg">
<img src="https://img.shields.io/github/languages/code-size/DevLiuSir/LCActivityIndicator?color=ff69b4&label=codeSize">
<img src="https://img.shields.io/github/repo-size/DevLiuSir/LCActivityIndicator">
<img src="https://img.shields.io/github/last-commit/DevLiuSir/LCActivityIndicator">
<img src="https://img.shields.io/github/commit-activity/m/DevLiuSir/LCActivityIndicator">
<img src="https://img.shields.io/github/stars/DevLiuSir/LCActivityIndicator.svg?style=social&label=Star">
<img src="https://img.shields.io/github/forks/DevLiuSir/LCActivityIndicator?style=social">
<img src="https://img.shields.io/github/watchers/DevLiuSir/LCActivityIndicator?style=social">
<a href="https://twitter.com/LiuChuan_"><img src="https://img.shields.io/twitter/follow/LiuChuan_.svg?style=social"></a>
</p>

---

### 设计
<p align="center">
<img align="center" src="Design/Preview.gif" width=500>
</p>



## 用法

```swift
public enum LCIndicatorType {
    case `default`(count: Int)
    case threeBallsRotation(Color, size: CGFloat)
    case threeBallsTriangle(Color, size: CGFloat)
    case threeBallsBouncing(Color, size: CGFloat, speed: CGFloat)
    case doubleHelix(Color, size: CGFloat, count: Int)
    case arcs(count: Int, lineWidth: CGFloat)
    case rotatingDots(count: Int)
    case flickeringDots(count: Int)
    case scalingDots(count: Int, spacing: Int)
    case audioWaveEqualizer(Color, count: Int)
    case equalizer(count: Int)
    case growingArc(Color, lineWidth: CGFloat)
    case pulseCircle
    case accordion(count: Int)
    case gradient(colors: [Color], lineCap: CGLineCap, lineWidth: CGFloat)
}
```




- 默认类型，传入点的数量

```swift
LCActivityIndicator(isVisible: $isAnimate, type: .default(count: 8))
```


- 三个点旋转动画

```swift
LCActivityIndicator(isVisible: $isAnimate, type: .threeBallsRotation(.black, size: 50))
```


- 三个点形成三角形的旋转动画

```swift
LCActivityIndicator(isVisible: $isAnimate, type: .threeBallsTriangle(.black, size: 50))
```

- 三个点上下弹跳动画

```swift
LCActivityIndicator(isVisible: $isAnimate, type: .threeBallsBouncing(.black, size: 50, speed: 0.5))
```


- 双螺旋动画

```swift
LCActivityIndicator(isVisible: $isAnimate, type: .doubleHelix(.black, size: 150, count: 10))
```


- 弧形指示器，创建多个弧线

```swift
LCActivityIndicator(isVisible: $isAnimate, type: .arcs(count: 3, lineWidth: 2))
```

- 旋转点指示器，多个点旋转

```swift
LCActivityIndicator(isVisible: $isAnimate, type: .rotatingDots(count: 5))
```


- 闪烁点指示器，点在变化中不断闪烁

```swift
LCActivityIndicator(isVisible: $isAnimate, type: .flickeringDots(count: 8))
```

- 缩放点指示器，点会缩放变化

```swift
LCActivityIndicator(isVisible: $isAnimate, type: .scalingDots(count: 3, spacing: 2))
```

- 音乐波形均衡器，基于声音频率的动态均衡器

```swift
LCActivityIndicator(isVisible: $isAnimate, type: .audioWaveEqualizer(.black, count: 6))
```

- 等效器指示器，显示类似音频频率的动态条

```swift
LCActivityIndicator(isVisible: $isAnimate, type: .equalizer(count: 6))
```

- 增长弧形指示器，弧形不断增长

```swift
LCActivityIndicator(isVisible: $isAnimate, type: .growingArc(.black, lineWidth: 10))
```

- 脉冲圆形指示器，圆形随着时间不断变化

```swift
LCActivityIndicator(isVisible: $isAnimate, type: .pulseCircle)
```


- 手风琴指示器，多个条形在不同高度之间跳动

```swift
LCActivityIndicator(isVisible: $isAnimate, type: .accordion(count: 5))
```


- 渐变指示器，圆形的渐变效果

```swift
LCActivityIndicator(isVisible: $isAnimate, type: .gradient(colors: [.white, .black], lineCap: .round, lineWidth: 10))
```


## 安装

#### SwiftPackage

Add `https://github.com/DevLiuSir/LCActivityIndicator.git` in the [“Swift Package Manager” tab in Xcode](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app).


## 许可证

MIT License

Copyright (c) 2025 Marvin


## 作者

| [<img src="https://avatars2.githubusercontent.com/u/11488337?s=460&v=4" width="120px;"/>](https://github.com/DevLiuSir)  |  [DevLiuSir](https://github.com/DevLiuSir)<br/><br/><sub>Software Engineer</sub><br/> [<img align="center" src="https://cdn.jsdelivr.net/npm/simple-icons@3.0.1/icons/twitter.svg" height="20" width="20"/>][1] [<img align="center" src="https://cdn.jsdelivr.net/npm/simple-icons@3.0.1/icons/github.svg" height="20" width="20"/>][2] [<img align="center" src="https://raw.githubusercontent.com/iconic/open-iconic/master/svg/globe.svg" height="20" width="20"/>][3]|
| :------------: | :------------: |

[1]: https://twitter.com/LiuChuan_
[2]: https://github.com/DevLiuSir
[3]: https://devliusir.com/

