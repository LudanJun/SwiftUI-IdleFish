//
//  AppConfig.swift
//  IdleFish
//
//  Created by Mac Mini on 2026/4/13.
//

import UIKit
//屏幕宽度
let SCREEN_WIDTH: CGFloat = UIScreen.main.bounds.size.width
//屏幕高度
let SCREEN_HEIGHT: CGFloat = UIScreen.main.bounds.size.height
//安全边距
let SCREEN_SAFE_INSETS: UIEdgeInsets = UIApplication.shared.windows.first?.safeAreaInsets ?? .zero
//底部tabbar高度
let SCREEN_TAB_HEIGHT: CGFloat = UIApplication.shared.windows.first?.rootViewController?.tabBarController?.tabBar.bounds.height ?? 0
