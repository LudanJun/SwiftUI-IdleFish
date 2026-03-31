//
//  ContentView.swift
//  IdleFish
//
//  Created by Mac Mini on 2026/3/31.
//

import SwiftUI

struct ContentView: View {
    //@State修饰就是当该属性被改变时,会触发重新绘制界面
    @State var currTab: CustomTabbar = .home
    
    var body: some View {
        
        //Zstack是一个z轴方向叠加的容器相当于Flutter的Stack
        ZStack(alignment: .bottom){
            //TabView相当于UITabbarViewController 粗浅对照
            TabView(selection: $currTab){
                //其中view相当于UITabBarViewController的rootViewController
                ForEach(CustomTabbar.allCases,id:\.rawValue) {
                    item in
                    Text(item.rawValue)
                        .tag(item)
                }
            }
            
            //创建自定义tabbarView,闲鱼有个凸起的圆弧 ,从这里传递绑定的属性
            CustomTabbarView(currTab: $currTab)
        }
    }
}

#Preview {
    ContentView()
}
