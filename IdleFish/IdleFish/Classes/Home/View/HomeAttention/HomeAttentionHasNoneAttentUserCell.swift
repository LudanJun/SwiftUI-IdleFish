//
//  HomeAttentionHasNoneAttentUserCell.swift
//  IdleFish
//
//  Created by Mac Mini on 2026/4/13.
//

import SwiftUI
// 未关注的提示
struct HomeAttentionHasNoneAttentUserCell: View {
    var body: some View {
        
        VStack(alignment:.leading){
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text("你还没关注的人呢")
                        .font(.system(size: 16, weight: .semibold))
                    Text("为你推荐了些有趣的人,喜欢就关注哦~")
                        .font(.system(size: 12))
                        .foregroundColor(Color(hex: 0xB4B5B6))
                }

                Image("fun_normal_empty_view")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .offset(y:10)
            }
            .padding(.top, 10)
            .padding(.bottom, 30)

            Text("为你推荐")
                .font(.system(size: 20, weight: .semibold))
        }
        .padding(.leading,16)
        .padding(.trailing,10)
    }
}

#Preview {
    HomeAttentionHasNoneAttentUserCell()
}
