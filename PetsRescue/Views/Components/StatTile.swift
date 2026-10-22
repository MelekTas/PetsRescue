//
//  StatTile.swift
//  PetsRescue
//
//  Created by Melek Tas on 21/10/2026.
//

import Foundation
import SwiftUI

struct StatTile: View {
    let title: String
    let value: String
    var icon: String? = nil
    var highlighted: Bool = false

    @ViewBuilder
    private var tileBackground: some View {
        if highlighted {
            LinearGradient(colors: [AppColor.saffronGlow, AppColor.tealTint],
                           startPoint: .topLeading, endPoint: .bottomTrailing)
        } else {
            AppColor.card
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 4) {
                if let icon = icon {
                    Image(systemName: icon).font(.system(size: 12))
                }
                Text(title).font(.system(size: 13))
            }
            .foregroundColor(highlighted ? AppColor.saffronText : AppColor.body)

            Text(value)
                .font(.system(size: 22, weight: .medium))
                .foregroundColor(AppColor.title)
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(tileBackground)
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .overlay(RoundedRectangle(cornerRadius: 18).stroke(AppColor.separator, lineWidth: 1))
    }
}
