//
//  HomeView.swift
//  IdleFish
//
//  Created by Mac Mini on 2026/4/1.
//

import SwiftUI
struct HomeView: View {
//    @State var currHomeNavTab: HomeNavTab = .attention // 默认关注界面
    @StateObject var locationManager =  LocationManager()
    @StateObject var homeVM: HomeViewModel = HomeViewModel()
    var body: some View {
        //自定义导航头
        GeometryReader {
            proxy in
            VStack {
                HomeNavView()
                    .environmentObject(locationManager)
                    .frame(maxWidth: .infinity)
                    .environmentObject(homeVM)

                // 在这里添加标签对应的view
                ScrollView(.horizontal, showsIndicators: false) {
                    TabView(selection: $homeVM.currHomeNavTab) {
                        Color.orange
                            .tag(HomeNavTab.attention)
                            .frame(maxHeight: .infinity)
                        Color.blue
                            .tag(HomeNavTab.recommend)
                             .frame(maxHeight: .infinity)
                        Color.yellow
                            .tag(HomeNavTab.location)
                             .frame(maxHeight: .infinity)
                    }
                    .frame(width: proxy.size.width)
                    //指定为分页样式,并且不显示分页指示器
                    .tabViewStyle(.page(indexDisplayMode: .never))

                }
                .frame(maxHeight: .infinity, alignment: .top)
                .onAppear{
                    locationManager.manager.requestLocation()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
