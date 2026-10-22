import Foundation
import Combine

class AdoptionViewModel: ObservableObject {
    @Published var searchText = ""

    private let shelters = Contact.shelters

    var filteredShelters: [Contact] {
        shelters.filter { shelter in
            searchText.isEmpty ||
            shelter.name.localizedCaseInsensitiveContains(searchText) ||
            shelter.area.localizedCaseInsensitiveContains(searchText)
        }
    }
}
