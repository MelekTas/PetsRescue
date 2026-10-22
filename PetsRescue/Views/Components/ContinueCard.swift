//
//  ContinueCard.swift
//  PetsRescue
//
//  Created by Melek Tas on 21/10/2026.
//

import Foundation
import SwiftUI

struct ContinueCard: View {
    let lesson: LessonSet
    let action: () -> Void

    private var eyebrow: String {
        if lesson.left == 1 { return "Almost there · 1 left" }
        return "\(lesson.left) left"
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 4) {
                        Image(systemName: "flame.fill")
                        Text(eyebrow)
                    }
                    .font(.system(size: 13))
                    .foregroundColor(AppColor.saffronText)

                    Text(lesson.title)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(AppColor.title)
                    Text("Card \(lesson.completedCards + 1) of \(lesson.cards.count) · “\(lesson.currentCardTitle)”")
                        .font(.system(size: 13))
                        .foregroundColor(AppColor.body)
                }
                Spacer()
                Text("\(lesson.percent)%")
                    .font(.system(size: 34, weight: .medium))
                    .foregroundColor(AppColor.tealDark)
            }
            ProgressBar(value: lesson.progress, track: Color.white.opacity(0.6))
            PillButton(title: "Resume", icon: "play.fill", compact: true, action: action)
        }
        .padding(14)
        .background(SoftGradient(useSaffron: false))
    }
}
