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

            Color.random()
        }
        .frame(width: SCREEN_WIDTH)
    }
}

#Preview {
    HomeRecommendGoodsView()
}
