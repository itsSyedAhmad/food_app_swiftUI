//
//  LaunchScreen.swift
//  FoodApp
//
//  Created by Saif Ahmad on 08/11/26.
//

import SwiftUI

enum AuthRoute: Hashable {
    case signIn
    case signUp
}

struct LaunchScreen: View {
    @State private var path: [AuthRoute] = []
    var body: some View {
        NavigationStack(path: $path) {
            VStack(alignment: .center) {
                Image("AppImage")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 202, height: 257)
                    .foregroundStyle(.yellowBase)
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(.whiteBase)
                    .multilineTextAlignment(.center)
                
                AppButton(label: "Log In", labelColor: Color("orangeBase"), backgroundColor: .yellowBase) {
                    path.append(.signIn)
                }
                
                AppButton(label: "Sign Up", labelColor: Color("orangeBase"), backgroundColor: .yellow2) {
                    path.append(.signUp)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity)
            .background(.orangeBase)
            .navigationDestination(for: AuthRoute.self) { route in
                switch route {
                case .signIn:
                    LoginScreen(showSignUp: {
                        path = [.signUp]
                    })
                    
                case .signUp:
                    SignUpScreen(showSignUp: {
                        path = [.signIn]
                    })
                }
            }
        }
        .onChange(of: path) { oldValue, newValue in
            print("old value \(oldValue)")
            print("newValue value \(newValue)")
        }
    }
}

#Preview {
    LaunchScreen()
}
