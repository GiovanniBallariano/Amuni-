//
//  NewUserView.swift
//  Amunì
//
//  Created by Giovanni Ballariano on 18/02/25.
//


import SwiftUI

struct NewUserView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        ZStack {
            Color(red: 69/255, green: 117/255, blue: 91/255)
                .ignoresSafeArea()
            
            VStack {
                // Aggiungi il pulsante per tornare indietro con l'icona di ParthenoKit
                HStack {
                    Button(action: {
                        // Aggiungi qui la logica per tornare indietro
                    }) {
                        Image(systemName: "arrow.left.circle.fill") // Icona di sistema
                            .resizable()
                            .frame(width: 40, height: 40) // Imposta la dimensione dell'icona
                            .foregroundColor(.white) // Imposta il colore dell'icona su bianco
                    }
                    .padding(.leading, 30)
                    .padding(.top, 20) // Posiziona la freccia in alto
                    Spacer()
                }
                .padding(.top, 20)
                
                // Titolo "Create New Account"
                Text("Create New Account")
                    .font(.custom("SFPro-Bold", size: 32))
                    .fontWeight(.heavy) // Aumentato il peso del testo per renderlo più spessa
                    .kerning(0.4)
                    .foregroundColor(.white)
                    .padding(.bottom, 30)
                
                // Spazio per i campi di testo
                VStack(spacing: 20) {
                    // E-mail
                    VStack(alignment: .leading) {
                        Text("E-mail")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        TextField("Enter your email", text: $email)
                            .padding()
                            .frame(width: 280, height: 45) // Aumentata la larghezza e ridotto l'altezza
                            .background(Color(red: 50/255, green: 70/255, blue: 60/255))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }
                    
                    // Password
                    VStack(alignment: .leading) {
                        Text("Password")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        SecureField("Enter your password", text: $password)
                            .padding()
                            .frame(width: 280, height: 45) // Aumentata la larghezza e ridotto l'altezza
                            .background(Color(red: 50/255, green: 70/255, blue: 60/255))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }
                    
                    // Confirm Password
                    VStack(alignment: .leading) {
                        Text("Confirm Password")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        SecureField("Confirm your password", text: $confirmPassword)
                            .padding()
                            .frame(width: 280, height: 45) // Aumentata la larghezza e ridotto l'altezza
                            .background(Color(red: 50/255, green: 70/255, blue: 60/255))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }
                    
                    // Bottone per la creazione dell'account
                    Button(action: {
                        createAccount(email: email, password: password, confirmPassword: confirmPassword)
                    }) {
                        Text("Create Account")
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                            .padding(15)
                            .frame(width: 150)
                            .background(Color(red: 38/255, green: 54/255, blue: 46/255))
                            .cornerRadius(25)
                    }
                    .padding(.top, 20) // Abbassato il padding rispetto a prima
                    
                    Spacer()
                }
                .padding(.horizontal, 30)
                
                Spacer()
            }
            .padding(.top, 40)
            
            Image("Plant")
                .resizable()
                .scaledToFit()
                .frame(width: 212, height: 285)
                .position(x: UIScreen.main.bounds.width - 120, y: UIScreen.main.bounds.height - 190)
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func createAccount(email: String, password: String, confirmPassword: String) {
        // Aggiungi qui la logica per la creazione dell'account
        if password == confirmPassword {
            let person = Person(id: UUID().uuidString, firstname: email, email: email, password: password)
            
            PeopleService.shared.setPerson(person: person) { success in
                if success {
                    print("✅ Account created successfully!")
                } else {
                    print("❌ Error creating account")
                }
            }
        } else {
            print("❌ The passwords do not match")
        }
    }
}

struct NewUserView_Previews: PreviewProvider {
    static var previews: some View {
        NewUserView()
    }
}
