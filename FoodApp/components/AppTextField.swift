//
//  AppTextField.swift
//  FoodApp
//
//  Created by Saif Ahmad on 09/11/26.
//

import SwiftUI

struct AppTextField: View {
    let label: String
    let hintText: String
    @Binding var text: String
    
    var keyboardType: UIKeyboardType = .default
    
    var obscureText = false
    @State var isPasswordVisible = false
    
    var onChanged: (String) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(label)
                .font(.system(size: 20, weight: .medium))
                .foregroundStyle(.font)
            
            Spacer()
                .frame(maxHeight: 8)
                            
            HStack {
                if obscureText && !isPasswordVisible {
                    SecureField("", text: $text, prompt: Text(hintText).foregroundColor(.font))
                        .keyboardType(keyboardType)
                        .font(.system(size: 18))
                        .foregroundStyle(.font)
                }
                else {
                    TextField("", text: $text, prompt: Text(hintText).foregroundColor(.font))
                        .keyboardType(keyboardType)
                        .font(.system(size: 18))
                        .foregroundStyle(.font)
                }
                
                if obscureText {
                    Button {
                        isPasswordVisible = !isPasswordVisible
                    }
                    label: {
                        Image(systemName: "eye")
                            .frame(maxHeight: 24)
                            .frame(width: 24)
                            .foregroundStyle(.red)
                    }
                }
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 10)
            .background(Color("yellow2"))
            .clipShape(RoundedRectangle(cornerRadius: 18))
            .overlay {
                RoundedRectangle(cornerRadius: 18)
                    .stroke(
                        Color(.blueBase),
                        lineWidth: 2
                    )
            }
            
//
        }
    }
}

#Preview {
    @Previewable @State var email = ""

    AppTextField(
        label: "Email",
        hintText: "example.com",
        text: $email,
        obscureText: true,
        onChanged: { p in
            print(p)
        }
    )
}
