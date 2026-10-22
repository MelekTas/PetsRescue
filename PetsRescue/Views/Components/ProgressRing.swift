//
//  ProgressRing.swift
//  PetsRescue
//
//  Created by Melek Tas on 21/10/2026.
//

import Foundation
import SwiftUI

struct ProgressRing: View {
    let value: Double
    let label: String

    var body: some View {
        ZStack {
            Circle().stroke(AppColor.tealTint, lineWidth: 4)
            Circle()
                .trim(from: 0, to: CGFloat(value))
                .stroke(AppColor.tealDark, style: StrokeStyle(lineWidth: 4, lineCap: .round))
                .rotationEffect(.degrees(-90))
            Text(label)
                .font(.system(size: 11, weight: .semibold))
                .foregroundColor(AppColor.tealDark)
        }
        .frame(width: 46, height: 46)
    }
}
