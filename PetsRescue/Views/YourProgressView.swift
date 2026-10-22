//
//  YourProgressView.swift
//  PetsRescue
//
//  Created by Melek Tas on 21/10/2026.
//

import Foundation
import SwiftUI

struct YourProgressView: View {
    @ObservedObject var vm: LearnViewModel
    let onOpen: (UUID) -> Void

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 14) {
                HStack {
                    CircleIconButton(systemName: "chevron.left") { dismiss() }
                    Spacer()
                    CircleIconButton(systemName: "ellipsis") { }
                }

                Text("Your progress")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(AppColor.title)

                HStack(spacing: 10) {
                    StatTile(title: "Streak", value: "\(vm.streakDays) days",
                             icon: "flame.fill", highlighted: true)
                    StatTile(title: "This week", value: "\(vm.minutesThisWeek) min")
                    StatTile(title: "Sets done",
                             value: "\(vm.finishedCount) of \(vm.sets.count)")
                }

                if !vm.inProgress.isEmpty {
                    label("IN PROGRESS")
                    group(vm.inProgress, buttonTitle: "Resume", filled: false)
                }

                if !vm.notStarted.isEmpty {
                    label("NOT STARTED")
                    group(vm.notStarted, buttonTitle: "Start", filled: true)
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 8)
            .padding(.bottom, 40)
        }
        .background(AppColor.background.ignoresSafeArea())
        .toolbar(.hidden, for: .navigationBar)
    }

    private func label(_ text: String) -> some View {
        Text(text)
            .font(.system(size: 12, weight: .medium))
            .foregroundColor(AppColor.body)
            .padding(.top, 6)
    }

    private func group(_ items: [LessonSet], buttonTitle: String, filled: Bool) -> some View {
        VStack(spacing: 0) {
            ForEach(items) { item in
                ProgressListRow(
                    lesson: item,
                    buttonTitle: buttonTitle,
                    filled: filled,
                    action: { onOpen(item.id) })
                if item.id != items.last?.id {
                    Divider()
                }
            }
        }
        .background(AppColor.card)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(AppColor.separator, lineWidth: 1))
    }
}
