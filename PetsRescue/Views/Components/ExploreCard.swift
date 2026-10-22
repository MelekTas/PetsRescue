//
//  ExploreCard.swift
//  PetsRescue
//
//  Created by Melek Tas on 21/10/2026.
//

import Foundation
import SwiftUI

struct ExploreCard: View {
    let lesson: LessonSet
    let useSaffron: Bool

    private var badgeIsNew: Bool { lesson.badge == "New" }

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(alignment: .top) {
                Image(systemName: lesson.icon)
                    .foregroundColor(AppColor.tealDark)
                    .frame(width: 36, height: 36)
                    .background(Color.white.opacity(0.9))
                    .clipShape(Circle())
                Spacer()
                if let badge = lesson.badge {
                    Text(badge)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(badgeIsNew ? Color.white : AppColor.title)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(badgeIsNew ? AppColor.tealDark : Color.white.opacity(0.85))
                        .clipShape(Capsule())
                }
            }
            Spacer(minLength: 16)
            Text(lesson.meta)
                .font(.system(size: 13))
                .foregroundColor(AppColor.body)
            Text(lesson.title)
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(AppColor.title)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
        }
        .padding(12)
        .frame(maxWidth: .infinity, minHeight: 160, alignment: .leading)
        .background(SoftGradient(useSaffron: useSaffron))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white.opacity(0.6), lineWidth: 1))
    }
}
