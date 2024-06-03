//
//  EnterView.swift
//  https://www.hackingwithswift.com/quick-start/swiftui/how-to-read-text-from-a-textfield
//  https://www.hackingwithswift.com/articles/90/how-to-check-whether-a-value-is-inside-a-range
//  https://stackoverflow.com/questions/42822838/how-to-get-the-number-of-real-words-in-a-text-in-swift
//  https://stackoverflow.com/questions/57688242/swiftui-how-to-change-the-placeholder-color-of-the-textfield

import SwiftUI

struct EnterView: View {
    
    @State var entered = false
    @State var mismatch = false
    @State private var phrase: String = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack (alignment: .center) {
            Image("back")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                if self.entered {
                    Text("Your seed phrase: " + phrase)
                        .foregroundColor(.white)
                        .padding(.bottom, 42)
                } else {
                    TextField("", text: $phrase ,prompt: Text("Enter your seed phrase").foregroundColor(.white))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .font(.custom("JoyrideALT", size: 13.0))
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
                        .padding(.horizontal, 60)
                        .padding(.bottom)
                }
                
                HStack {
                    Button(action: {
                        dismiss()
                    }, label: { Image(systemName: "arrow.left") })
                    
                    .foregroundColor(.white)
                    
                    Spacer()
                    
                    Button(action: {
                        self.mismatch = false
                        
                        if (12...24).contains(phrase.components(separatedBy: .whitespacesAndNewlines).filter{!$0.isEmpty}.count) { self.entered = true
                        } else {
                            self.mismatch = true
                        }
                    }, label: {
                        HStack {
                            Text("ENTER")
                            Image(systemName: "arrow.right") }})
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
                    .disabled(self.entered)
                }
                .padding(.horizontal, 60)
                
                Text(self.mismatch ? "Must be minimum 12 and maximum 24" : "Connection failed")
                    .foregroundColor(self.mismatch ? .yellow : .red)
                    .opacity(self.entered || self.mismatch ? 1 : 0)
                    .font(.custom("JoyrideALT", size: 13.0))
                    .padding(.top, -14)
                    .offset(y: 80)
            }
        }
    }
}

struct EnterView_Previews: PreviewProvider {
    static var previews: some View {
        EnterView().previewInterfaceOrientation(.landscapeLeft)
    }
}
