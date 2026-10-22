//
//  FlashcardView.swift
//  PetsRescue
//
//  Created by Melek Tas on 21/10/2026.
//

import Foundation
import SwiftUI

struct FlashcardView: View {
    @ObservedObject var vm: LearnViewModel
    let setID: UUID

    @Environment(\.dismiss) private var dismiss
    @State private var index: Int
    @State private var isFlipped = false

    init(vm: LearnViewModel, setID: UUID) {
        self.vm = vm
        self.setID = setID
        let lesson = vm.lessonSet(for: setID)
        let done = lesson?.completedCards ?? 0
        let count = lesson?.cards.count ?? 1
        _index = State(initialValue: done >= count ? 0 : done)
    }

    var body: some View {
        VStack(spacing: 14) {
            if let lesson = vm.lessonSet(for: setID) {
                content(lesson)
            }
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 90)
        .background(AppColor.background.ignoresSafeArea())
        .toolbar(.hidden, for: .navigationBar)
    }

    // MARK: - İçerik

    @ViewBuilder
    private func content(_ lesson: LessonSet) -> some View {
        let card = lesson.cards[index]
        let isLast = index + 1 >= lesson.cards.count
        let fraction = Double(index + 1) / Double(lesson.cards.count)

        topBar(lesson)

        VStack(spacing: 6) {
            HStack {
                Text("Card \(index + 1) of \(lesson.cards.count)")
                Spacer()
                Text("\(Int((fraction * 100).rounded()))%")
                    .foregroundColor(AppColor.tealDark)
            }
            .font(.system(size: 13))
            .foregroundColor(AppColor.body)
            ProgressBar(value: fraction)
        }

        ZStack {
            frontFace(lesson, card)
                .opacity(isFlipped ? 0 : 1)
            backFace(card)
                .opacity(isFlipped ? 1 : 0)
                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
        }
        .rotation3DEffect(.degrees(isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
        .onTapGesture { flip() }

        buttons(lesson, isLast: isLast)
    }

    private func topBar(_ lesson: LessonSet) -> some View {
        ZStack {
            Text(lesson.title)
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(AppColor.title)
            HStack {
                CircleIconButton(systemName: "chevron.left") { dismiss() }
                Spacer()
                CircleIconButton(systemName: "ellipsis") { }
            }
        }
        .padding(.top, 8)
    }

    private func frontFace(_ lesson: LessonSet, _ card: Flashcard) -> some View {
        VStack(spacing: 12) {
            HStack {
                Text("FRONT")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(AppColor.body)
                Spacer()
            }
            Spacer()
            Image(systemName: lesson.icon)
                .font(.system(size: 64))
                .foregroundColor(AppColor.tealDark)
                .frame(width: 170, height: 170)
                .background(Color.white.opacity(0.6))
                .clipShape(Circle())
            Text(card.title)
                .font(.system(size: 34, weight: .bold))
                .foregroundColor(AppColor.title)
            Text("Tap the card to see how")
                .font(.system(size: 15))
                .foregroundColor(AppColor.body)
            Spacer()
        }
        .padding(20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(SoftGradient(useSaffron: false))
        .clipShape(RoundedRectangle(cornerRadius: 28))
    }

    private func backFace(_ card: Flashcard) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("BACK")
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(AppColor.body)
            Text(card.title)
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(AppColor.title)
            Text(card.description)
                .font(.system(size: 18))
                .foregroundColor(AppColor.title)

            VStack(alignment: .leading, spacing: 6) {
                Text("HOW TO PRACTISE")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(AppColor.body)
                ForEach(Array(card.steps.enumerated()), id: \.offset) { i, step in
                    Text("\(i + 1). \(step)")
                        .font(.system(size: 16))
                        .foregroundColor(AppColor.title)
                }
            }
            .padding(14)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(AppColor.mint)
            .clipShape(RoundedRectangle(cornerRadius: 18))

            Spacer()

            HStack(spacing: 8) {
                Image(systemName: "lightbulb")
                Text(card.tip)
                    .font(.system(size: 14, weight: .medium))
            }
            .foregroundColor(AppColor.saffronText)
        }
        .padding(20)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(AppColor.card)
        .clipShape(RoundedRectangle(cornerRadius: 28))
        .overlay(RoundedRectangle(cornerRadius: 28).stroke(AppColor.avatar, lineWidth: 1))
    }

    @ViewBuilder
    private func buttons(_ lesson: LessonSet, isLast: Bool) -> some View {
        if isFlipped {
            HStack(spacing: 12) {
                PillButton(title: "Flip", filled: false, action: { flip() })
                PillButton(title: isLast ? "Finish" : "Next card", action: { next(lesson) })
            }
        } else {
            PillButton(title: "Flip card", icon: "arrow.clockwise", action: { flip() })
        }
    }

    // MARK: - Aksiyonlar

    private func flip() {
        withAnimation(.easeInOut(duration: 0.5)) {
            isFlipped.toggle()
        }
    }

    private func next(_ lesson: LessonSet) {
        vm.markCardDone(setID: setID, count: index + 1)
        if index + 1 >= lesson.cards.count {
            dismiss()
            return
        }
        isFlipped = false
        index += 1
    }
}
