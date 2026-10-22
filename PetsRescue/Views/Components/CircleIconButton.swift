//
//  CircleIconButton.swift
//  PetsRescue
//
//  Created by Melek Tas on 21/10/2026.
//

import Foundation
import SwiftUI

struct CircleIconButton: View {
    let systemName: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: systemName)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(AppColor.title)
                .frame(width: 40, height: 40)
                .background(AppColor.card)
                .clipShape(Circle())
                .overlay(Circle().stroke(AppColor.separator, lineWidth: 1))
        }
        .buttonStyle(.plain)
    }
}
