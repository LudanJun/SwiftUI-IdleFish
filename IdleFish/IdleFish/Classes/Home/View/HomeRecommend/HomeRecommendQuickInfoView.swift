//
//  HomeRecommendQuickInfoView.swift
//  IdleFish
//
//  Created by Mac Mini on 2026/4/13.
//

import SwiftUI

struct HomeRecommendQuickInfoView: View {
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 3), spacing: 20) {
            ForEach(HOME_RECOMMEND_QUICKINFO_MODELS, id: \.self) {
                model in
                HStack {
                    VStack(alignment: .leading) {
                        Text(model.title)
                            .lineLimit(1)
                            .fixedSize()
                            .font(.system(size: 14, weight: .semibold))
                        Text(model.subTitle)
                            .lineLimit(1)
                            .fixedSize()
                            .font(.system(size: 10))
                            .foregroundColor(Color(hex: model.subTitleColorNum))
                    }
                    Spacer()
                    Image(model.iconName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 30)
                }
                .padding(.horizontal, 10)
            }
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 12)

        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(hex: 0xFAFAFA))
        )
    }
}

#Preview {
    HomeRecommendQuickInfoView()
}
