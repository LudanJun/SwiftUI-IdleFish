//
//  HomeSearchHotKeywordView.swift
//  IdleFish
//
//  Created by Mac Mini on 2026/4/2.
//

import SwiftUI

struct HomeSearchHotKeywordView: View {
    // 一个定时器每三秒触发一次 main在主线程更新UI    autoconnect自动开启定时器
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    private let ITEM_HEIGHT: CGFloat = 40

    // 当前显示第几个
    @State private var currentIndex: Int = 0

    // 数据后期是一个模型数组,通过网络获取
    let hotKeywords: [String] = ["春风250", "苹果笔记本", "iPhone 17", "索尼单反", "Mac Mini M4", "27寸显示器"]

    // 接下来实现无缝的轮播,准备一个新的数组
    private var loopHotKeywords: [String] {
        /**
         假设原数组是：
         [A, B, C, D, E, F]
         构造后变成：
         [F, A, B, C, D, E, F, A]
         为什么要这样？
         滚动到 最后一个 F 时，能瞬间切回 A
         滚动到 第一个 F 时，能瞬间切回 E
         视觉上永远连续、永远无缝、不会回弹、不会闪
         */
        return [hotKeywords.last!] + hotKeywords + [hotKeywords.first!]
    }

    var body: some View {
        let currentOffsetY = CGFloat(currentIndex) * ITEM_HEIGHT
        
        //添加这个控件 文字靠左才能显示
        GeometryReader {
            _ in
            VStack(alignment: .leading, spacing: 0) {
                ForEach(loopHotKeywords, id: \.self) {
                    hotKeyword in
                    Text(hotKeyword)
                        .foregroundColor(Color.black.opacity(0.5))
                        .font(.system(size: 14, weight: .bold))
                        .frame(height: ITEM_HEIGHT)
                }
            }
        }
        .frame(height: ITEM_HEIGHT, alignment: .top)
        .frame(maxWidth: .infinity)
        .offset(x: 0, y: -currentOffsetY)
        .clipped() // 切掉超出父容器范围的内容，只显示框框里面的部分！
        // 定时器触发,执行的内容
        .onReceive(timer) { _ in
            // 添加一个动画效果
            withAnimation(.spring()) {
                // 在这里实现热词滚动,实际上就是计算当前要显示的热词的index,然后利用index计算出y轴偏移量
                if currentIndex == loopHotKeywords.count - 1 {
                    currentIndex = 0
                } else {
                    currentIndex += 1
                }
            }
        }
        // onChange监听currentIndex的变化,在这里对currentIndex进行操作,达到无缝轮播的目的
        .onChange(of: currentIndex) { _, newValue in
            /*
             瞬间切换 index，用户完全看不见，实现无限循环！
             举例：
             数组：[F, A, B, C, D, E, F, A]
             滚到 index 0（F） → 瞬间跳到 index 6（F）
             滚到 index 7（A） → 瞬间跳到 index 1（A）
             */
            if newValue == 0 {
                // 滚到了最前面的假数据（F）→ 瞬间跳到真实最后一条
                currentIndex = loopHotKeywords.count - 2
            } else if newValue == loopHotKeywords.count - 1 {
                //// 滚到了最后面的假数据（A）→ 瞬间跳到真实第一条
                currentIndex = 1
            }
        }
    }
}

#Preview {
    HomeSearchHotKeywordView()
}
