//
//  CustomTabbarView.swift
//  IdleFish
//
//  Created by Mac Mini on 2026/3/31.
//

// 导入图片库
import SDWebImageSwiftUI
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
                        // 闲鱼应用的TabBar在切换之后,会有一个动画播放的效果,这里也实现以下
                        // 要实现动图效果,就需要借助SDWebImageSwiftUI来实现
                        // Image相当于UIImageView
                        if currTab == item {
                            AnimatedImage(name: "tabbar_animation.gif")
                                // 闲鱼上切换tabbar之后动画只会播放一次
                                .customLoopCount(1)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35, height: 35)

                        } else {
//                            Image(currTab == item ?item.selIconName : item.norIconName)
                            Image(item.norIconName)
                        }

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
        .padding(.top, 20)
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

                     path.addCurve(to: CGPoint(x: midWidth, y: 0), control1: CGPoint(x: midWidth - 35, y: 20), control2: CGPoint(x: midWidth - 25, y: 0))

                     path.addCurve(to: CGPoint(x: midWidth + 55, y: 20), control1: CGPoint(x: midWidth + 25, y: 0), control2: CGPoint(x: midWidth + 35, y: 20))

                     path.addLine(to: CGPoint(x: width, y: 20))

                     path.addLine(to: CGPoint(x: width, y: height))
                     path.addLine(to: CGPoint(x: 0, y: height))

                 }, with: .color(.white))
             }
         )
         
        // 在低版本上实现凸起按钮
        // 闲鱼应用的TabBar在切换之后,会有一个动画播放的效果,这里也实现以下
//        .background(Color.white.clipShape(CustomTabBackColorClipShape()))
    }
}

#Preview {
//     CustomTabbarView(safeEdgeInsets: <#EdgeInsets#>, currTab: <#Binding<CustomTabbar>#>)
//    ContentView()
}

// 这里可以实现按照指定形状对view进行切割
struct CustomTabBackColorClipShape: Shape {
    func path(in rect: CGRect) -> Path {
        let width = rect.size.width
        let height = rect.size.height
        let midWidth = width * 0.5

        // 同样使用贝塞尔曲线
        return Path { path in
            // 1. 起点：左上角往下 20
            path.move(to: CGPoint(x: 0, y: 20))
            // 2. 画线到凸起左侧起点
            path.addLine(to: CGPoint(x: midWidth - 55, y: 20))
            // 3. 左侧曲线 → 顶部中心点
            path.addCurve(to: CGPoint(x: midWidth, y: 0), control1: CGPoint(x: midWidth - 35, y: 20), control2: CGPoint(x: midWidth - 25, y: 0))
            // 4. 右侧曲线 → 右侧结束点
            path.addCurve(to: CGPoint(x: midWidth + 55, y: 20), control1: CGPoint(x: midWidth + 25, y: 0), control2: CGPoint(x: midWidth + 35, y: 20))
            // 5. 向右画到最右边 ✅ 修复：用 rect 而不是 size
            path.addLine(to: CGPoint(x: width, y: 20))
            // 6. 向下画到右下角
            path.addLine(to: CGPoint(x: width, y: height))
            // 7. 向左画到左下角
            path.addLine(to: CGPoint(x: 0, y: height))
//            // 8. 闭合路径（必须加，不然形状会破）
//            path.closeSubpath()
        }
    }
}
