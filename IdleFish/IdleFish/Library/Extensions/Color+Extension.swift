//
//  Color+Extension.swift
//  IdleFish
//
//  Created by Mac Mini on 2026/4/1.
//

import SwiftUI

extension Color {
    
    init(hex: UInt, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 08) & 0xFF) / 255,
            blue: Double((hex >> 00) & 0xFF) / 255,
            opacity: opacity
        )
    }
    
    /// 给Color添加一个随机颜色
    /// - Returns: 返回Color
    static func random() -> Color {
        let redInt = Int.random(in: 0 ... 255)
        let greenInt = Int.random(in: 0 ... 255)
        let blueInt = Int.random(in: 0 ... 255)

        return Color(red: Double(redInt) / 255.0, green: Double(greenInt) / 255.0, blue: Double(blueInt) / 255.0, opacity: 1)
    }
}
