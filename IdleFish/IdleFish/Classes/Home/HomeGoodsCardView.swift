//
//  HomeGoodsCardView.swift
//  IdleFish
//
//  Created by Mac Mini on 2026/4/13.
//

import SDWebImageSwiftUI
import SwiftUI

struct HomeGoodsCardView: View {
    var goodsCardModel: GoodsCardModel
    var body: some View {
        VStack {
            WebImage(url: URL(string: goodsCardModel.goodsImageUrl))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
            VStack(alignment: .leading,spacing: 5) {
                Text(goodsCardModel.goodsName)
                    .font(.system(size: 14, weight: .semibold))
                HStack {
                    (
                        Text("¥")
                            .font(.system(size: 10, weight: .semibold))
                            +
                            Text(goodsCardModel.goodsPriceStr)
                            .font(.system(size: 14, weight: .semibold))
                    )
                    .foregroundColor(Color(hex: 0xFA4B4E)
                    )
                    Spacer()
                    Text("\(goodsCardModel.wantBuyCount)人想要")
                        .font(.system(size: 10))
                        .foregroundColor(Color.black.opacity(0.5))
                }

                HStack {
                    WebImage(url: URL(string: goodsCardModel.seller.avatar ?? ""))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        // 给头像设置成圆形
                        .clipShape(Circle())
                    Text(goodsCardModel.seller.nickname ?? "")
                        .font(.system(size: 10))
                        .lineLimit(1)
                        .foregroundColor(Color.black.opacity(0.5))
                    Spacer()

                    Image("goodscard_seller_zhima_good")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 20)
                }
            }
        }
    }
}

// #Preview {
//    HomeGoodsCardView()
// }
