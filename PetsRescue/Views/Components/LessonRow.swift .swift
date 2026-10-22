//
//  LessonRow.swift .swift
//  PetsRescue
//
//  Created by Melek Tas on 21/10/2026.
//

import Foundation
import SwiftUI

struct LessonRow: View {
    let lesson: LessonSet

    var body: some View {
        HStack(spacing: 10) {
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text(lesson.title)
                        .font(.system(size: 17))
                        .foregroundColor(AppColor.title)
                    Spacer()
                    Text("\(lesson.percent)%")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(AppColor.tealDark)
                }
                ProgressBar(value: lesson.progress, height: 4)
                Text(lesson.statusText)
                    .font(.system(size: 12))
                    .foregroundColor(AppColor.body)
            }
            Image(systemName: "chevron.right")
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(AppColor.body)
        }
        .padding(14)
        .contentShape(Rectangle())
    }
}
