//
//  AdoptionView.swift
//  PetsRescue
//
//  Created by Sabrina Corrado on 21/10/2026.
//

import SwiftUI

struct AdoptionCardView: View {
    let contact: Contact
    @Environment(\.openURL) private var openURL
    
    var body: some View {
        VStack {
            Text("Adoption").font(.largeTitle).bold()
                .foregroundStyle(AppColor.title)
            
            Text("Call first · Shelters often have limited space").font(.system(size: 13))
                .foregroundColor(AppColor.body)
            
        }
        
        VStack (alignment: .leading, spacing: 6) {
            
            
            // Button {}
            Button {
                let number = contact.phone.replacingOccurrences(of: " ", with: "")
                if let url = URL(string: "tel:" + number) { openURL(url) }}
            label: {
                Label("Call", systemImage: "phone.fill").font(.system(size: 25)).foregroundStyle(.white)
                    .padding()
                    .background(AppColor.tealDeep)
                    .foregroundStyle(.white)
                    .clipShape(Capsule())
                
            }
            
        }
        
        Spacer()
        
    }
}
    #Preview {
        AdoptionCardView(contact: Contact.shelters[0])
    }

