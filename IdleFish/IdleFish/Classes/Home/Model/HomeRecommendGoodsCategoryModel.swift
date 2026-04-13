//
//  HomeRecommendGoodsCategoryModel.swift
//  IdleFish
//
//  Created by Mac Mini on 2026/4/13.
//

import SwiftUI

let HOME_RECOMMEND_GOODS_CATEGORY_TABS: [HomeRecommendGoodsCategoryTabModel] = [
    HomeRecommendGoodsCategoryTabModel(id: 0, title: "猜你喜欢"),
    HomeRecommendGoodsCategoryTabModel(id: 1, title: "电脑组装"),
    HomeRecommendGoodsCategoryTabModel(id: 2, title: "钢琴"),
    HomeRecommendGoodsCategoryTabModel(id: 3, title: "手机"),
    HomeRecommendGoodsCategoryTabModel(id: 4, title: "平板"),
    HomeRecommendGoodsCategoryTabModel(id: 5, title: "猫咪"),
    HomeRecommendGoodsCategoryTabModel(id: 6, title: "智能装备"),
    HomeRecommendGoodsCategoryTabModel(id: 7, title: "台球"),
    HomeRecommendGoodsCategoryTabModel(id: 8, title: "狗狗"),
    HomeRecommendGoodsCategoryTabModel(id: 9, title: "汽车"),
    HomeRecommendGoodsCategoryTabModel(id: 10, title: "仓鼠"),
    HomeRecommendGoodsCategoryTabModel(id: 11, title: "机车"),
    HomeRecommendGoodsCategoryTabModel(id: 12, title: "摄影"),
    HomeRecommendGoodsCategoryTabModel(id: 13, title: "羽毛球"),
    HomeRecommendGoodsCategoryTabModel(id: 14, title: "乒乓球"),
    HomeRecommendGoodsCategoryTabModel(id: 15, title: "水族世界"),
]

struct HomeRecommendGoodsCategoryTabModel: Codable, Hashable {
    var id: Int
    var title: String
}
