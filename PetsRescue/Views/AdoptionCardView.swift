import SwiftUI

struct AdoptionCardView: View {
    let contact: Contact
    let index: Int
    let onCall: () -> Void

    private var isClosed: Bool {
        contact.hours.hasPrefix("Closed")
    }

    private var gradientColors: [Color] {
        switch index % 3 {
        case 0: return [AppColor.saffronGlow, AppColor.tealTint, AppColor.teal.opacity(0.5)]
        case 1: return [AppColor.teal.opacity(0.5), AppColor.tealTint, AppColor.saffronGlow]
        default: return [AppColor.tealTint, AppColor.teal.opacity(0.4)]
        }
    }

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: "house.fill")
                .foregroundColor(AppColor.tealDark)
                .frame(width: 40, height: 40)
                .background(Color.white.opacity(0.9))
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 4) {
                Text(contact.name)
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(AppColor.title)

                if isClosed {
                    HStack(spacing: 6) {
                        Circle().fill(Color.orange).frame(width: 7, height: 7)
                        Text(contact.hours)
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(AppColor.saffronText)
                    }
                } else {
                    Text(contact.phone)
                        .font(.system(size: 17, weight: .medium))
                        .foregroundColor(AppColor.tealDark)
                }

                Text(contact.services)
                    .font(.system(size: 13))
                    .foregroundColor(AppColor.body)
                    .padding(.top, 4)

                HStack(spacing: 4) {
                    Image(systemName: "mappin.and.ellipse")
                    Text(contact.address)
                }
                .font(.system(size: 13))
                .foregroundColor(AppColor.body)
            }

            Spacer(minLength: 0)

            Button(action: onCall) {
                Label("Call", systemImage: "phone.fill")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(isClosed ? AppColor.body : .white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .background(isClosed ? Color.white.opacity(0.35) : AppColor.tealDark)
                    .clipShape(Capsule())
            }
            .buttonStyle(.plain)
            .disabled(isClosed)
        }
        .padding(14)
        .background(
            LinearGradient(colors: gradientColors,
                           startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .clipShape(RoundedRectangle(cornerRadius: 22))
        .overlay(RoundedRectangle(cornerRadius: 22).stroke(Color.white.opacity(0.6), lineWidth: 1))
    }
}

#Preview {
    AdoptionCardView(contact: Contact.shelters[0], index: 0, onCall: { })
        .padding()
}
