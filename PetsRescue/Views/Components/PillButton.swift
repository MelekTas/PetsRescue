import SwiftUI

struct PillButton: View {
    let title: String
    var icon: String? = nil
    var filled: Bool = true
    var compact: Bool = false
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                if let icon = icon {
                    Image(systemName: icon).font(.system(size: 13))
                }
                Text(title)
                    .font(.system(size: compact ? 14 : 16, weight: .medium))
            }
            .foregroundColor(filled ? Color.white : AppColor.tealDark)
            .padding(.horizontal, compact ? 14 : 20)
            .padding(.vertical, compact ? 7 : 12)
            .background(filled ? AppColor.tealDark : AppColor.field)
            .clipShape(Capsule())
        }
        .buttonStyle(.plain)
    }
}
