//
//  Contact.swift
//  PetsRescue
//
//  Created by Melek Tas on 20/10/2026.
//

import Foundation


enum ContactType: String, CaseIterable {
    case association = "Associations"
    case veterinarian = "Veterinarians"
}

enum ContactBadge {
    case open24h
    case hotline
    case openNow
}

struct Contact: Identifiable {
    let id = UUID()
    let name: String
    let area: String
    let phone: String
    let type: ContactType
    let badge: ContactBadge
    let subtitle: String      // "Rescue association" / "Veterinary clinic"
    let hours: String         // "Open 24 hours · Emergency rescue"
    let services: String      // "Animal transport · First response"
    let address: String       // "Via Esempio 12, Vomero"
    let addressNote: String   // "Naples (NA) · Near the central market"
}

extension Contact {
    static let samples: [Contact] = [
        Contact(name: "Paws Rescue", area: "Naples", phone: "081 000 0000",
                type: .association, badge: .open24h,
                subtitle: "Rescue association",
                hours: "Open 24 hours · Emergency rescue",
                services: "Animal transport · First response",
                address: "Via Esempio 12, Vomero",
                addressNote: "Naples (NA) · Near the central market"),
        Contact(name: "Hope for Strays", area: "Vomero", phone: "081 000 0001",
                type: .association, badge: .hotline,
                subtitle: "Rescue association",
                hours: "Hotline · Daily",
                services: "Stray rescue · Advice",
                address: "Via Example 1, Vomero",
                addressNote: "Naples (NA)"),
        Contact(name: "Safe Tails", area: "Chiaia", phone: "081 000 0002",
                type: .association, badge: .open24h,
                subtitle: "Rescue association",
                hours: "Open 24 hours · Emergency rescue",
                services: "Animal transport",
                address: "Via Example 2, Chiaia",
                addressNote: "Naples (NA)"),
        Contact(name: "City Animal Aid", area: "Fuorigrotta", phone: "081 000 0003",
                type: .association, badge: .hotline,
                subtitle: "Rescue association",
                hours: "Hotline · Daily",
                services: "First response",
                address: "Via Example 3, Fuorigrotta",
                addressNote: "Naples (NA)"),

        Contact(name: "Clinica Vomero", area: "Vomero", phone: "081 000 0111",
                type: .veterinarian, badge: .open24h,
                subtitle: "Veterinary clinic",
                hours: "Open 24 hours · Emergency visits",
                services: "Surgery · Diagnostics · X-ray",
                address: "Via Scarlatti 85, Vomero",
                addressNote: "Naples (NA) · Near Piazza Vanvitelli"),
        Contact(name: "AnimalCare 24h", area: "Chiaia", phone: "081 000 0112",
                type: .veterinarian, badge: .open24h,
                subtitle: "Veterinary clinic",
                hours: "Open 24 hours · Emergency visits",
                services: "Surgery · Diagnostics",
                address: "Via Example 4, Chiaia",
                addressNote: "Naples (NA)"),
        Contact(name: "Dr. Rossi Vet", area: "Fuorigrotta", phone: "081 000 0113",
                type: .veterinarian, badge: .openNow,
                subtitle: "Veterinary clinic",
                hours: "Open now · Daily visits",
                services: "Check-ups · Vaccines",
                address: "Via Example 5, Fuorigrotta",
                addressNote: "Naples (NA)"),
        Contact(name: "PetHealth Centre", area: "Centro Storico", phone: "081 000 0114",
                type: .veterinarian, badge: .openNow,
                subtitle: "Veterinary clinic",
                hours: "Open now · Daily visits",
                services: "Check-ups · Diagnostics",
                address: "Via Example 6, Centro Storico",
                addressNote: "Naples (NA)")
    ]
}
