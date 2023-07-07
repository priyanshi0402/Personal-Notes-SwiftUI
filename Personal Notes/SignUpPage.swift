//
//  SignUpPage.swift
//  Personal Notes
//
//  Created by SARVADHI on 24/06/23.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct SignUpPage: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var name = ""
    @State private var isSecure = true
    @State private var showingOptions = false
    @State private var image: UIImage?
    @State private var isLoading = false
    @State private var showImagePicker = false
    @State private var showHomeScreen = false
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView() {
            ZStack {
                VStack(spacing: 25) {
                    InfoText(title: "Sign Up").padding([.top], 40)
                    Button {
                        self.showingOptions = true
                    } label: {
                        if let image = image {
                            Image(uiImage: image)
                                .resizable()
                                .frame(width: 100, height: 100, alignment: .center)
                                .aspectRatio(contentMode: .fill)
                                .background(Color.white)
                        } else {
                            Image(systemName: "photo.fill")
                                .resizable()
                                .frame(width: 25, height: 20, alignment: .center)
                                .background(Color.white)
                        }
                        
                    }
                    .actionSheet(isPresented: $showingOptions, content: {
                        ActionSheet(
                            title: Text("Options"),
                            message: Text("Choose an option"),
                            buttons: [
                                .default(Text("Camera"), action: {
                                    // Handle Option 1 selection
                                    print("Option 1 selected")
                                }),
                                .default(Text("Photos"), action: {
                                    self.showImagePicker = true
                                    // Handle Option 2 selection
                                    print("Option 2 selected")
                                }),
                                .cancel()
                            ]
                        )
                    })
                    
                    .sheet(isPresented: $showImagePicker) {
                        ImagePicker(selectedImage: $image)
                    }
                    .frame(width: 100, height: 100, alignment: .center)
                    .background(Color.white)
                    .clipShape(Circle())
                    
                    VStack() {
                        ZStack(alignment: .trailing) {
                            TextField("Enter Name", text: $name)
                                .font(.system(size: 17))
                                .foregroundColor(.primary)
                                .frame(height: 50)
                                .padding(.horizontal, 12)
                                .background(Color.white)
                                .cornerRadius(10.0)
                            
                            Image(systemName: "person.fill")
                                .foregroundColor(.gray)
                                .padding()
                        }
                        
                    }
                    
                    VStack() {
                        ZStack(alignment: .trailing) {
                            TextField("Enter Email", text: $email)
                                .font(.system(size: 17))
                                .foregroundColor(.primary)
                                .frame(height: 50)
                                .padding(.horizontal, 12)
                                .background(Color.white)
                                .cornerRadius(10.0)
                                .keyboardType(.emailAddress)
                            Image(systemName: "envelope.fill")
                                .foregroundColor(.gray)
                                .padding()
                        }
                        
                    }
                    
                    VStack() {
                        ZStack(alignment: .trailing) {
                            SecureTextField(password: $password, isSecure: isSecure)
                            Button {
                                isSecure.toggle()
                            } label: {
                                Image(systemName: isSecure ? "eye.slash" : "eye")
                                    .accentColor(.gray)
                            }
                            .padding()
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Button {
                            self.isLoading = true
                            self.registerUser()
                            print("LogIn")
                        } label: {
                            Text("Sign Up")
                                .foregroundColor(.white)
                                .frame(width: 215, height: 50, alignment: .center)
                                .font(.system(size: 18, weight: .medium))
                        }
                        .disabled(isLoading)
                        .background(Color.blue)
                        .cornerRadius(10)
                        
                    }
                    NavigationLink(
                        destination: HomeScreen(),
                        isActive: $showHomeScreen,
                        label: { EmptyView() }
                    )
                    
                    VStack {
                        Button {
                            print("LogIn")
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Already have an account? Sign In")
                                .foregroundColor(.black)
                                .frame(alignment: .center)
                                .font(.system(size: 18, weight: .medium))
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
        .navigationBarHidden(true)
        
    }
    
    func registerUser() {
        Auth.auth().createUser(withEmail: self.email, password: self.password) { result, error in
            if let error = error {
                isLoading = false
                print("Error creating user: \(error.localizedDescription)")
            } else {
                print("User created successfully!")
                let user = Users(userId: result?.user.uid ?? "", name: self.name, email: self.email, profileImage: "").toDictionary()
                Firestore.firestore().collection("Users").document(result?.user.uid ?? "").setData(user) { error in
                    isLoading = false
                    if let error = error {
                        print("Error writing document: \(error)")
                    } else {
                        UserDefaults.standard.set(result?.user.uid ?? "", forKey: "user_id")
                        showHomeScreen = true
                        print("Document successfully written!")
                    }
                }
                // Optionally, perform any additional actions after successful user creation
            }
        }
    }
}


struct ImagePicker: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) private var presentationMode
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Binding var selectedImage: UIImage?
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
        
}

struct SignUpPage_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPage()
    }
}
