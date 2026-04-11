//
//  SearchResultView.swift
//  IdleFish
//
//  Created by Mac Mini on 2026/4/11.
//

import SwiftUI

struct SearchResultView: View {
    
    //要pop到上一个view,需要借助系统的一个属性
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        //应用一般都会自定义导航的返回
        VStack{
            Text("搜索页面")
        }
        //先隐藏系统back
        .navigationBarBackButtonHidden(true)
        //再添加自定义导航
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading) {
                Button {
                    //自定义的导航需要我们自己处理返回
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("返回")
                }

            }
        }
    }
}

#Preview {
    SearchResultView()
}
