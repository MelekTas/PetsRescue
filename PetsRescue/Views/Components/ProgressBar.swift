//
//  ProgressBar.swift
//  PetsRescue
//
//  Created by Melek Tas on 21/10/2026.
//

import Foundation
import SwiftUI

struct ProgressBar: View {
    let value: Double
    var height: CGFloat = 5
    var track: Color = AppColor.separator

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Capsule().fill(track)
                Capsule()
                    .fill(AppColor.tealDark)
                    .frame(width: geo.size.width * CGFloat(min(max(value, 0), 1)))
            }
        }
        .frame(height: height)
    }
}
