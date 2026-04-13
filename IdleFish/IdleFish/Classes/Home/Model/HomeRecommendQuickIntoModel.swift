//
//  HomeRecommendQuickIntoModel.swift
//  IdleFish
//
//  Created by Mac Mini on 2026/4/11.
//

import SwiftUI

let HOME_RECOMMEND_QUICKINFO_MODELS: [HomeRecommendQuickIntoModel] = [
    HomeRecommendQuickIntoModel(title: "省心卖", subTitle: "高价回收", subTitleColorNum: 0xEC8D72, iconName: "home_quickinto_phone"),
    HomeRecommendQuickIntoModel(title: "闲鱼潮社", subTitle: "低价捡漏", subTitleColorNum: 0xC36EEA, iconName: "home_quickinto_shose"),
    HomeRecommendQuickIntoModel(title: "闲鱼榜单", subTitle: "粉丝好评", subTitleColorNum: 0xED9258, iconName: "home_quickinto_good"),
    HomeRecommendQuickIntoModel(title: "低价卡券", subTitle: "话费充值", subTitleColorNum: 0xC36EEA, iconName: "home_quickinto_topup"),
    HomeRecommendQuickIntoModel(title: "3C数码", subTitle: "热门榜单", subTitleColorNum: 0x74B6F9, iconName: "home_quickinto_ipad"),
    HomeRecommendQuickIntoModel(title: "仓库特卖", subTitle: "大牌捡漏", subTitleColorNum: 0xCA7079, iconName: "home_quickinto_meizhuang"),
]

struct HomeRecommendQuickIntoModel: Codable, Hashable {
    var title: String
    var subTitle: String
    var subTitleColorNum: UInt
    var iconName: String
}
