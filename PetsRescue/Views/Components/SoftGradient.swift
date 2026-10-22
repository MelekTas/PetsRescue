//
//  SoftGradient.swift
//  PetsRescue
//
//  Created by Melek Tas on 21/10/2026.
//

import Foundation
import SwiftUI

struct SoftGradient: View {
    let useSaffron: Bool

    private var colors: [Color] {
        if useSaffron {
            return [AppColor.saffronGlow, AppColor.tealTint]
        }
        return [AppColor.teal.opacity(0.55), AppColor.tealTint]
    }

    var body: some View {
        LinearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
