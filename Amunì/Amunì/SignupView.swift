//
//  LoginSignupView.swift
//  Amunì
//
//  Created by Giovanni Ballariano on 18/02/25.
//
import SwiftUI

struct SignupView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var errorMessage: String? = nil // Stato per il messaggio di errore
    
    var body: some View {
        ZStack {
            Color(red: 69/255, green: 117/255, blue: 91/255)
                .ignoresSafeArea()
            
            VStack {
                // Pulsante per tornare indietro
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "arrow.left.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                    }
                    .padding(.leading, 30)
                    .padding(.top, 20)
                    Spacer()
                }
                
                // Titolo "Sign Up"
                Text("Sign Up")
                    .font(.custom("SFPro-Bold", size: 32))
                    .fontWeight(.heavy)
                    .kerning(0.4)
                    .foregroundColor(.white)
                    .padding(.bottom, 10)
                
                // Campi di testo per email, password e conferma password
                VStack(spacing: 15) {
                    VStack(alignment: .leading) {
                        Text("E-mail")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        TextField("Enter your email", text: $email)
                            .padding()
                            .frame(width: 280, height: 45)
                            .background(Color(red: 50/255, green: 70/255, blue: 60/255))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Password")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        SecureField("Enter your password", text: $password)
                            .padding()
                            .frame(width: 280, height: 45)
                            .background(Color(red: 50/255, green: 70/255, blue: 60/255))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .autocapitalization(.none)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Confirm Password")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        SecureField("Confirm your password", text: $confirmPassword)
                            .padding()
                            .frame(width: 280, height: 45)
                            .background(Color(red: 50/255, green: 70/255, blue: 60/255))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .autocapitalization(.none)
                    }
                    
                    // Messaggio di errore (se presente)
                    if let errorMessage = errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .font(.subheadline)
                            .padding(.top, 5)
                    }
                    
                    Button(action: {
                        checkEmailExists { exists in
                            if exists {
                                if password == confirmPassword {
                                    signupWithEmailAndPassword(email: email, password: password)
                                } else {
                                    errorMessage = "❌ Passwords do not match!"
                                }
                            } else {
                                errorMessage = "❌ Enter an existing email"
                            }
                        }
                    }) {
                        Text("Signup")
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                            .padding(15)
                            .frame(width: 150)
                            .background(Color(red: 38/255, green: 54/255, blue: 46/255))
                            .cornerRadius(25)
                    }
                    .padding(.top, 15)
                    
                    Text("OR")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.top, 10)
                    
                    NavigationLink(destination: LoginEPView()) {
                        Text("Login")
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                            .padding(15)
                            .frame(width: 150)
                            .background(Color(red: 38/255, green: 54/255, blue: 46/255))
                            .cornerRadius(25)
                    }
                    .padding(.top, 15)
                    
                    Spacer()
                }
                .padding(.horizontal, 30)
                .padding(.top, 15)
                
            }
            
            Image("Plant")
                .resizable()
                .scaledToFit()
                .frame(width: 212, height: 285)
                .position(x: UIScreen.main.bounds.width - 120, y: UIScreen.main.bounds.height - 190)
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func checkEmailExists(completion: @escaping (Bool) -> Void) {
        // Qui devi implementare la logica per verificare se l'email esiste nel database
        PeopleService.shared.checkIfEmailExists(email: email) { exists in
            DispatchQueue.main.async {
                completion(exists)
            }
        }
    }
    
    func signupWithEmailAndPassword(email: String, password: String) {
        let person = Person(id: UUID().uuidString, firstname: "", email: email, password: password)
        
        PeopleService.shared.setPerson(person: person) { success in
            if success {
                print("✅ Signup with email and password successful!")
                errorMessage = nil
            } else {
                errorMessage = "❌ Error signing up with email and password, please try again later."
            }
        }
    }
}
