//
//  OnboardingView.swift
//  PetsRescue
//
//  Created by Sabrina Corrado on 22/10/2026.
//


// container with swipe and buttons

import SwiftUI



struct OnboardingView: View {
    
    @State private var currentPage = 0
    @State private var showWelcome = false // È un interruttore acceso/spento: false = Welcome nascosta, true = Welcome visibile.
    private let pages = OnboardingPage.pages
    
    var body: some View {
        
        VStack {
            
            // Up Bar
            HStack {
                if currentPage > 0 {
                    
                    Button {
                        withAnimation {currentPage -= 1}
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.headline)
                            .foregroundStyle(AppColor.title)
                            .frame(width: 36, height: 36)
                            .background(AppColor.field, in: Circle())
                    }
                    
                }

            Spacer()
            
            Button("Skip") {
                showWelcome = true
            }
            .font(.subheadline)
            .foregroundStyle(AppColor.body)
            .padding(.horizontal, 14)
                            .padding(.vertical, 8)
                            .background(AppColor.field, in: Capsule())
        }
                    .frame(height: 44)
                    .padding(.horizontal, 24)
            
        // TabView - to scroll the pages
            
            TabView(selection: $currentPage) {
                            ForEach(pages.indices, id: \.self) { index in
                                OnboardingPageView(page: pages[index])
                                    .tag(index)
                            }
            }
                        .tabViewStyle(.page(indexDisplayMode: .never))

     // Points
            
            HStack(spacing: 8) {
                            ForEach(pages.indices, id: \.self) { index in
                                Circle()
                                    .fill(index == currentPage ? AppColor.title : AppColor.body.opacity(0.3))
                                    .frame(width: 6, height: 6)
                            }
                        }
                        .padding(.bottom, 24)

            // Button - Continue
            
            Button {
                if currentPage < pages.count - 1 {
                    withAnimation { currentPage += 1 }
                } else {
                    showWelcome = true
                }
                        } label: {
                            Text("Continue")
                                .font(.headline)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 16)
                                .background(AppColor.tealDark, in: Capsule())
                        }
                        .padding(.horizontal, 24)
                        .padding(.bottom, 8)
                    }
                    .background(AppColor.background)
                    .fullScreenCover(isPresented: $showWelcome) {
                        WelcomeView()
                    } // .fullScreenCover vuol dire: “quando showWelcome diventa true, copri tutto lo schermo con WelcomeView”. Il $ collega l’interruttore, proprio come facevi con il TabView.
                }
}

#Preview {
    OnboardingView()
}
