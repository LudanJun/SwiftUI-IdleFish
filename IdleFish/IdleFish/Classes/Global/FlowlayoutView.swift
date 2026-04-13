//
//  FlowlayoutView.swift
//  IdleFish
//
//  Created by Mac Mini on 2026/4/13.
//

import SwiftUI

struct FLowLayoutView<Content: View, T: Identifiable>: View where T: Hashable {
    // 数据源,一个泛型模型组
    var list: [T]

    // 这指定网格中的数列
    var colums: Int

    // 用来控制item横向间距
    var itemSpacingH: CGFloat
    // 用来控制item纵向间距
    var itemSpacingV: CGFloat

    // 这里定义一个content，后面会暴露在init方法中，用来自定义网格的每个item的布局
    var content: (T) -> Content

    // 声明一个方法,用来对数据源重新组合,以符号当前结构使用
    private func splistList() -> [[T]] {
        var currIndex: Int = 0

        // 声明一个数组,该数组有colums个元素,每个元素的类型为[T]
        var gridList: [[T]] = Array(repeating: [], count: colums)

        list.forEach { obj in
            gridList[currIndex].append(obj)
            if currIndex == colums - 1 {
                currIndex = 0
            } else {
                currIndex += 1
            }
        }

        return gridList
    }

    init(list: [T], colums: Int, itemSpacingH: CGFloat = 10, itemSpacingV: CGFloat = 10, @ViewBuilder content: @escaping (T) -> Content) {
        self.list = list
        self.colums = colums
        self.itemSpacingH = itemSpacingH
        self.itemSpacingV = itemSpacingV
        self.content = content
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            HStack(alignment: .top, spacing: itemSpacingH) {
                ForEach(splistList(), id: \.self) {
                    objs in
                    LazyVStack(spacing: itemSpacingV) { ForEach(objs) { obj in
                        content(obj)
                    }}
                }
            }
        }
        //禁止滚动
        //.scrollDisabled(true)
    }
}
