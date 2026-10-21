//
//  AdoptionViewModel.swift
//  PetsRescue
//
//  Created by Sabrina Corrado on 21/10/2026.
//

import Foundation
import Combine

class AdoptionViewModel: ObservableObject { //is a protocol, when data change, the view will update automatically
    @Published var searchText = ""
    @Published var selectedShelter: Contact?
    
    private let shelters = Contact.shelters
    
    var filteredShelters: [Contact] {
        shelters.filter {shelter in searchText.isEmpty || shelter.name.localizedCaseInsensitiveContains(searchText) || shelter.area.localizedCaseInsensitiveContains(searchText)}
    }
    
    func phoneURL(for shelter: Contact) -> URL? {
        let number = shelter.phone.replacingOccurrences(of: " ", with: "")
        return URL(string: "tel:\(number)")
    }
    
}
