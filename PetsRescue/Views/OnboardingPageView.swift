//
//  OnboardingPageView.swift
//  PetsRescue
//
//  Created by Sabrina Corrado on 22/10/2026.
//


// a single page

import SwiftUI

struct OnboardingPageView: View {
    
    let page: OnboardingPage
    
    var body: some View {
        
        VStack {
            
            ZStack {
                RoundedRectangle(cornerRadius: 40)
                    .fill(
                        LinearGradient(colors:  [AppColor.teal, AppColor.saffronTint, AppColor.avatar], startPoint: .topLeading,
                                       endPoint: .bottomTrailing))
                    .frame(width:354, height: 340)
                
                
                Circle()
                    .fill(AppColor.card.opacity(0.6))
                    .frame(width:196, height:196)
                    .glassEffect(.regular, in: .circle)
                
                
                Image(systemName: page.icon)
                    .font(.system(size: 84))
                    .foregroundStyle(AppColor.tealDark)
                
            }.padding()
            
            
            VStack {
                Text(page.title)
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(AppColor.title)
                
                Text(page.description)
                    .font(.system(size: 16))
                    .multilineTextAlignment(.center)
                    .foregroundColor(AppColor.body)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 1)
                
                
            }.padding()
            
        }

    }
}

#Preview {
    OnboardingPageView(page: OnboardingPage.pages[0])
}
