//
//  ProgressListRow.swift
//  PetsRescue
//
//  Created by Melek Tas on 21/10/2026.
//

import Foundation
import SwiftUI

struct ProgressListRow: View {
    let lesson: LessonSet
    let buttonTitle: String
    var filled: Bool = false
    let action: () -> Void

    private var almostThere: Bool {
        lesson.isStarted && lesson.left == 1
    }

    var body: some View {
        HStack(spacing: 12) {
            ProgressRing(value: lesson.progress, label: "\(lesson.percent)%")

            VStack(alignment: .leading, spacing: 3) {
                Text(lesson.title)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(AppColor.title)
                Text(lesson.statusText)
                    .font(.system(size: 12))
                    .foregroundColor(AppColor.body)
                if almostThere {
                    Text("Almost there")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(AppColor.saffronText)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 3)
                        .background(AppColor.saffronTint)
                        .clipShape(Capsule())
                }
            }
            Spacer(minLength: 0)
            PillButton(title: buttonTitle, filled: filled, compact: true, action: action)
        }
        .padding(14)
    }
}
