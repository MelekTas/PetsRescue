import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var placeholder: String = "Search contacts"

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(AppColor.body)
            TextField(placeholder, text: $text)
                .foregroundColor(AppColor.title)
        }
        .padding(.horizontal, 14)
        .frame(height: 44)
        .background(AppColor.card)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(AppColor.separator, lineWidth: 1))
    }
}
