//
//  FeaturedLessonCard.swift
//  PetsRescue
//
//  Created by Melek Tas on 21/10/2026.
//

import Foundation
import SwiftUI

struct FeaturedLessonCard: View {
    let eyebrow: String
    let title: String
    let buttonTitle: String
    let icon: String
    var useSaffron: Bool = false
    let action: () -> Void

    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            VStack(alignment: .leading, spacing: 8) {
                Text(eyebrow)
                    .font(.system(size: 13))
                    .foregroundColor(useSaffron ? AppColor.saffronText : AppColor.body)
                Text(title)
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(useSaffron ? AppColor.saffronText : AppColor.title)
                    .multilineTextAlignment(.leading)
                PillButton(title: buttonTitle, compact: true, action: action)
                    .padding(.top, 4)
            }
            Spacer(minLength: 0)
            Image(systemName: icon)
                .font(.system(size: 36))
                .foregroundColor(AppColor.tealDark)
                .frame(width: 100, height: 100)
                .background(Color.white.opacity(0.6))
                .clipShape(Circle())
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(SoftGradient(useSaffron: useSaffron))
        .clipShape(RoundedRectangle(cornerRadius: 22))
        .overlay(RoundedRectangle(cornerRadius: 22).stroke(Color.white.opacity(0.6), lineWidth: 1))
    }
}
