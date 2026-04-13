//
//  HomeRecommendQualityView.swift
//  IdleFish
//
//  Created by Mac Mini on 2026/4/11.
//

import SwiftUI


struct HomeRecommendQualityView: View {
    var body: some View {
        VStack {
            // 闲鱼优品
            HStack {
                Text("闲鱼优品")
                    .font(.system(size: 18, weight: .semibold))
                Text("100%验货保真 | 全国包邮 | 品质包退")
                    .font(.system(size: 12))
                    .padding(4)
                    .background(
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color(hex: 0xF9E5C4))
                    )
                Spacer()
                Button {
                } label: {
                    // spacing取消间距
                    HStack(spacing: 0) {
                        Text("更多")
                        Image(systemName: "chevron.right")
                    }
                    .font(.system(size: 12))
                    .foregroundColor(Color.black.opacity(0.4))
                    .padding(4)
                    .background(Capsule().fill(.white)) // 背景胶囊形状
                }
            }
            
            // 闲鱼优品推荐入口
            HStack(spacing: 15) {
                ForEach(HOME_RECOMMEND_QUALITY_MODELS, id: \.self) {
                    model in
                    VStack(spacing: 0) {
                        ZStack {
                            Circle().fill(.white)
                            Image(model.iconName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(18)
                        }
                        
                        Text(model.title)
                            .font(.system(size: 14, weight: .semibold))
                        Text(model.subTitle)
                            .font(.system(size: 12))
                            .foregroundColor(Color.black.opacity(0.5))
                    }
                    //                        Color.random()
                }
            }
        }
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(hex: 0xFAFAFA))
        )
    }
}


#Preview {
    HomeRecommendQualityView()
}
