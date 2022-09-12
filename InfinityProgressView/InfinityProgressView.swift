//
//  ContentView.swift
//  CodeSync
//
//  Created by Evgeniy Safin on 01.09.2022.
//

import SwiftUI

struct InfinityProgressView_Previews: PreviewProvider {
    static var previews: some View {
        InfinityProgressView(duration: 2)
    }
}

struct InfinityProgressView: View {
    
    @State private var animationTrigger: Bool = false
    let duration: Double
    
    var body: some View {
        
        let animation = Animation.linear(duration: duration).repeatForever(autoreverses: false)
        
        ZStack {
            InfinityProgressViewPartOne(degrees: animationTrigger ? 360 : 45)
                .stroke(style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap.round))
            InfinityProgressViewPartTwo(degrees: animationTrigger ? 180 : -135)
                .stroke(style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap.round))
        }
        .frame(width: 50, height: 25)
        .onAppear {
            withAnimation(animation) {
                animationTrigger.toggle()
            }
        }
    }
}

struct InfinityProgressViewPartOne: Shape {
    
    var degrees: Double
    var animatableData: Double {
        get {
            degrees
        }
        set {
            degrees = newValue
        }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.addArc(
                center: CGPoint(x: rect.width / 4, y: rect.midY),
                radius: rect.width / 4,
                startAngle: Angle(degrees: 45),
                endAngle: Angle(degrees: degrees),
                clockwise: false)
        }
    }
}

struct InfinityProgressViewPartTwo: Shape {
    
    var degrees: Double
    var animatableData: Double {
        get {
            degrees
        }
        set {
            degrees = newValue
        }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.addArc(
                center: CGPoint(x: rect.width / 4 * 3, y: rect.midY),
                radius: rect.width / 4,
                startAngle: Angle(degrees: -135),
                endAngle: Angle(degrees: degrees),
                clockwise: false)
        }
    }
}
