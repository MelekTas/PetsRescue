//
//  MainTabView.swift
//  PetsRescue
//
//  Created by Melek Tas on 20/10/2026.
//

import Foundation
import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            EmergencyView()
                .tabItem { Label("Emergency", systemImage: "cross.case.fill") }

            Text("Adopt")
                .tabItem { Label("Adopt", systemImage: "pawprint.fill") }

            Text("Learn")
                .tabItem { Label("Learn", systemImage: "book.fill") }
        }
        .tint(AppColor.tealDark)
    }
}
