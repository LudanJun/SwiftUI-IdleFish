//
//  HomeAttentionFunUserModel.swift
//  IdleFish
//
//  Created by Mac Mini on 2026/4/13.
//

import SwiftUI

let DEFAULT_ATTENTION_FUNUSER_MODELS: [HomeAttentionFunUserModel] = [
    HomeAttentionFunUserModel(user: UserModel(nickname: "会飞的鱼", avatar: "https://ww3.sinaimg.cn/mw690/005OpIDGgy1i3o84f4ilhj30u00tygog.jpg"), goodsList: [
        GoodsCardModel(goodsImageUrl: "https://gips2.baidu.com/it/u=1651586290,17201034&fm=3028&app=3028&f=JPEG&fmt=auto&q=100&size=f600_800", goodsName: "苹果耳机AirPods", goodsPrice: 100000, seller: UserModel(nickname: "会飞的鱼", avatar: "https://q1.itc.cn/q_70/images03/20250701/687d96cb55a24e92933ef243f6fcd606.jpeg")),
        GoodsCardModel(goodsImageUrl: "https://gips3.baidu.com/it/u=1821127123,1149655687&fm=3028&app=3028&f=JPEG&fmt=auto?w=720&h=1280", goodsName: "苹果耳机AirPods", goodsPrice: 6134, seller: UserModel(nickname: "会飞的鱼", avatar: "https://img0.baidu.com/it/u=3217838212,795208401&fm=253&fmt=auto&app=138&f=JPEG?w=514&h=500")),
        GoodsCardModel(goodsImageUrl: "https://gips0.baidu.com/it/u=1690853528,2506870245&fm=3028&app=3028&f=JPEG&fmt=auto?w=1024&h=1024", goodsName: "苹果耳机AirPods", goodsPrice: 6235, seller: UserModel(nickname: "会飞的鱼", avatar: "https://img0.baidu.com/it/u=3880766785,2070833977&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500")),
 
    ]),
    HomeAttentionFunUserModel(user: UserModel(nickname: "会飞的鱼", avatar: "https://ww3.sinaimg.cn/mw690/005OpIDGgy1i3o84f4ilhj30u00tygog.jpg"), goodsList: [
 
        GoodsCardModel(goodsImageUrl: "https://gips0.baidu.com/it/u=1690853528,2506870245&fm=3028&app=3028&f=JPEG&fmt=auto?w=1024&h=1024", goodsName: "苹果耳机AirPods", goodsPrice: 6235, seller: UserModel(nickname: "会飞的鱼", avatar: "https://img0.baidu.com/it/u=3880766785,2070833977&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500")),
        GoodsCardModel(goodsImageUrl: "https://gips2.baidu.com/it/u=853190258,2588232240&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=720", goodsName: "苹果耳机AirPods", goodsPrice: 123, seller: UserModel(nickname: "会飞的鱼", avatar: "https://img0.baidu.com/it/u=3998424893,4158719601&fm=253&app=138&f=JPEG?w=500&h=508")),
        GoodsCardModel(goodsImageUrl: "https://gips2.baidu.com/it/u=3093819921,829322739&fm=3028&app=3028&f=JPEG&fmt=auto?w=1024&h=1024", goodsName: "苹果耳机AirPods", goodsPrice: 5423, seller: UserModel(nickname: "会飞的鱼", avatar: "https://c-ssl.dtstatic.com/uploads/item/201905/06/20190506221859_vfnmf.thumb.1000_0.jpeg")),
    ]),
    HomeAttentionFunUserModel(user: UserModel(nickname: "会飞的鱼", avatar: "https://ww3.sinaimg.cn/mw690/005OpIDGgy1i3o84f4ilhj30u00tygog.jpg"), goodsList: [
        GoodsCardModel(goodsImageUrl: "https://gips2.baidu.com/it/u=1651586290,17201034&fm=3028&app=3028&f=JPEG&fmt=auto&q=100&size=f600_800", goodsName: "苹果耳机AirPods", goodsPrice: 100000, seller: UserModel(nickname: "会飞的鱼", avatar: "https://q1.itc.cn/q_70/images03/20250701/687d96cb55a24e92933ef243f6fcd606.jpeg")),

        GoodsCardModel(goodsImageUrl: "https://gips0.baidu.com/it/u=1690853528,2506870245&fm=3028&app=3028&f=JPEG&fmt=auto?w=1024&h=1024", goodsName: "苹果耳机AirPods", goodsPrice: 6235, seller: UserModel(nickname: "会飞的鱼", avatar: "https://img0.baidu.com/it/u=3880766785,2070833977&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500")),

        GoodsCardModel(goodsImageUrl: "https://gips2.baidu.com/it/u=3093819921,829322739&fm=3028&app=3028&f=JPEG&fmt=auto?w=1024&h=1024", goodsName: "苹果耳机AirPods", goodsPrice: 5423, seller: UserModel(nickname: "会飞的鱼", avatar: "https://c-ssl.dtstatic.com/uploads/item/201905/06/20190506221859_vfnmf.thumb.1000_0.jpeg")),
    ]),
]
/*
 struct：结构体，用来存数据
 Codable：可以解析 JSON / 转 JSON（网络请求必备）
 Hashable：可以被 ForEach 遍历、可以做字典 key、可以比对是否相同
 */
struct HomeAttentionFunUserModel: Codable,Hashable {
    /*
     为什么要写？
     SwiftUI 列表刷新、去重、判断数据是否变化时，必须知道两个对象是不是同一个。

     */
    static func == (lhs:HomeAttentionFunUserModel,rhs:HomeAttentionFunUserModel) -> Bool {
        return lhs.user?.id == rhs.user?.id
    }
    //哈希值方法（唯一标识）
    func hash(into hasher: inout Hasher) {
        hasher.combine(user?.id)
     }
    
    var user: UserModel?
    var goodsList: [GoodsCardModel]?
}
