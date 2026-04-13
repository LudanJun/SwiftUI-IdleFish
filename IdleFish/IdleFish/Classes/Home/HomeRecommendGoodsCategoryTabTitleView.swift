//
//  HomeRecommendGoodsCategoryTabView.swift
//  IdleFish
//
//  Created by Mac Mini on 2026/4/13.
//

import SwiftUI

struct HomeRecommendGoodsCategoryTabTitleView: View {
    @EnvironmentObject var homeVM: HomeViewModel

    @Namespace var animation

    var body: some View {
        ZStack(alignment: .trailing) {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: Array(repeating: GridItem(.flexible(), spacing: 0), count: 1), spacing: 20) {
                    ForEach(HOME_RECOMMEND_GOODS_CATEGORY_TABS, id: \.self) {
                        tab in

                        Button {
                            homeVM.homeRecommendCurrTab = tab
                            withAnimation(.spring()) {
                                // 通过选中tab,计算出index
                                homeVM.homeRecommendCurrTabIndex = HOME_RECOMMEND_GOODS_CATEGORY_TABS.firstIndex(of: tab)!
                            }
                        } label: {
                            ZStack(alignment: .bottom) {
                                Text(tab.title)
                                    .font(.system(size: 14))
                                    .foregroundColor(Color.black.opacity(homeVM.homeRecommendCurrTab == tab ? 1 : 0.5))
                                    .frame(maxHeight: .infinity)
                                    .scaleEffect(homeVM.homeRecommendCurrTab == tab ? 1.2 : 1)
                                if homeVM.homeRecommendCurrTab == tab {
                                    Image("home_indicator")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20)
                                        // 匹配几何效果（把两个视图 “当成同一个” 做动画）
                                        .matchedGeometryEffect(
                                            // id:唯一标识
                                            id: "HOME_RECOMMEND_CATEGORY_ANIMATION",
                                            // in:放在哪个命名空间里
                                            in: animation)
                                } else {
                                    Image("home_indicator")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20)
                                        .hidden()
                                }
                            }
                        }
                    }
                }
                .frame(height: 40)
                .padding(.leading, 16)
                .padding(.trailing, 60)
                .background(
                    Color.white
                )
            }
            // 添加右侧全部分类按钮,这个按钮背景色有一个渐变透明的效果
            ZStack {
                LinearGradient(colors: [Color.white.opacity(0), Color.white, Color.white], startPoint: .leading, endPoint: .trailing)
                Image(systemName: "list.dash")
//                            .offset(x: -16)
            }
            .frame(width: 60, height: 40)
        }
    }
}

#Preview {
    HomeRecommendGoodsCategoryTabTitleView()
}
