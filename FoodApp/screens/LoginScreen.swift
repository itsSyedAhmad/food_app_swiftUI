//
//  LoginScreen.swift
//  FoodApp
//
//  Created by Saif Ahmad on 09/11/26.
//

import SwiftUI

struct LoginScreen: View {
    let showSignUp: () -> Void
    var body: some View {
        AppLayout(
            content: LoginContent(showSignUp: showSignUp),
            header:LoginHeader()
        )
        .navigationBarBackButtonHidden(true)
    }
}

struct LoginContent: View {
    @EnvironmentObject private var authController: AuthController
    
    let showSignUp: () -> Void
    @State var email = ""
    @State var password = ""
    
    let prompt = Text("Don't have an account? ")
        .foregroundStyle(Color("black2"))

    let signUp = Text("Sign Up")
        .foregroundStyle(Color("orangeBase"))
        .bold()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Spacer()
                    .frame(height: 34)
                Text("Welcome")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundStyle(.font)
                Spacer()
                    .frame(height: 19)
                Text("Sign in to discover delicious meals, track your orders, and enjoy quick delivery. ")
                    .font(.system(size: 14, weight: .light))
                    .foregroundStyle(.black2)
                Spacer()
                    .frame(height: 46)
                AppTextField(
                    label: "Email or Mobile Number",
                    hintText: "example.com",
                    text: $email,
                    onChanged: { value in
                        email = value
                    }
                )
                Spacer()
                    .frame(height: 22)
                AppTextField(
                    label: "Password",
                    hintText: "Password",
                    text: $password,
                    onChanged: { value in
                        password = value
                    }
                )

                Spacer()
                    .frame(height: 43)

                AppButton(label: "Log In", labelColor: .whiteBase, backgroundColor: .orangeBase) {
                    
                    authController.signIn(email: email, password: password)
                    
                    
                }
                    .frame(maxWidth: .infinity, alignment: .center)

                Spacer()
                    .frame(height: 10)
                
                Button {
                    showSignUp()
                    
                } label: {
                    Text("\(prompt)\(signUp)")
                        .font(.system(size: 14))
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                }

                
            }
            .padding(.horizontal, 36)
        }
    }
}

struct LoginHeader: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Button {
                    dismiss()
                }
                label: {
                    Image(systemName: "chevron.left")
                        .frame(maxHeight: 24)
                        .frame(width: 24)
                        .foregroundStyle(.red)
                }

                Spacer()
                Text("Log In")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundStyle(.whiteBase)
                Spacer()
                Spacer()
                    .frame(maxHeight: 24)
                    .frame(width: 24)
            }
            Spacer()
        }
    }
}

#Preview {
    LoginScreen(showSignUp: {})
}
