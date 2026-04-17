//
//  HomeAttentionFunUserCell.swift
//  IdleFish
//
//  Created by Mac Mini on 2026/4/13.
//

import SDWebImageSwiftUI
import SwiftUI
struct HomeAttentionFunUserCell: View {
    
    var funUserModel: HomeAttentionFunUserModel

    @EnvironmentObject var homeVM: HomeViewModel

    @State private var goodsWidth: CGFloat = 0

    var body: some View {
        VStack {
            // 头像,昵称,关注数,关注按钮
            HStack {
                WebImage(url: URL(string: funUserModel.user?.avatar ?? ""))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 45, height: 45)
                    .clipShape(Circle())
                VStack(alignment: .leading) {
                    Text(funUserModel.user?.nickname ?? "")
                        .font(.system(size: 14, weight: .bold))

                    Text("\(String(Int.random(in: 1 ... 1000)))粉丝")
                        .font(.system(size: 12))
                        .foregroundColor(Color(hex: 0xA2A3A4))
                }
                Spacer()

                Button {
                    //关注按钮点击事件
                    homeVM.attentionUserList.append(funUserModel.user!)
                    
                } label: {
                    Image("btn_attention_nor")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 40)
                }
            }
            .padding(.horizontal, 16)


            // 三个售卖的二手商品
            HStack(spacing: 10) {
                ForEach(funUserModel.goodsList ?? []) {
                    goods in
                    VStack(alignment: .leading) {
                        // 完成三等分
                        GeometryReader { proxy -> AnyView in

                            let width = proxy.size.width

                            if goodsWidth == 0 {
                                DispatchQueue.main.async {
                                    goodsWidth = width
                                }
                            }
                            return AnyView(
                                VStack {
                                    WebImage(url: URL(string: goods.goodsImageUrl))
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: goodsWidth, height: goodsWidth)
                                        // 图片设置成圆角
                                        .clipShape(RoundedRectangle(cornerRadius: 5))
                                }
                            )
                        }
                        .frame(height: goodsWidth)

                        Text(goods.goodsName)
                            .font(.system(size: 16, weight: .bold))
                            .lineLimit(1)

                        HStack(alignment: .center, spacing: 0) {
                            Text("¥")
                                .font(.system(size: 10))
                            Text(goods.goodsPriceStr)
                                .font(.system(size: 14, weight: .bold))
                        }
                        .foregroundColor(Color(hex: 0xFA464C))
                    }
                }
            }
            .padding(.horizontal, 16)

            Spacer()
            
            Color(hex: 0xF1F3F3)
                .frame(height: 1)
                .padding(.top, 30)

        }
        .padding(.top, 10)
    }
}

// #Preview {
//    HomeAttentionFunUserCell()
// }
