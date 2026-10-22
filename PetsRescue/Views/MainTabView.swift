import SwiftUI

struct MainTabView: View {
    @StateObject private var learnVM = LearnViewModel()
    @State private var showProgress = false

    var body: some View {
        TabView {
            EmergencyView(onProfileTap: { showProgress = true })
                .tabItem { Label("Emergency", systemImage: "cross.case.fill") }

            AdoptionView(onProfileTap: { showProgress = true })
                .tabItem { Label("Adopt", systemImage: "pawprint.fill") }

            LearnView(vm: learnVM, onProfileTap: { showProgress = true })
                .tabItem { Label("Learn", systemImage: "book.fill") }
        }
        .tint(AppColor.tealDark)
        .sheet(isPresented: $showProgress) {
            NavigationStack {
                YourProgressView(vm: learnVM, onOpen: { _ in showProgress = false })
            }
        }
    }
}

#Preview {
    MainTabView()
}
