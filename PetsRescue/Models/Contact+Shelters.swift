import Foundation

extension Contact {
    static let shelters: [Contact] = [
        Contact(name: "Happy Paws Shelter",
                area: "Fuorigrotta",
                phone: "081 000 0101",
                type: .association,
                badge: .openNow,
                subtitle: "Animal Shelter",
                hours: "On appointment",
                services: "Dogs and cats · Adopt or surrender",
                address: "Via Roma 24, Fuorigrotta",
                addressNote: "Naples (NA)"),

        Contact(name: "Second Chance Centre",
                area: "Chiaia",
                phone: "081 000 0202",
                type: .association,
                badge: .openNow,
                subtitle: "Animal Shelter",
                hours: "On appointment",
                services: "Cats, small pets · By appointment",
                address: "Corso Italia 8, Chiaia",
                addressNote: "Naples (NA)"),

        Contact(name: "Safe Haven Kennels",
                area: "Vomero",
                phone: "081 000 0303",
                type: .association,
                badge: .openNow,
                subtitle: "Animal Shelter",
                hours: "Closed now · Opens at 9:00",
                services: "Dogs · Surrender by phone",
                address: "Via dei Fiori 3, Vomero",
                addressNote: "Naples (NA)")
    ]
}
