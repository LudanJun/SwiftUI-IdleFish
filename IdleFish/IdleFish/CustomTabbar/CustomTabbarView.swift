//
//  CustomTabbarView.swift
//  IdleFish
//
//  Created by Mac Mini on 2026/3/31.
//

import SwiftUI

/// 自定义tabbar的enum
enum CustomTabbar: String, CaseIterable {
    case home = "闲鱼"
    case niceplay = "会玩"
    case message = "消息"
    case mine = "我的"

    // TabbarItem的图标名称
    var iconName: String {
        switch self {
        case .home:
            return "tabbar_home"
        case .niceplay:
            return "tabbar_niceplay"
        case .message:
            return "tabbar_message"
        case .mine:
            return "tabbar_mine"
        }
    }

    // 默认图标
    var norIconName: String {
        return iconName + "_nor"
    }

    // 选中图标
    var selIconName: String {
        return iconName + "_sel"
    }
}

struct CustomTabbarView: View {
    // 传入安全距离
    var safeEdgeInsets: EdgeInsets

    // @Binding 表示当该变量改变时,会通知外部属性,也就是说这个值由外部传递进来的
    @Binding var currTab: CustomTabbar

    var body: some View {
        // 遍历CustomTabbar的子项,实现tabbaritem布局
        // HStack是一个水平布局,这类容器对内部都有一个默认的间距,不希望使用的话就可以设置为0
        HStack(spacing: 0) {
            ForEach(CustomTabbar.allCases, id: \.rawValue) {
                item in

                // 自定义tabbBar需要可以点击
                Button {
                    currTab = item
                } label: {
                    VStack {
                        // Image相当于UIImageView
                        Image(currTab == item ?item.selIconName : item.norIconName)

                        Text(item.rawValue)
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(Color.black.opacity(currTab == item ? 0.7 : 0.3))
                    }
                }

                // 让tabbarItem宽度等分
                .frame(maxWidth: .infinity)

                // 接下来插入发布闲置的按钮
                if item == .niceplay {
                    Button {
                    } label: {
                        Image("tabbar_post_idle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 75, height: 75)
                        // 重新制定按钮图片的大小
                    }
                    // 让发布按钮向上10
                    .offset(y: -10)
                }
            }
        }
        .padding(.top, 10)
        // 添加边距,.bottom表示添加底部边距,考虑到有些机型不需要这个间距,添加一个默认间距
        .padding(.bottom, safeEdgeInsets.bottom == 0 ? 10 : safeEdgeInsets.bottom)
        // 接下来修改背景色,实现圆弧效果
//        .background(Color.orange)
        .background(
            // Canvas是SwiftUI引入的新特性,仅支持iOS15以上版本
            Canvas { context, size in

                let width = size.width
                let height = size.height
                let midWidth = width * 0.5

                context.fill(Path { path in

                    //  先绘制一个矩形
                    //  接下来利用贝塞尔曲线实现,实现发布闲置按钮的凸起
                    path.move(to: CGPoint(x: 0, y: 20))

                    path.addLine(to: CGPoint(x: midWidth - 55, y: 20))

                    path.addCurve(to: CGPoint(x: midWidth, y: 0), control1: CGPoint(x: midWidth - 35, y: 20), control2: CGPoint(x: midWidth - 15, y: 0))

                    path.addCurve(to: CGPoint(x: midWidth + 55, y: 20), control1: CGPoint(x: midWidth + 15, y: 0), control2: CGPoint(x: midWidth + 35, y: 20))

                    path.addLine(to: CGPoint(x: size.width, y: 20))

                    path.addLine(to: CGPoint(x: size.width, y: size.height))
                    path.addLine(to: CGPoint(x: 0, y: size.height))

                }, with: .color(.white))
            }
        )
    }
}

// #Preview {
////    CustomTabbarView()
//    ContentView()
// }
