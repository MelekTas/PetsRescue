import SwiftUI
import Combine

class EmergencyViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var selectedType: ContactType = .association
    @Published var selectedContact: Contact?

    private let contacts = Contact.samples

    let hotlineNumber = "800178400"

    var filteredContacts: [Contact] {
        contacts.filter { contact in
            contact.type == selectedType &&
            (searchText.isEmpty ||
             contact.name.localizedCaseInsensitiveContains(searchText) ||
             contact.area.localizedCaseInsensitiveContains(searchText))
        }
    }

    func phoneURL(_ number: String) -> URL? {
        URL(string: "tel:" + number.replacingOccurrences(of: " ", with: ""))
    }
}
