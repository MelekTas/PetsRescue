import SwiftUI

enum LearnRoute: Hashable {
    case progress
}

struct LearnView: View {
    @ObservedObject var vm: LearnViewModel
    var onProfileTap: () -> Void = { }

    @State private var path = NavigationPath()

    private let columns = [GridItem(.flexible(), spacing: 12),
                           GridItem(.flexible(), spacing: 12)]

    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    header
                    SearchBar(text: $vm.searchText, placeholder: "Search lessons")
                    mainContent
                }
                .padding(.horizontal, 20)
                .padding(.top, 8)
                .padding(.bottom, 100)
            }
            .background(AppColor.background.ignoresSafeArea())
            .toolbar(.hidden, for: .navigationBar)
            .navigationDestination(for: UUID.self) { id in
                FlashcardView(vm: vm, setID: id)
            }
            .navigationDestination(for: LearnRoute.self) { _ in
                YourProgressView(vm: vm, onOpen: { id in path.append(id) })
            }
        }
    }

    // MARK: - Bölümler

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Spacer()
                CircleIconButton(systemName: "person.fill", action: onProfileTap)
            }
            Text("Learn")
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(AppColor.title)
            Text("Short lessons for everyday care")
                .font(.system(size: 13))
                .foregroundColor(AppColor.body)
        }
    }

    @ViewBuilder
    private var mainContent: some View {
        if !vm.searchText.isEmpty {
            searchContent
        } else if vm.inProgress.isEmpty {
            freshContent
        } else {
            resumeContent
        }
    }

    private func sectionTitle(_ text: String) -> some View {
        Text(text)
            .font(.system(size: 20, weight: .semibold))
            .foregroundColor(AppColor.title)
            .lineLimit(1)
            .minimumScaleFactor(0.8)
    }

    // Ekran 16: hiç ilerleme yok
    private var freshContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            sectionTitle("Start with the essentials")
            if let essential = vm.nextEssential {
                FeaturedLessonCard(
                    eyebrow: essential.eyebrow,
                    title: essential.title,
                    buttonTitle: "Start training",
                    icon: essential.icon,
                    action: { path.append(essential.id) })
            }

            sectionTitle("Explore trainings")
            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(Array(vm.exploreSets.enumerated()), id: \.element.id) { index, item in
                    ExploreCard(lesson: item, useSaffron: index % 2 == 0)
                        .onTapGesture { path.append(item.id) }
                }
            }
        }
    }

    // Ekran 17: ilerleme var
    private var resumeContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                sectionTitle("Continue where you left off")
                Spacer()
                Button("All") { path.append(LearnRoute.progress) }
                    .font(.system(size: 15))
                    .foregroundColor(AppColor.tealDark)
            }

            continueGroup

            if let essential = vm.nextEssential {
                sectionTitle("Start with the essentials")
                FeaturedLessonCard(
                    eyebrow: essential.eyebrow,
                    title: essential.title,
                    buttonTitle: "Start",
                    icon: essential.icon,
                    useSaffron: true,
                    action: { path.append(essential.id) })
            }
        }
    }

    @ViewBuilder
    private var continueGroup: some View {
        if let first = vm.inProgress.first {
            let others = Array(vm.inProgress.dropFirst())
            VStack(spacing: 0) {
                ContinueCard(lesson: first, action: { path.append(first.id) })
                ForEach(others) { item in
                    Divider()
                    LessonRow(lesson: item)
                        .onTapGesture { path.append(item.id) }
                }
            }
            .background(AppColor.card)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(AppColor.separator, lineWidth: 1))
        }
    }

    // Arama sonuçları
    private var searchContent: some View {
        VStack(spacing: 0) {
            ForEach(vm.searchResults) { item in
                LessonRow(lesson: item)
                    .onTapGesture { path.append(item.id) }
                Divider()
            }
        }
        .background(AppColor.card)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    LearnView(vm: LearnViewModel())
}
