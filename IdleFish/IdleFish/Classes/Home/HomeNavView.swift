//
//  HomeNavView.swift
//  IdleFish
//
//  Created by Mac Mini on 2026/4/1.
//

import SDWebImageSwiftUI
import SwiftUI

struct HomeNavView: View {
    // 记录要搜索的关键字
    @State var searchKeyword: String = ""

    @State var homeNavTab: HomeNavTab = .attention

    var body: some View {
        VStack {
            // 签到直播提示和标签所在的横向容器
            HStack {
                // 左边签到
                Button {
                    print("签到")
                } label: {
                    AnimatedImage(name: "home_sign.gif")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 46, height: 46)
                }
                Spacer()

                // 右边直播
                Button {
                    print("签到")
                } label: {
                    ZStack(alignment: .bottom) {
                        Image("miyo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 46, height: 46)
                            // 裁切成圆形
                            .clipShape(Circle())
                            // 添加带颜色的边框
                            .overlay(
                                RoundedRectangle(cornerRadius: 23)
                                    .stroke(Color.red, lineWidth: 4)
                            )

                        // 添加直播中文字提示
                        HStack {
                            // 白色小圆点
                            Color.white.clipShape(Circle())
                                .frame(width: 5, height: 5)
                            Text("直播中")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundColor(.white)
                        }
                        .background(
                            Capsule().fill(Color.red)
                                .frame(width: 50, height: 16)
                        )
                    }
                }
            }
            .overlay {
                HStack {
                    HomeNavTabBtn(tab: HomeNavTab.attention)
                    HomeNavTabBtn(tab: HomeNavTab.recommend)
                    HomeNavTabBtn(tab: HomeNavTab.location)
                }
            }

            // 添加搜索框
            HStack {
                // 搜索框
                HStack {
                    // 二维码按钮
                    Button {
                    } label: {
                        Image("home_nav_search_qrcode")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxHeight: .infinity)
                            .padding(4)
                    }
                    // 分割线
                    Divider()
                        .foregroundColor(Color.black.opacity(0.3))
                        .frame(width: 1, height: 20)
                    // 搜索框
                    TextField("", text: $searchKeyword)

                    // 搜索按钮
                    Button {
                    } label: {
                        Text("搜索")
                            .font(.system(size: 14))
                            .foregroundColor(.black.opacity(0.8))
                            .padding(.horizontal, 15)
                            .frame(maxHeight: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    // 这种设置填充颜色
                                    .fill(Color.yellow)
                            )
                    }
                }
                // 让二维码图标相对左边4个距离
                .padding(.leading, 4)
                // 给外面HStack添加边框,也就是搜索框添加边框
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        // 这种设置边框颜色和粗细
                        .stroke(Color.yellow, lineWidth: 2)
                }
                // 分类按钮
                Button {
                } label: {
                    Image("home_nav_classify")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: .infinity)
                }
            }
            .frame(height: 40)
        }
        // 整体添加一个横向内边距
        .padding(.horizontal, 10)
    }
}

#Preview {
    HomeNavView()
}

enum HomeNavTab: String {
    case attention = "关注"
    case recommend = "推荐"
    case location = "北京"
}

struct HomeNavTabBtn: View {
    @EnvironmentObject var homeVM: HomeViewModel

    // 这个只是传值 不需要后续绑定改变 当前按钮自己代表哪个标签
    var tab: HomeNavTab

    var body: some View {
        Button {
            // 点击就切换选中项
            // 意思是点我一下，我就把 外部的当前选中项 改成 我自己代表的 tab
            // withAnimation的作用是在视图渲染的时候，添加适当的动画，动画也可以通过参数进行自定义
            withAnimation {
                homeVM.currHomeNavTab = tab
            }
        } label: {
            ZStack(alignment: Alignment.trailing) {
                // rawValue 获取枚举的值
                Text(tab.rawValue)
                    .font(.system(size: 16, weight: homeVM.currHomeNavTab == tab ? .bold : .medium))
                    .foregroundColor(Color.black.opacity(homeVM.currHomeNavTab == tab ? 0.7 : 0.3))
                    .padding(.horizontal, 15)
                    // 选中的文字放大
                    .scaleEffect(homeVM.currHomeNavTab == tab ? 1.3 : 1)
                // 添加定位旁边的箭头
                if tab == .location {
                    Image(systemName: "chevron.down")
                        .font(.system(size: 6))
                        .foregroundColor(Color.black.opacity(0.4))
                        .opacity(homeVM.currHomeNavTab == tab ? 0.7 : 0.3)
                }
            }
        }
        .foregroundColor(Color.black.opacity(homeVM.currHomeNavTab == tab ? 0.7 : 0.3))
    }
}
