//
//  CustomTabbarViewModel.swift
//  IdleFish
//
//  Created by Mac Mini on 2026/4/11.
//

import SwiftUI

class CustomTabbarViewModel: ObservableObject {
    // 使用stFront来表示当前在顶层view上
    @Published var atFront: Bool = true
}
