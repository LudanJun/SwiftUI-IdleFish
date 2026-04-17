//
//  HomeAttentionHasNoneAttentionUserList.swift
//  IdleFish
//
//  Created by Mac Mini on 2026/4/14.
//

import SwiftUI

struct HomeAttentionHasNoneAttentionUserList: View {
    var body: some View {
        // 采用List完成页面布局
        // 未关注列表大致完成,
        List(0 ..< (DEFAULT_ATTENTION_FUNUSER_MODELS.count + 1)) {
            index in
            if index == 0 {
                // 未关注的提示
                HomeAttentionHasNoneAttentUserCell()
                    // 隐藏行线
                    .listRowSeparator(.hidden)
                    // 清除cell默认的内间距
                    .listRowInsets(.zero)
            } else {
                ForEach(DEFAULT_ATTENTION_FUNUSER_MODELS, id: \.self) {
                    model in
                    HomeAttentionFunUserCell(funUserModel: model)
                        // 隐藏行线
                        .listRowSeparator(.hidden)
                        // 清除cell默认的内间距
                        .listRowInsets(.zero)
                }
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    HomeAttentionHasNoneAttentionUserList()
}
