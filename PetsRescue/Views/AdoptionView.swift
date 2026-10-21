//
//  AdoptionView.swift
//  PetsRescue
//
//  Created by Sabrina Corrado on 21/10/2026.
//

import SwiftUI

struct AdoptionView: View {
    var body: some View {
        ScrollView {
            ForEach(Contact.shelters) { shelter in
                AdoptionCardView(contact: shelter)
            }
        }
    }
}

#Preview {
    AdoptionView()
}
