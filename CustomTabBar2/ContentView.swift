//
//  ContentView.swift
//  CommercieleClub
//
//  Created by Joep Hinderink on 16/01/2021.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var states : States
    
    var body: some View {
        ZStack {
            if states.nieuws {
//                Nieuws()
            } else if states.events {
//                Events()
            } else if states.leden {
//                Leden()
            } else if states.bestuur {
//                Bestuur()
            }
            TabBar()
                .offset(y: UIScreen.main.bounds.height / 2.18)
                .padding(.bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(States())
    }
}
