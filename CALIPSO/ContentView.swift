//
//  ContentView.swift
//  CALIPSO
//
//  https://swiftwithmajid.com/2021/10/28/blur-effect-and-materials-in-swiftui/
//  https://www.swiftbysundell.com/questions/syncing-the-width-or-height-of-two-swiftui-views/

import SwiftUI

struct ContentView: View {
    
    @State var enterPresenting = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("back")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image("vector")
                        .resizable()
                        .frame(width: 40, height: 20)
                    
                    Text("C A L I P S O")
                        .foregroundStyle(.white)
                        .font(.custom("Techno-'Til-Dawn", size: 42.0))
                    
                    Group {
                        Button(action: {
                            UIApplication.shared.open(URL(string: "https://www.google.com")!, options: [:], completionHandler: nil)
                        }, label: { Text("CONNECT WALLET") })
                        
                        NavigationLink("ENTER SEED", destination: EnterView().navigationBarBackButtonHidden(true), isActive: $enterPresenting)
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .font(.custom("JoyrideALT", size: 14.0))
                    .padding()
                    .background(
                        .ultraThinMaterial.opacity(0.4),
                        in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                    )
                    .cornerRadius(60)
                    .overlay(
                        RoundedRectangle(cornerRadius: 60)
                            .stroke(.white.opacity(0.5), lineWidth: 2)
                    )
                    .padding(.horizontal, 150)
                    .padding(.top, 5)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewInterfaceOrientation(.landscapeLeft)
    }
}
