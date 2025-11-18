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
    @State private var animate = false

    var body: some View {
        Button(action: toggleStar) {
            Image(systemName: isStarred ? "star.fill" : "star")
                .font(.system(size: 40))
                .foregroundColor(isStarred ? .yellow : .gray)
                .scaleEffect(animate ? 1.2 : 1.0)
                .animation(.spring(response: 0.3, dampingFraction: 0.5), value: animate)
                .animation(.easeInOut(duration: 0.2), value: isStarred)
        }
    }

    private func toggleStar() {
        isStarred.toggle()

        // trigger pop animation
        animate = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            animate = false
        }
    }
}

#Preview {
    ContentView()
}
