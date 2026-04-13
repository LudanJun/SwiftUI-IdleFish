//
//  HomeRecommendGoodsListView.swift
//  IdleFish
//
//  Created by Mac Mini on 2026/4/13.
//

import SwiftUI

struct HomeRecommendGoodsListView: View {
    @EnvironmentObject var homeVM: HomeViewModel

    var body: some View {
        // 解决列表整体居中问题
        GeometryReader { _ in
            HStack(spacing: 0) {
                ForEach(HOME_RECOMMEND_GOODS_CATEGORY_TABS, id: \.self) {
                    _ in

                    // 先完成里面的网格布局,自定义一个FLowlayoutView
                    FLowLayoutView(list: DEFAULT_GOODSCARD_MODELS, colums: 2, itemSpacingV: 30) { model in

                        // 细化每个商品视图
                        HomeGoodsCardView(goodsCardModel: model)
                    }
                    .padding(.bottom, 40)
                    .padding(.horizontal, 16)
                    .frame(width: SCREEN_WIDTH)
                }
            }
            // 通过设置X轴偏移量的方式来实现切换分类滚动商品列表的功能
            // 接下来给HStack添加一个拖拽手势,来完成滑动切换
            .offset(x: CGFloat(homeVM.homeRecommendCurrTabIndex) * -SCREEN_WIDTH)
            .gesture(dragGesutre)
        }
        .frame(width: SCREEN_WIDTH, height: 1000)
    }
}

#Preview {
    HomeRecommendGoodsListView()
}

extension HomeRecommendGoodsListView {
    private var dragGesutre: some Gesture {
        DragGesture()
            .onEnded { endValue in

                var currTabIndex = homeVM.homeRecommendCurrTabIndex
                /// 拖动右滑，偏移量增加，显示 index 减少
                if endValue.translation.width > 50 {
                    currTabIndex -= 1
                }
                /// 拖动左滑，偏移量减少，显示 index 增加
                if endValue.translation.width < -50 {
                    currTabIndex += 1
                }

                // 做一下判断,防止越界
                currTabIndex = max(min(currTabIndex, HOME_RECOMMEND_GOODS_CATEGORY_TABS.count - 1), 0)

                // 把数据更新到homeVM的homeRecommendCurrTabIndex上,以便刷新view
                homeVM.homeRecommendCurrTab = HOME_RECOMMEND_GOODS_CATEGORY_TABS[currTabIndex]
                withAnimation(.spring()) {
                    homeVM.homeRecommendCurrTabIndex = currTabIndex
                }
            }
    }
}
