//
//  Contact.swift
//  PetsRescue
//
//  Created by Melek Tas on 20/10/2026.
//

import Foundation

// MARK: - Contact type -------------------------------------------------------

enum ContactType: String, CaseIterable {
    case association = "Associations"
    case veterinarian = "Veterinarians"
}

extension ContactType {
    var iconName: String {
        switch self {
        case .association:  return "pawprint.fill"
        case .veterinarian: return "stethoscope"
        }
    }
}

// MARK: - Badge --------------------------------------------------------------

enum ContactBadge {
    case open24h
    case hotline
    case openNow
    case closedNow
}

extension ContactBadge {
    var text: String {
        switch self {
        case .open24h:   return "24/7"
        case .hotline:   return "Hotline"
        case .openNow:   return "Open now"
        case .closedNow: return "Closed now"
        }
    }

    var symbol: String {
        switch self {
        case .open24h:   return "clock.fill"
        case .hotline:   return "phone.fill"
        case .openNow:   return "checkmark.circle.fill"
        case .closedNow: return "xmark.circle.fill"
        }
    }
}

// MARK: - Model --------------------------------------------------------------

struct Contact: Identifiable {
    let id = UUID()
    let name: String
    let area: String
    let phone: String
    let type: ContactType
    let badge: ContactBadge
    let subtitle: String
    let hours: String
    let services: String
    let address: String
    let addressNote: String
}

// MARK: - Sample data ---------------------------------------------------------

extension Contact {
    static let samples: [Contact] = [
        // Associations (İlk ekran görüntündeki 4 kart)
        Contact(
            name: "Paws Rescue",
            area: "Naples",
            phone: "081 123 4567",
            type: .association,
            badge: .open24h,
            subtitle: "Rescue association",
            hours: "Open 24 hours · Emergency rescue",
            services: "Animal transport · First response",
            address: "Via Toledo 120",
            addressNote: "Naples (NA)"
        ),
        Contact(
            name: "Hope for Strays",
            area: "Vomero",
            phone: "081 234 5678",
            type: .association,
            badge: .hotline,
            subtitle: "Stray animal protection",
            hours: "Mon-Sat 08:00 - 20:00",
            services: "Medical aid · Adoption coordination",
            address: "Via Scarlatti 45",
            addressNote: "Naples (NA) · Near metro"
        ),
        Contact(
            name: "Safe Tails",
            area: "Chiaia",
            phone: "081 345 6789",
            type: .association,
            badge: .open24h,
            subtitle: "Emergency pet rescue",
            hours: "Open 24 hours",
            services: "Cat & dog rescue · Temporary shelter",
            address: "Riviera di Chiaia 88",
            addressNote: "Naples (NA)"
        ),
        Contact(
            name: "City Animal Aid",
            area: "Fuorigrotta",
            phone: "081 456 7890",
            type: .association,
            badge: .hotline,
            subtitle: "Animal welfare organisation",
            hours: "Hotline 24/7 · Office 09:00 - 18:00",
            services: "Reporting hotline · Veterinary network",
            address: "Viale Augusto 15",
            addressNote: "Naples (NA)"
        ),

        // Veterinarians
        Contact(
            name: "Clinica Veterinaria Napoli Centro",
            area: "Centro Storico",
            phone: "081 555 0199",
            type: .veterinarian,
            badge: .open24h,
            subtitle: "24/7 Emergency Clinic",
            hours: "Open 24 hours · Emergency surgical ward",
            services: "Surgery · Intensive care · Diagnostic imaging",
            address: "Corso Umberto I 210",
            addressNote: "Naples (NA)"
        ),
        Contact(
            name: "Ospedale Veterinario Vomero",
            area: "Vomero",
            phone: "081 555 0244",
            type: .veterinarian,
            badge: .openNow,
            subtitle: "Veterinary Hospital",
            hours: "08:30 - 20:30",
            services: "General clinic · Laboratory analysis",
            address: "Via Luca Giordano 72",
            addressNote: "Naples (NA)"
        )
    ]
}
