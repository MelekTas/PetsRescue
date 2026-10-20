//
//  ContactCard.swift
//  PetsRescue
//
//  Created by Melek Tas on 20/10/2026.
//

import Foundation
import SwiftUI

extension ContactBadge {
    var text: String {
        switch self {
        case .open24h: return "24/7"
        case .hotline: return "Hotline"
        case .openNow: return "Open now"
        }
    }
    var symbol: String {
        switch self {
        case .open24h: return "clock.fill"
        case .hotline: return "phone.fill"
        case .openNow: return "checkmark.circle.fill"
        }
    }
}

extension ContactType {
    var iconName: String {
        switch self {
        case .association: return "pawprint.fill"
        case .veterinarian: return "stethoscope"
        }
    }
}

struct BadgePill: View {
    let badge: ContactBadge

    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: badge.symbol).font(.system(size: 10))
            Text(badge.text).font(.system(size: 12))
        }
        .foregroundColor(AppColor.onTint)
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(Color.white.opacity(0.7))
        .clipShape(Capsule())
    }
}

struct ContactCard: View {
    let contact: Contact
    let useSaffron: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Image(systemName: contact.type.iconName)
                .foregroundColor(AppColor.tealDark)
                .frame(width: 36, height: 36)
                .background(Color.white.opacity(0.85))
                .clipShape(Circle())

            Spacer(minLength: 8)

            Text(contact.name)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(AppColor.title)
                .lineLimit(1)

            HStack(spacing: 4) {
                Image(systemName: "mappin.and.ellipse").font(.system(size: 11))
                Text(contact.area).font(.system(size: 13))
            }
            .foregroundColor(AppColor.body)

            BadgePill(badge: contact.badge).padding(.top, 2)
        }
        .padding(12)
        .frame(maxWidth: .infinity, minHeight: 150, alignment: .leading)
        .background(
            LinearGradient(
                colors: useSaffron ? [AppColor.tealTint, AppColor.saffronGlow]
                                   : [AppColor.teal.opacity(0.55), AppColor.tealTint],
                startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white.opacity(0.6), lineWidth: 1))
    }
}
