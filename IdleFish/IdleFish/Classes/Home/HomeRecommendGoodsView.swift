//
//  HomeRecommendGoodsView.swift
//  IdleFish
//
//  Created by Mac Mini on 2026/4/13.
//

import SwiftUI

struct HomeRecommendGoodsView: View {
    @EnvironmentObject var homeVM: HomeViewModel
    var body: some View {
        VStack(spacing: 0) {
            HomeRecommendGoodsCategoryTabTitleView()
            
            //二手商品列表
            //继续完成商品列表与分类联动,分类悬浮功能
            HomeRecommendGoodsListView()
        }
        .frame(width: SCREEN_WIDTH)
    }
}

#Preview {
    HomeRecommendGoodsView()
}
