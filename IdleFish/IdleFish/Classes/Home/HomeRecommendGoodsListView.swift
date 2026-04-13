//
//  HomeRecommendGoodsListView.swift
//  IdleFish
//
//  Created by Mac Mini on 2026/4/13.
//

import SDWebImageSwiftUI
import SwiftUI

struct HomeRecommendGoodsListView: View {
    var body: some View {
        // 先完成里面的网格布局,自定义一个FLowlayoutView
        FLowLayoutView(list: DEFAULT_GOODSCARD_MODELS, colums: 2, itemSpacingH: 10, itemSpacingV: 15) { model in

            //细化每个商品视图
            HomeGoodsCardView(goodsCardModel:model)
        }
        .padding(.bottom,40)
        .padding(.horizontal,16)
    }
}

#Preview {
    HomeRecommendGoodsListView()
}

