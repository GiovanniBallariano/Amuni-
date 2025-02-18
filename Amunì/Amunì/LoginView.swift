//
//  LoginView.swift
//  Amunì
//
//  Created by Giovanni Ballariano on 13/02/25.
//
import SwiftUI
import ParthenoKit

// Definizione della struttura Person
struct Person {
    var id: String
    var firstname: String
    var email: String?
    var password: String?
}

// Definizione della classe PeopleService
class PeopleService {
    static let shared = PeopleService()
    
    private var registeredEmails: [String] = ["test@example.com", "user@example.com"] // Simulazione database
    
    func setPerson(person: Person, completion: @escaping (Bool) -> Void) {
        print("Salvataggio di: \(person.firstname), email: \(person.email ?? "N/A")")
        completion(true) // Simulazione di successo
    }
    
    func checkIfEmailExists(email: String, completion: @escaping (Bool) -> Void) {
        let emailExists = registeredEmails.contains(email)
        completion(emailExists)
    }
}

struct LoginView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var nickname = ""
    @State private var isNavigatingToSignup = false
    @State private var isNavigatingToLoginSignup = false
    @State private var selectedImage: UIImage? = nil  // Per l'immagine del profilo
    
    var body: some View {
        ZStack {
            Color(red: 69/255, green: 117/255, blue: 91/255)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Text("Setup your profile")
                        .font(.custom("SFPro-Bold", size: 32))
                        .fontWeight(.heavy)
                        .kerning(0.4)
                        .foregroundColor(.white)
                        .padding(.bottom, 50)
                    Spacer()
                }
                .padding(.leading, 30)
                
                // Cerchio cliccabile per l'immagine del profilo
                Button(action: {
                    // Aggiungi qui il codice per scegliere un'immagine
                }) {
                    ZStack {
                        Circle()
                            .strokeBorder(Color.white, lineWidth: 4)
                            .background(Circle().fill(Color(red: 163/255, green: 111/255, blue: 46/255)))
                            .frame(width: 150, height: 150)
                        
                        Image(systemName: "person.fill")
                            .font(.system(size: 100))
                            .foregroundColor(.white)
                            .overlay(
                                Group {
                                    if let selectedImage = selectedImage {
                                        Image(uiImage: selectedImage)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 150, height: 150)
                                            .clipShape(Circle())
                                    }
                                }
                            )
                    }
                }
                .padding(.bottom, 10)
                
                VStack(spacing: 5) {
                    TextField("Nickname", text: $nickname)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(Color(red: 50/255, green: 70/255, blue: 60/255))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                    
                    Button(action: {
                        saveProfile(nickname: nickname)
                    }) {
                        Text("Amunì")
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                            .padding(15)
                            .frame(width: 150)
                            .background(Color(red: 38/255, green: 54/255, blue: 46/255))
                            .cornerRadius(25)
                    }
                    .padding(.top, 50)
                    
                    // Modifica della destinazione del NavigationLink
                    Button(action: {
                        isNavigatingToLoginSignup = true
                    }) {
                        Text("Go to Login")
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color(red: 38/255, green: 54/255, blue: 46/255))
                            .cornerRadius(20)
                    }
                    .padding(.top, 20)
                    .background(
                        NavigationLink("", destination: LoginEPView(), isActive: $isNavigatingToLoginSignup)
                            .opacity(0)
                    )
                    
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
    
    func saveProfile(nickname: String) {
        let person = Person(id: UUID().uuidString, firstname: nickname, email: nil as String?, password: nil as String?)
        
        PeopleService.shared.setPerson(person: person) { success in
            if success {
                print("✅ Nickname and image saved successfully!")
            } else {
                print("❌ Error saving profile")
            }
        }
    }
}
