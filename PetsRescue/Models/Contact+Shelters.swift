//
//  SheltersContact.swift
//  PetsRescue
//
//  Created by Sabrina Corrado on 20/10/2026.
//

import Foundation

extension Contact {
    static let shelters: [Contact] = [
        Contact(name: "Happy Paws Shelter",
                area: "Fuorigrotta, Naples",
                phone: "081 000 010",
                type: .adoption,
                badge: .openNow,
                subtitle: "Animal Shelter", hours: "On appointment",
                services: "Dogs and cats · Adopt or surrender",
                address: "􀎫 Via Roma 24, Fuorigrotta",
                addressNote: "Naples (NA)"),
        
        Contact(name:"Second Chance Centre",
                area: "Chiaia, Naples",
                phone: "081 000 0202",
                type: .adoption,
                badge: .openNow,
                subtitle: "Animal Shelter", hours: "On appointment",
                services: "Cats, small pets · By appointment",
                address: "􀎫 Corso Italia 8, Chiaia",
                addressNote: "Naples (NA)"),
        
        Contact(name: "Safe Haven Kennels", 
                area: "Vomero, Naples",
                phone: "081 000 0303",
                type: .adoption,
                badge: .closedNow,
                subtitle: "Animal Shelter",
                hours: "On appointment",
                services: "Dogs · Surrender by phone",
                address: "􀎫 Via dei Fiori 3, Vomero",
                addressNote: "Naples (NA)")
        
        ]
    
}
