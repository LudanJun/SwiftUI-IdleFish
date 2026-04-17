//
//  HomeViewModel.swift
//  IdleFish
//
//  Created by Mac Mini on 2026/4/1.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var attentionUserMoments: [GoodsCardModel] = []
    
    //关注的人列表
    @Published var attentionUserList: [UserModel] = []
    
    // 修改应用启动后显示的tab页面为推荐
    @Published var currHomeNavTab: HomeNavTab = .attention
    
    //首页header视图的y轴最大值
    @Published var homeRecommendMinY: CGFloat = 0
    
    //记录当前选择的商品分类标签
    var homeRecommendCurrTab: HomeRecommendGoodsCategoryTabModel = HOME_RECOMMEND_GOODS_CATEGORY_TABS[0]
    //都通过homeRecommendCurrTabIndex属性来刷新view
    @Published var homeRecommendCurrTabIndex: Int = 0
    
    private var cancellable: Set<AnyCancellable> = []
    
    init() {
        //当关注的人列表数据发生变化的时候,就需要获取该页面关注的人发布的商品动态列表
        //有关Combine中Publisher发出事件
        $attentionUserList
            //sink是一种订阅事件的方式
            .sink { userModels in
                print(userModels.map{ $0.nickname })
                self.getAttentionUserMoments(userModels: userModels)
            }
        //订阅事件后,还需要有个事件的回收,cancellable就是做这个事情的,类似于垃圾桶的机制
        .store(in: &cancellable)
    }
    

    
    /// 获取关注的人最近动态,本应该获取服务器数据,这里暂时本地数据结合
    /// - Parameter userModels:关注的人列表
    
    private func getAttentionUserMoments(userModels:[UserModel]){
        
        var moments = [GoodsCardModel]()
        userModels.forEach { userModel in
            
            let randomForeachCount = Int.random(in: 1...5)
            
//            ForEach(0..<randomForeachCount) {
//                let moment = GoodsCardModel(goods)
//            }
        }
    }
}
