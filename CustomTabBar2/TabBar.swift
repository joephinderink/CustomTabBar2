//
//  TabBar.swift
//  CommercieleClub
//
//  Created by Joep Hinderink on 16/01/2021.
//

import SwiftUI

class States: ObservableObject {
    @Published var nieuws = true
    @Published var events = false
    @Published var leden  = false
    @Published var bestuur = false
}


struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner
    
    struct CornerRadiusShape: Shape {
        
        var radius = CGFloat.infinity
        var corners = UIRectCorner.allCorners
        
        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }
    
    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}

extension View {
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}

struct TabBar: View {
    
    @EnvironmentObject var states : States
    
    var body: some View {
        HStack {
            Button (action: {
                withAnimation {
                    states.events = false
                    states.nieuws = true
                    states.leden = false
                    states.bestuur = false
                }
            }, label: {
                Image(systemName: "newspaper.fill")
            })
            .padding(. bottom, 20)
            .padding(.horizontal)
            Button (action: {
                withAnimation {
                    states.events = true
                    states.nieuws = false
                    states.leden = false
                    states.bestuur = false
                }
            }, label: {
                Image(systemName: "calendar")
            })
            .padding(. bottom, 20)
            .padding(.horizontal)
            Button (action: {
                withAnimation {
                    states.events = false
                    states.nieuws = false
                    states.leden = true
                    states.bestuur = false
                }
            }, label: {
                Image(systemName: "person.fill")
            })
            .padding(. bottom, 20)
            .padding(.horizontal)
            Button (action: {
                withAnimation {
                    states.events = false
                    states.nieuws = false
                    states.leden = false
                    states.bestuur = true
                }
            }, label: {
                Image(systemName: "person.3.fill")
            })
            .padding(. bottom, 20)
            .padding(.horizontal)
        }
        .foregroundColor(.black)
        .frame(width: UIScreen.main.bounds.width, height: 110)
        .background(Color.blue)
        .cornerRadius(radius: 50, corners: [.topLeft, .topRight])
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
