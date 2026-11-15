
import SwiftUI
import UIKit

struct SignUpScreen: View {
    let showSignUp: () -> Void

    var body: some View {
        AppLayout(
            content: SignUpContent(showSignUp: showSignUp),
            header: SignUpHeader()
        )
        .navigationBarBackButtonHidden()
    }
}

// MARK: - SignUp Header

struct SignUpHeader: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .frame(maxHeight: 24)
                        .frame(width: 24)
                        .foregroundStyle(.red)
                }

                Spacer()

                Text("New Account")
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

// MARK: - SignUp Content

struct SignUpContent: View {
    let authController = AuthController()
    let showSignUp: () -> Void

    @State private var fullName = ""
    @State private var password = ""
    @State private var email = ""
    @State private var mobileNumber = ""
    @State private var dateOfBirth = ""

    /// Keyboard height
    @State private var keyboardHeight: CGFloat = 0

    // MARK: - Text Styles

    private let prompt = Text("Already have an account? ")
        .foregroundStyle(Color("black2"))

    private let signUp = Text("Log in")
        .foregroundStyle(Color("orangeBase"))
        .bold()

    private let text1 = Text("By continuing, you agree to")
        .foregroundStyle(Color("black2"))

    private let text2 = Text(" Terms of Use ")
        .foregroundStyle(Color("orangeBase"))
        .bold()

    private let text3 = Text("and ")
        .foregroundStyle(Color("black2"))

    private let text4 = Text("Privacy Policy")
        .foregroundStyle(Color("orangeBase"))
        .bold()

    // MARK: - Body

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Spacer()
                        .frame(height: 34)

                    // MARK: Full Name

                    AppTextField(
                        label: "Full Name",
                        hintText: "example.com",
                        text: $fullName,
                        onChanged: { value in
                            fullName = value
                        }
                    )
                    .id("fullName")

                    Spacer().frame(height: 22)

                    // MARK: Password

                    AppTextField(
                        label: "Password",
                        hintText: "Password",
                        text: $password,
                        onChanged: { value in
                            password = value
                        }
                    )
                    .id("password")

                    Spacer().frame(height: 22)

                    // MARK: Email

                    AppTextField(
                        label: "Email",
                        hintText: "example.com",
                        text: $email,
                        onChanged: { value in
                            email = value
                        }
                    )
                    .id("email")

                    Spacer().frame(height: 22)

                    // MARK: Mobile Number

                    AppTextField(
                        label: "Mobile Number",
                        hintText: "Mobile Number",
                        text: $mobileNumber,
                        onChanged: { value in
                            mobileNumber = value
                        }
                    )
                    .id("mobileNumber")

                    Spacer().frame(height: 22)

                    // MARK: Date Of Birth

                    AppTextField(
                        label: "Date of birth",
                        hintText: "Date of birth",
                        text: $dateOfBirth,
                        onChanged: { value in
                            dateOfBirth = value
                        }
                    )
                    .id("dateOfBirth")

                    Spacer().frame(height: 22)

                    // MARK: Sign Up Button

                    AppButton(
                        label: "Sign Up",
                        labelColor: .whiteBase,
                        backgroundColor: .orangeBase
                    ) {
                        authController.signUp(
                            email: email,
                            password: password,
                            fullName: fullName,
                            mobileNumber: mobileNumber,
                            dateOfBirth: dateOfBirth
                        )
                    }
                    .frame(
                        maxWidth: .infinity,
                        alignment: .center
                    )

                    Spacer().frame(height: 10)

                    // MARK: Login Button

                    Button {
                        showSignUp()
                    } label: {
                        Text("\(prompt)\(signUp)")
                            .font(.system(size: 14))
                            .frame(maxWidth: .infinity)
                    }

                    Spacer().frame(height: 16)

                    // MARK: Terms & Privacy Policy

                    Text("\(text1)\(text2)\(text3)\(text4)")
                        .font(.system(size: 14))
                        .multilineTextAlignment(.center)
                }
            }
            .padding(.bottom, keyboardHeight)
            .padding(.horizontal, 36)
            .scrollIndicators(.hidden)
            .scrollDismissesKeyboard(.interactively)

            // MARK: Keyboard Frame Detection

            .onReceive(
                NotificationCenter.default.publisher(
                    for: UIResponder.keyboardWillChangeFrameNotification
                )
            ) { notification in

                guard let keyboardFrame = notification.userInfo?[
                    UIResponder.keyboardFrameEndUserInfoKey
                ] as? CGRect else { return }

                keyboardHeight = keyboardFrame.height

                print("Keyboard Height: \(keyboardHeight)")
            }
            // MARK: Keyboard Hide Detection

            .onReceive(
                NotificationCenter.default.publisher(
                    for: UIResponder.keyboardWillHideNotification
                )
            ) { _ in
                keyboardHeight = 0

                print("Keyboard Closed")
            }

            // MARK: Keyboard Animation

            .animation(
                .easeOut(duration: 0.25),
                value: keyboardHeight
            )
        }
    }
}

// MARK: - Preview

#Preview {
    SignUpScreen(showSignUp: {})
}
