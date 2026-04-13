//
//  HomeTabView.swift
//  IdleFish
//
//  Created by Mac Mini on 2026/4/13.
//

import SwiftUI

struct HomeTabView: View {
    @EnvironmentObject var homeVM: HomeViewModel
    var body: some View {
        GeometryReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                TabView(selection: $homeVM.currHomeNavTab) {
//                    Color.orange
//                        .tag(HomeNavTab.attention)
//                        .frame(maxHeight: .infinity)
                    HomeAttentionView()
                        .tag(HomeNavTab.attention)
 
                    HomeRecommendView()
                        .tag(HomeNavTab.recommend)
                        .environmentObject(homeVM)
                        .frame(maxHeight: .infinity)
                    Color.yellow
                        .tag(HomeNavTab.location)
                        .frame(maxHeight: .infinity)
                }
                .frame(width: proxy.size.width)
                // 指定为分页样式,并且不显示分页指示器
                .tabViewStyle(.page(indexDisplayMode: PageTabViewStyle.IndexDisplayMode.never))
            }
        }
    }
}

#Preview {
    HomeTabView()
}
