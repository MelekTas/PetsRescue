import SwiftUI

struct AdoptionView: View {
    @StateObject private var vm = AdoptionViewModel()
    @State private var selectedShelter: Contact?
    @Environment(\.openURL) private var openURL

    var onProfileTap: () -> Void = { }

    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 14) {
                    HStack {
                        Spacer()
                        CircleIconButton(systemName: "person.fill", action: onProfileTap)
                    }

                    VStack(alignment: .leading, spacing: 6) {
                        Text("Adoption")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(AppColor.title)
                        Text("Call first · Shelters often have limited space")
                            .font(.system(size: 13))
                            .foregroundColor(AppColor.body)
                    }

                    SearchBar(text: $vm.searchText, placeholder: "Search shelters")

                    ForEach(Array(vm.filteredShelters.enumerated()), id: \.element.id) { index, shelter in
                        AdoptionCardView(contact: shelter, index: index) {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                selectedShelter = shelter
                            }
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 8)
                .padding(.bottom, 100)
            }
            .background(AppColor.background.ignoresSafeArea())

            if let shelter = selectedShelter {
                Color.black.opacity(0.25)
                    .ignoresSafeArea()
                    .onTapGesture { close() }

                callDialog(shelter)
                    .transition(.scale(scale: 0.9).combined(with: .opacity))
            }
        }
    }

    private func close() {
        withAnimation(.easeInOut(duration: 0.2)) {
            selectedShelter = nil
        }
    }

    private func callDialog(_ shelter: Contact) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(shelter.phone)
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.black)
            Text(shelter.name)
                .font(.system(size: 17))
                .foregroundColor(AppColor.body)

            HStack(spacing: 10) {
                Button { close() } label: {
                    Text("Cancel")
                        .font(.system(size: 17, weight: .medium))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .background(AppColor.field)
                        .clipShape(Capsule())
                }
                Button {
                    let number = shelter.phone.replacingOccurrences(of: " ", with: "")
                    if let url = URL(string: "tel:" + number) { openURL(url) }
                    close()
                } label: {
                    Text("Call")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .background(AppColor.tealDark)
                        .clipShape(Capsule())
                }
            }
            .padding(.top, 20)
        }
        .padding(20)
        .frame(width: 310)
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .shadow(color: Color.black.opacity(0.15), radius: 20, y: 8)
    }
}

#Preview {
    AdoptionView()
}
