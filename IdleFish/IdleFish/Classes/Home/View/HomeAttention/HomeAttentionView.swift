//
//  HomeAttentionView.swift
//  IdleFish
//
//  Created by Mac Mini on 2026/4/13.
//

import SDWebImageSwiftUI
import SwiftUI
struct HomeAttentionView: View {
    @EnvironmentObject var homeVM: HomeViewModel
    var body: some View {
        ZStack {
            // 采用List完成该页面布局
            if homeVM.attentionUserList.isEmpty {
                // 未关注
                HomeAttentionHasNoneAttentionUserList()
            } else {
                // 关注页面UI更新的功能

                // 常访问的用户
                List(0 ..< (homeVM.attentionUserList.count + 1)) {
                    index in
                    // 常访问用户
                    if index == 0 {
                        VStack(alignment: .leading,spacing: 30) {
                            Text("常访问的人")
                                .font(.system(size: 12, weight: Font.Weight.semibold))
                            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 5), spacing: 5) {
                                ForEach(homeVM.attentionUserList) {
                                    userModel in
                                    VStack {
                                        WebImage(url: URL(string: userModel.avatar ?? ""))
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 40, height: 40)
                                            .clipShape(Circle())
                                        Text(userModel.nickname ?? "")
                                            .font(.system(size: 12))
                                            .foregroundColor(Color(hex: 0xBEBEBE))
                                            // 限制文字行数为1行
                                            .lineLimit(1)
                                    }
                                }
                            }
                        }
                        .padding(.top, 10)
                        .padding(.bottom, 30)
                        .padding(.horizontal, 16)
                        .listRowSeparator(.hidden)
                        .listRowInsets(.zero)
                    } else {
                        //关注用户的最新动态
                        Text("hello")
                    }
                }
                .listStyle(.plain)
            }
        }
    }
}

#Preview {
    HomeAttentionView()
}
