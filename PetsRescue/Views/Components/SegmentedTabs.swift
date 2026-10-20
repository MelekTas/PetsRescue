import SwiftUI

struct SegmentedTabs: View {
    @Binding var selection: ContactType

    var body: some View {
        HStack(spacing: 0) {
            ForEach(ContactType.allCases, id: \.self) { type in
                Text(type.rawValue)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(AppColor.title)
                    .frame(maxWidth: .infinity)
                    .frame(height: 38)
                    .background(
                        RoundedRectangle(cornerRadius: 14)
                            .fill(selection == type ? AppColor.card : Color.clear)
                    )
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.2)) { selection = type }
                    }
            }
        }
        .padding(4)
        .background(AppColor.segmentTrack)
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }
}
