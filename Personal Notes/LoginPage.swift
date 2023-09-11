//
//  LoginPage.swift
//  Personal Notes
//
//  Created by SARVADHI on 24/06/23.
//

import SwiftUI
import FirebaseAuth

struct LoginPage: View {
    init() {
        setUpNavigationBarAppearance(titleColor: .white, barColor: .systemPurple)
    }
    
    @State private var email = ""
    @State private var isSecure = true
    @State private var password = ""
    @State private var showSignUpScreen = false
    @State private var isLoading = false
    @State private var showHomeScreen = false
    
    var body: some View {
        NavigationView() {
            VStack(spacing: 25) {
                InfoText(title: "Sign In").padding([.top, .bottom], 40)
                CustomTextField(email: $email, type: .emailAddress, capitalization: .none, placeHolder: "Enter Email", imageName: "envelope.fill")
                SecureTextField(password: $password)

                CustomButton(title: "Sign In") {
                    loginUser()
                    print("LogIn")
                }
                
                NavigationLink(
                    destination: HomeScreen(),
                    isActive: $showHomeScreen,
                    label: { EmptyView() }
                )
                
                VStack {
                    Button {
                        showSignUpScreen = true
                    } label: {
                        Text("Don't have an account?")
                            .foregroundColor(.black)
                            .frame(width: 215, height: 50, alignment: .center)
                            .font(.system(size: 18, weight: .medium))
                    }

                }
                NavigationLink(
                    destination: SignUpPage(),
                    isActive: $showSignUpScreen,
                    label: { EmptyView() }
                )

                VStack {
                    HStack(alignment: .center, spacing: 10) {
                        Text("")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .medium))
                            .frame(width: 100, height: 1)
                            .background(Color.gray)
                        
                        Text("OR")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .medium))
                        Text("")
                            .foregroundColor(.black)
                            .font(.system(size: 15))
                            .frame(width: 100, height: 1)
                            .background(Color.gray)
                    }
                }
                
                VStack {
                    HStack(alignment: .center, spacing: 20) {
                        Button {
                            print("LogIn")
                        } label: {
                            Image("facebook")
                                .resizable(capInsets: EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
                                .frame(width: 60, height: 60, alignment: .center)
                                .background(Color.white)
                            
                        }
                        .cornerRadius(30)
                        
                        Button {
                            print("LogIn")
                        } label: {
                            Image("google")
                                .resizable()
                                .frame(width: 30, height: 30)
                                
                        }
                        .frame(width: 60, height: 60, alignment: .center)
                        .background(Color.white)
                        
                        .cornerRadius(30)
                        
                        Button {
                            print("LogIn")
                        } label: {
                            Image(systemName: "phone.fill")
                                .resizable()
                                .frame(width: 25, height: 25, alignment: .center)
                                .background(Color.white)
                        }
                        .frame(width: 60, height: 60, alignment: .center)
                        .background(Color.white)
                        .cornerRadius(30)
                    }
                }
                Spacer()
            }
            .padding()
            .background(Color.secondary.opacity(0.1).ignoresSafeArea())
            if isLoading {
                VStack(alignment: .center) {
                    ProgressView()
                }
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture { }
            }
        }
        
    }
    
    func loginUser() {
        isLoading = true
        Auth.auth().signIn(withEmail: self.email, password: self.password) { result, error in
            isLoading = false
            if let error = error {
                print("Error creating user: \(error.localizedDescription)")
            } else {
                showHomeScreen = true
                UserDefaults.standard.set(result?.user.uid ?? "", forKey: "user_id")
                print("User created successfully!")
                // Optionally, perform any additional actions after successful user creation
            }
        }
    }
    
}

struct InfoText: View {
    var title = ""
    var body: some View {
        Text(title)
            .font(.system(size: 25, weight: .bold))
            .foregroundColor(.accentColor)
    }
}

extension View {
    func setUpNavigationBarAppearance(titleColor: UIColor, barColor: UIColor) {
       let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.titleTextAttributes = [.foregroundColor: titleColor]
        appearance.backgroundColor = barColor
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
