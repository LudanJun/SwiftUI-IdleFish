//
//  ContentView.swift
//  IdleFish
//
//  Created by Mac Mini on 2026/3/31.
//

import SwiftUI

struct ContentView: View {
    @StateObject var customTabbarVM: CustomTabbarViewModel = CustomTabbarViewModel()

    // @State修饰就是当该属性被改变时,会触发重新绘制界面
    @State var currTab: CustomTabbar = .home

    var body: some View {
        GeometryReader { proxy in
            // Zstack是一个z轴方向叠加的容器相当于Flutter的Stack
            ZStack(alignment: .bottom) {
                // TabView相当于UITabbarViewController 粗浅对照
                TabView(selection: $currTab) {
                    /*
                     //其中view相当于UITabBarViewController的rootViewController
                     ForEach(CustomTabbar.allCases,id:\.rawValue) {
                         item in
                         Text(item.rawValue)
                             .tag(item)
                         //为了方便调试UI 区分接线,添加一些背景色
                             .frame(maxWidth: .infinity,maxHeight: .infinity)
                             .background(Color.blue)
                     }
                     */
                    // 以下是创建好的四个View
                    HomeView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .tag(CustomTabbar.home)
                        // 把该值传过去
                        .environmentObject(customTabbarVM)
                    NicePlayView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.blue)
                        .tag(CustomTabbar.niceplay)
                    MessageView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.purple)
                        .tag(CustomTabbar.message)
                    MineView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.orange)
                        .tag(CustomTabbar.mine)
                }

                // 让CustomTabbarView相对底部有一个间距,这个距离是苹果定义的安全距离,如何获取
                // 创建自定义tabbarView,闲鱼有个凸起的圆弧 ,从这里传递绑定的属性
                CustomTabbarView(safeEdgeInsets: proxy.safeAreaInsets, currTab: $currTab)
                    // 这里采用透明度来控制tabbar的显示和隐藏,也可以使用offset来让tabbar发生偏移达到隐藏和现实的目的
                    .opacity(customTabbarVM.atFront ? 1 : 0)
            }
            // 解决底部白色部分
            .ignoresSafeArea(.all, edges: .bottom)
        }
    }
}

#Preview {
    ContentView()
}
