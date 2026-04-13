//
//  GoodsCardModel.swift
//  GoodsCardModel
//
//  Created by Ben on 2021/8/20.
//

import Foundation

let DEFAULT_GOODSCARD_MODELS: [GoodsCardModel] = [
    GoodsCardModel(goodsImageUrl: "https://gips2.baidu.com/it/u=1651586290,17201034&fm=3028&app=3028&f=JPEG&fmt=auto&q=100&size=f600_800", goodsName: "苹果耳机AirPods", goodsPrice: 100000, seller: UserModel(nickname: "会飞的鱼", avatar: "https://q1.itc.cn/q_70/images03/20250701/687d96cb55a24e92933ef243f6fcd606.jpeg")),
    GoodsCardModel(goodsImageUrl: "https://gips3.baidu.com/it/u=1821127123,1149655687&fm=3028&app=3028&f=JPEG&fmt=auto?w=720&h=1280", goodsName: "苹果耳机AirPods", goodsPrice: 6134, seller: UserModel(nickname: "会飞的鱼", avatar: "https://img0.baidu.com/it/u=3217838212,795208401&fm=253&fmt=auto&app=138&f=JPEG?w=514&h=500")),
    GoodsCardModel(goodsImageUrl: "https://gips0.baidu.com/it/u=1690853528,2506870245&fm=3028&app=3028&f=JPEG&fmt=auto?w=1024&h=1024", goodsName: "苹果耳机AirPods", goodsPrice: 6235, seller: UserModel(nickname: "会飞的鱼", avatar: "https://img0.baidu.com/it/u=3880766785,2070833977&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500")),
    GoodsCardModel(goodsImageUrl: "https://gips2.baidu.com/it/u=853190258,2588232240&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=720", goodsName: "苹果耳机AirPods", goodsPrice: 123, seller: UserModel(nickname: "会飞的鱼", avatar: "https://img0.baidu.com/it/u=3998424893,4158719601&fm=253&app=138&f=JPEG?w=500&h=508")),
    GoodsCardModel(goodsImageUrl: "https://gips2.baidu.com/it/u=3093819921,829322739&fm=3028&app=3028&f=JPEG&fmt=auto?w=1024&h=1024", goodsName: "苹果耳机AirPods", goodsPrice: 5423, seller: UserModel(nickname: "会飞的鱼", avatar: "https://c-ssl.dtstatic.com/uploads/item/201905/06/20190506221859_vfnmf.thumb.1000_0.jpeg")),
    GoodsCardModel(goodsImageUrl: "https://gips0.baidu.com/it/u=2298867753,3464105574&fm=3028&app=3028&f=JPEG&fmt=auto?w=960&h=1280", goodsName: "苹果耳机AirPods", goodsPrice: 123, seller: UserModel(nickname: "会飞的鱼", avatar: "https://c-ssl.dtstatic.com/uploads/item/201911/26/20191126101520_kidhf.thumb.1000_0.jpeg")),
    GoodsCardModel(goodsImageUrl: "https://gips2.baidu.com/it/u=1651586290,17201034&fm=3028&app=3028&f=JPEG&fmt=auto&q=100&size=f600_800", goodsName: "苹果耳机AirPods", goodsPrice: 100000, seller: UserModel(nickname: "会飞的鱼", avatar: "https://img1.baidu.com/it/u=3524942861,79151534&fm=26&fmt=auto&gp=0.jpg")),
    GoodsCardModel(goodsImageUrl: "https://gips0.baidu.com/it/u=1690853528,2506870245&fm=3028&app=3028&f=JPEG&fmt=auto?w=1024&h=1024", goodsName: "苹果耳机AirPods", goodsPrice: 6235, seller: UserModel(nickname: "会飞的鱼", avatar: "https://img1.baidu.com/it/u=3524942861,79151534&fm=26&fmt=auto&gp=0.jpg")),
    GoodsCardModel(goodsImageUrl: "https://gips3.baidu.com/it/u=1821127123,1149655687&fm=3028&app=3028&f=JPEG&fmt=auto?w=720&h=1280", goodsName: "苹果耳机AirPods", goodsPrice: 6134, seller: UserModel(nickname: "会飞的鱼", avatar: "https://img1.baidu.com/it/u=3524942861,79151534&fm=26&fmt=auto&gp=0.jpg")),
    GoodsCardModel(goodsImageUrl: "https://gips2.baidu.com/it/u=853190258,2588232240&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=720", goodsName: "苹果耳机AirPods", goodsPrice: 123, seller: UserModel(nickname: "会飞的鱼", avatar: "https://img1.baidu.com/it/u=3524942861,79151534&fm=26&fmt=auto&gp=0.jpg")),
    GoodsCardModel(goodsImageUrl: "https://gips2.baidu.com/it/u=3093819921,829322739&fm=3028&app=3028&f=JPEG&fmt=auto?w=1024&h=1024", goodsName: "苹果耳机AirPods", goodsPrice: 5423, seller: UserModel(nickname: "会飞的鱼", avatar: "https://img1.baidu.com/it/u=3524942861,79151534&fm=26&fmt=auto&gp=0.jpg")),
    GoodsCardModel(goodsImageUrl: "https://gips0.baidu.com/it/u=2298867753,3464105574&fm=3028&app=3028&f=JPEG&fmt=auto?w=960&h=1280", goodsName: "苹果耳机AirPods", goodsPrice: 123, seller: UserModel(nickname: "会飞的鱼", avatar: "https://img1.baidu.com/it/u=3524942861,79151534&fm=26&fmt=auto&gp=0.jpg")),
]

struct GoodsCardModel: Identifiable, Codable, Hashable {
    static func == (lhs: GoodsCardModel, rhs: GoodsCardModel) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    var id = UUID().uuidString
    // 商品链接url
    var goodsImageUrl: String
    // 商品名称
    var goodsName: String
    // 商品价格,采用分为单位,例如10000即为100.00元
    var goodsPrice: Int
    // 卖家基本信息
    var seller: UserModel
    // 对价格进行格式化输出
    var goodsPriceStr: String {
        return String(format: "%.2f", Float(goodsPrice) * 0.01)
    }

    var wantBuyCount: Int {
        return Int.random(in: 0 ... 10000)
    }
}
