//
//  ContactDetailView.swift
//  PetsRescue
//
//  Created by Melek Tas on 20/10/2026.
//

import Foundation
import SwiftUI

struct ContactDetailView: View {
    let contact: Contact
    @Environment(\.dismiss) private var dismiss
    @Environment(\.openURL) private var openURL

    var body: some View {
        VStack(spacing: 14) {
            // Top bar
            ZStack {
                Text("Details")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(AppColor.title)
                HStack {
                    Button { dismiss() } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(AppColor.title)
                            .frame(width: 40, height: 40)
                            .background(Color.white.opacity(0.8))
                            .clipShape(Circle())
                    }
                    Spacer()
                }
            }

            // Başlık kartı
            HStack(spacing: 14) {
                Image(systemName: contact.type.iconName)
                    .font(.system(size: 22))
                    .foregroundColor(AppColor.tealDark)
                    .frame(width: 52, height: 52)
                    .background(Color.white.opacity(0.9))
                    .clipShape(Circle())

                VStack(alignment: .leading, spacing: 3) {
                    Text(contact.name)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(AppColor.title)
                    Text(contact.subtitle)
                        .font(.system(size: 14))
                        .foregroundColor(AppColor.body)
                    BadgePill(badge: contact.badge)
                }
                Spacer()
            }
            .padding(14)
            .background(
                LinearGradient(colors: [AppColor.teal.opacity(0.5), AppColor.tealTint],
                               startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .clipShape(RoundedRectangle(cornerRadius: 20))

            // Telefon
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text("Phone")
                        .font(.system(size: 12))
                        .foregroundColor(AppColor.body)
                    Text(contact.phone)
                        .font(.system(size: 22, weight: .medium))
                        .foregroundColor(AppColor.title)
                }
                Spacer()
                Button {
                    let number = contact.phone.replacingOccurrences(of: " ", with: "")
                    if let url = URL(string: "tel:" + number) { openURL(url) }
                } label: {
                    Label("Call", systemImage: "phone.fill")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 12)
                        .background(AppColor.red)
                        .clipShape(Capsule())
                }
            }
            .padding(14)
            .background(AppColor.card)
            .clipShape(RoundedRectangle(cornerRadius: 20))

            // Bilgi satırları
            VStack(spacing: 0) {
                InfoRow(icon: "clock.fill", title: contact.hours, subtitle: contact.services)
                Divider()
                InfoRow(icon: "mappin.and.ellipse", title: contact.address, subtitle: contact.addressNote)
            }
            .background(AppColor.card)
            .clipShape(RoundedRectangle(cornerRadius: 20))

            Spacer()
        }
        .padding(20)
        .background(
            LinearGradient(colors: [AppColor.tealTint, AppColor.sand],
                           startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
        )
    }
}

struct InfoRow: View {
    let icon: String
    let title: String
    let subtitle: String

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(AppColor.tealDark)
                .frame(width: 32, height: 32)
                .background(AppColor.mint)
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(size: 15))
                    .foregroundColor(AppColor.title)
                Text(subtitle)
                    .font(.system(size: 12))
                    .foregroundColor(AppColor.body)
            }
            Spacer()
        }
        .padding(14)
    }
}
