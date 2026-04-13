//
//  HomeView.swift
//  IdleFish
//
//  Created by Mac Mini on 2026/4/1.
//

import SwiftUI
struct HomeView: View {
//    @State var currHomeNavTab: HomeNavTab = .attention // 默认关注界面
    @EnvironmentObject var customTabbarVM: CustomTabbarViewModel
    @StateObject var locationManager = LocationManager()
    @StateObject var homeVM: HomeViewModel = HomeViewModel()
    var body: some View {
        NavigationView {
            // 自定义导航头
            GeometryReader {
                proxy in
                VStack {
                    HomeNavView()
                        .environmentObject(locationManager)
                        .frame(maxWidth: .infinity)
                        // 传入当前环境值
                        .environmentObject(homeVM)

                    // 在这里添加标签对应的view
                    HomeTabView()
                        .environmentObject(homeVM)
                    .frame(maxHeight: .infinity, alignment: .top)
                    .onAppear {
                        locationManager.manager.requestLocation()
                        // 当界面再次返回到顶部view的时候,需要重新显示tabbar
                        customTabbarVM.atFront = true
                    }
                }
                // NavigationView默认会在头部添加navBar
                // 隐藏navBar
                // 通常一个应用从rootViewController push到子页面的时候,会隐藏底部的tabbar
                .navigationBarHidden(true)
            }
        }
    }
}

#Preview {
    ContentView()
}
