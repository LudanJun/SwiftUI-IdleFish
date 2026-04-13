//
//  HomeRecommendView.swift
//  IdleFish
//
//  Created by Mac Mini on 2026/4/11.
//

import SwiftUI

struct HomeRecommendView: View {

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                VStack(spacing: 10) {
                    // 闲鱼优品
                    HomeRecommendQualityView()

                    // 功能快捷入口
                    HomeRecommendQuickInfoView()
                }
                .padding(.horizontal, 16)
                // 推荐页中的二手商品分类滚动列表
                HomeRecommendGoodsView()
            }
        }
    }
}

#Preview {
    HomeRecommendView()
}
