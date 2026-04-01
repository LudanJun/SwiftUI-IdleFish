//
//  HomeViewModel.swift
//  IdleFish
//
//  Created by Mac Mini on 2026/4/1.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var currHomeNavTab: HomeNavTab = .attention
}
