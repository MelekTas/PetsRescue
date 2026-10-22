import SwiftUI
import Combine

class LearnViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var sets: [LessonSet] = LessonSet.samples
    @Published var streakDays = 4
    @Published var minutesThisWeek = 38

    var inProgress: [LessonSet] {
        sets.filter { $0.isStarted && !$0.isFinished }
    }

    var notStarted: [LessonSet] {
        sets.filter { !$0.isStarted }
    }

    var finishedCount: Int {
        sets.filter { $0.isFinished }.count
    }

    var nextEssential: LessonSet? {
        sets.first { $0.isEssential && !$0.isStarted }
    }

    var exploreSets: [LessonSet] {
        sets.filter { !$0.isEssential }
    }

    var searchResults: [LessonSet] {
        sets.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
    }

    func lessonSet(for id: UUID) -> LessonSet? {
        sets.first { $0.id == id }
    }

    func markCardDone(setID: UUID, count: Int) {
        guard let i = sets.firstIndex(where: { $0.id == setID }) else { return }
        if count > sets[i].completedCards {
            sets[i].completedCards = count
        }
    }
}
