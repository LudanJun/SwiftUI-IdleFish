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
    
    //首页header视图的y轴最大值
    @Published var homeRecommendMinY: CGFloat = 0
    
    //记录当前选择的商品分类标签
    var homeRecommendCurrTab: HomeRecommendGoodsCategoryTabModel = HOME_RECOMMEND_GOODS_CATEGORY_TABS[0]
    //都通过homeRecommendCurrTabIndex属性来刷新view
    @Published var homeRecommendCurrTabIndex: Int = 0
}
