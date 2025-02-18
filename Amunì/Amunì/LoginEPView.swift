//
//  SignupView.swift
//  Amunì
//
//  Created by Giovanni Ballariano on 18/02/25.
//


import SwiftUI

struct LoginEPView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var email = ""
    @State private var password = ""
    @State private var nickname: String? = nil
    @State private var errorMessage: String? = nil  // Stato per il messaggio di errore
    
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
                        Image(systemName: "arrow.left")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                    }
                    .padding(.leading, 30)
                    Spacer()
                }
                .padding(.top, 20)
                
                // Titolo centrato
                Text("Login")
                    .font(.custom("SFPro-Bold", size: 32))
                    .fontWeight(.heavy)
                    .kerning(0.4)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                    .padding(.top, 20)
                    .padding(.bottom, 40)
                
                VStack(spacing: 25) {
                    VStack(alignment: .leading) {
                        Text("E-mail")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        TextField("Enter your email", text: $email, onEditingChanged: { _ in
                            checkPreviousLogin()
                        })
                        .padding()
                        .frame(width: 280, height: 50)
                        .background(Color(red: 50/255, green: 70/255, blue: 60/255))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Password")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        SecureField("Enter your password", text: $password)
                            .padding()
                            .frame(width: 280, height: 50)
                            .background(Color(red: 50/255, green: 70/255, blue: 60/255))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }
                    
                    // Messaggio di errore (se presente)
                    if let errorMessage = errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .font(.subheadline)
                            .padding(.top, 5)
                    }
                    
                    Button(action: {
                        performLogin()
                    }) {
                        Text("Login")
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                            .padding(15)
                            .frame(width: 150)
                            .background(Color(red: 38/255, green: 54/255, blue: 46/255))
                            .cornerRadius(25)
                    }
                    .padding(.top, 30)
                    
                    Spacer()
                }
                .padding(.horizontal, 30)
                
                Spacer()
            }
            .padding(.top, 20)
            
            Image("Plant")
                .resizable()
                .scaledToFit()
                .frame(width: 212, height: 285)
                .position(x: UIScreen.main.bounds.width - 120, y: UIScreen.main.bounds.height - 190)
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            checkPreviousLogin()
        }
    }
    
    func checkPreviousLogin() {
        if let savedNickname = UserDefaults.standard.string(forKey: email) {
            nickname = savedNickname
        }
    }
    
    func performLogin() {
        // Verifica se i campi sono vuoti
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Enter email and password."
            return
        }
        
        if let savedNickname = nickname {
            print("✅ Welcome back, \(savedNickname)!")
            errorMessage = nil
        } else {
            let person = Person(id: UUID().uuidString, firstname: email, email: email, password: password)
            
            PeopleService.shared.setPerson(person: person) { success in
                if success {
                    print("✅ Account created successfully!")
                    UserDefaults.standard.set(email, forKey: email)
                    errorMessage = nil
                } else {
                    errorMessage = "❌ Error creating account"
                }
            }
        }
    }
}
