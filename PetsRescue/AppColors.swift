import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let r = Double((int >> 16) & 0xFF) / 255
        let g = Double((int >> 8) & 0xFF) / 255
        let b = Double(int & 0xFF) / 255
        self.init(red: r, green: g, blue: b)
    }
}

enum AppColor {
    // Teal
    static let teal       = Color(hex: "2A9D8F")
    static let tealDark   = Color(hex: "1F7A6F")
    static let tealDeep   = Color(hex: "17635A")
    static let tealTint   = Color(hex: "DDEFEB")
    static let mint       = Color(hex: "EAF6F3")
    static let avatar     = Color(hex: "CDEBE6")

    // Saffron
    static let saffron     = Color(hex: "E9C46A")
    static let saffronTint = Color(hex: "F6E7BF")
    static let saffronGlow = Color(hex: "F3D99A")
    static let sand        = Color(hex: "FBF4E3")
    static let saffronText = Color(hex: "5C4410")

    // Red (sadece acil durum ve silme)
    static let red     = Color(hex: "C62F3B")
    static let redTint = Color(hex: "FDE5E7")
    static let redText = Color(hex: "8E1F2A")

    // Metin ve yüzeyler
    static let title        = Color(hex: "264653")
    static let body         = Color(hex: "4A6266")
    static let onTint       = Color(hex: "17463F")
    static let background   = Color(hex: "F4F8F7")
    static let card         = Color(hex: "FFFFFF")
    static let field        = Color(hex: "E4ECEA")
    static let separator    = Color(hex: "E1E8E7")
    static let segmentTrack = Color(hex: "E3E9E8")
}
