//
//  EmergencyCallCard.swift
//  PetsRescue
//
//  Created by Melek Tas on 20/10/2026.
//

import Foundation
import SwiftUI

struct EmergencyCallCard: View {
    let title: String
    let subtitle: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 14) {
                Image(systemName: "phone.fill")
                    .foregroundColor(.white)
                    .frame(width: 44, height: 44)
                    .background(Color.white.opacity(0.2))
                    .clipShape(Circle())

                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.system(size: 17, weight: .semibold))
                        .multilineTextAlignment(.leading)
                    Text(subtitle)
                        .font(.system(size: 13))
                        .opacity(0.85)
                }
                .foregroundColor(.white)

                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.white)
            }
            .padding(14)
            .background(
                LinearGradient(colors: [AppColor.red, AppColor.red.opacity(0.85)],
                               startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: AppColor.red.opacity(0.25), radius: 8, y: 4)
        }
        .buttonStyle(.plain)
    }
}
