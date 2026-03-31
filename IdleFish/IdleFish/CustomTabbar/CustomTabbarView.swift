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
                
                //接下来插入发布闲置的按钮
            }
        }
    }
}

// #Preview {
////    CustomTabbarView()
//    ContentView()
// }
