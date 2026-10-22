import Foundation

struct Flashcard: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    var steps: [String] = [
        "Wait until your dog sits.",
        "Reward within two seconds.",
        "Repeat 5 times, then take a break."
    ]
    var tip: String = "Practise in a quiet place, 5 minutes a day"
}

struct LessonSet: Identifiable {
    let id = UUID()
    let title: String
    let eyebrow: String        // "5 commands · 14 days"
    let meta: String           // "9 skills · 14 days"
    let duration: String       // "10 min"
    let icon: String           // SF Symbol
    var badge: String? = nil   // "New" / "15 min"
    var isEssential: Bool = false
    let cards: [Flashcard]
    var completedCards: Int = 0

    var progress: Double {
        cards.isEmpty ? 0 : Double(completedCards) / Double(cards.count)
    }
    var percent: Int { Int((progress * 100).rounded()) }
    var left: Int { cards.count - completedCards }
    var isStarted: Bool { completedCards > 0 }
    var isFinished: Bool { completedCards >= cards.count }

    var currentCardTitle: String {
        if cards.isEmpty { return "" }
        let index = min(completedCards, cards.count - 1)
        return cards[index].title
    }

    var statusText: String {
        if isStarted {
            return "Stopped at card \(completedCards + 1) of \(cards.count) · \(left) left"
        }
        return "\(cards.count) cards · \(duration)"
    }
}

extension LessonSet {
    static func makeCards(_ titles: [String]) -> [Flashcard] {
        var result: [Flashcard] = []
        for title in titles {
            if title == "Sit" {
                result.append(Flashcard(
                    title: "Sit",
                    description: "Hold your open hand flat, palm up, at your dog’s chest height. Raise it slowly while saying “Sit” once."))
            } else {
                result.append(Flashcard(
                    title: title,
                    description: "Practise the “\(title)” step by step with your pet. Stay calm and reward every try."))
            }
        }
        return result
    }

    // Tasarımdaki 17. ekran için bazı setler yarım kalmış durumda.
    // 16. ekranı görmek için completedCards değerlerini 0 yapın.
    static let samples: [LessonSet] = [
        LessonSet(
            title: "Special training program",
            eyebrow: "5 commands · 14 days",
            meta: "5 commands · 14 days",
            duration: "14 days",
            icon: "dog.fill",
            isEssential: true,
            cards: makeCards(["Sit", "Down", "Come", "Heel", "Stay"]),
            completedCards: 4),
        LessonSet(
            title: "Hand signals",
            eyebrow: "9 skills · 14 days",
            meta: "9 skills · 14 days",
            duration: "14 days",
            icon: "hand.raised.fill",
            badge: "New",
            cards: makeCards(["Sit", "Stay", "Down", "Come", "Heel", "Leave it", "Wait", "Touch", "Spin"]),
            completedCards: 4),
        LessonSet(
            title: "Speak your pet’s language",
            eyebrow: "3 skills · 15 min",
            meta: "3 skills · 15 min",
            duration: "15 min",
            icon: "bubble.left.and.bubble.right",
            badge: "15 min",
            cards: makeCards(["Body language", "Tail signals", "Sounds"]),
            completedCards: 1),
        LessonSet(
            title: "Approach a scared animal",
            eyebrow: "New set · 6 cards · 10 min",
            meta: "6 cards · 10 min",
            duration: "10 min",
            icon: "hand.raised.fill",
            isEssential: true,
            cards: makeCards(["Stay calm", "Crouch down", "Avoid eye contact", "Offer food", "Move slowly", "Call for help"]),
            completedCards: 0)
    ]
}
