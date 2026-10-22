import SwiftUI

struct EmergencyView: View {
    @StateObject private var vm = EmergencyViewModel()
    @Environment(\.openURL) private var openURL

    var onProfileTap: () -> Void = { }

    private let columns = [GridItem(.flexible(), spacing: 12),
                           GridItem(.flexible(), spacing: 12)]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 14) {
                HStack {
                    Spacer()
                    CircleIconButton(systemName: "person.fill", action: onProfileTap)
                }

                VStack(alignment: .leading, spacing: 4) {
                    Text("Emergency")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(AppColor.title)
                    Text("Works offline · Tap a card for details")
                        .font(.system(size: 13))
                        .foregroundColor(AppColor.body)
                }

                EmergencyCallCard(
                    title: "Call Ufficio Tutela Animali del Comune",
                    subtitle: "Naples · free call"
                ) {
                    if let url = vm.phoneURL(vm.hotlineNumber) { openURL(url) }
                }

                SearchBar(text: $vm.searchText)
                SegmentedTabs(selection: $vm.selectedType)

                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(Array(vm.filteredContacts.enumerated()), id: \.element.id) { index, contact in
                        ContactCard(contact: contact, useSaffron: index % 2 == 1)
                            .onTapGesture { vm.selectedContact = contact }
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 8)
            .padding(.bottom, 100)
        }
        .background(AppColor.background.ignoresSafeArea())
        .sheet(item: $vm.selectedContact) { contact in
            ContactDetailView(contact: contact)
                .presentationDetents([.medium, .large])
        }
    }
}

#Preview {
    EmergencyView()
}
