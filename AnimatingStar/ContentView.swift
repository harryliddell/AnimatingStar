//
//  ContentView.swift
//  AnimatingStar
//
//  Created by Harry Liddell on 18/11/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            StarButton()
        }
        .padding()
    }
}

struct StarButton: View {
    @State private var isStarred = false
    @State private var isPopped = false
    @State private var glow = false

    var body: some View {
        ZStack {
            Button(action: toggleStar) {
                Image(systemName: isStarred ? "star.fill" : "star")
                    .font(.system(size: 40, weight: .regular))
                    .foregroundColor(isStarred ? .yellow : .gray)
                    .scaleEffect(isPopped ? 1.3 : 1.0)
                    .shadow(
                        color: isStarred && glow
                        ? Color.yellow.opacity(0.9)
                        : Color.clear,
                        radius: glow ? 20 : 0
                    )
                    .frame(width: 44, height: 44)
            }
            .buttonStyle(.plain)
            .animation(.spring(response: 0.25, dampingFraction: 0.5), value: isPopped)
            .animation(.easeInOut(duration: 0.2), value: isStarred)
            .animation(.easeInOut(duration: 0.6), value: glow)
        }
    }

    private func toggleStar() {

        let generator = UIImpactFeedbackGenerator(style: .soft)
        generator.impactOccurred()

        isStarred.toggle()

        
        isPopped = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            isPopped = false
        }

        if isStarred {
            
            glow = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                glow = false
            }

        } else {
            glow = false
        }
    }
    
}

// MARK: - Preview

#Preview {
    ContentView()
}
