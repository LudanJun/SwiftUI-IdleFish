//
//  HomeViewModel.swift
//  IdleFish
//
//  Created by Mac Mini on 2026/4/1.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    // 修改应用启动后显示的tab页面为推荐
    @Published var currHomeNavTab: HomeNavTab = .recommend
    
    //记录当前选择的商品分类标签
    @Published var currGoodsCategoryTab: HomeRecommendGoodsCategoryTabModel = HOME_GOODS_CATEGORY_TABS[0]
}
