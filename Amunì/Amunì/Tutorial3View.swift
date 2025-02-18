//
//  Tutorial3View.swift
//  Amunì
//
//  Created by Giovanni Ballariano on 13/02/25.
//
import SwiftUI

struct Tutorial3View: View {
    // Aggiungi questa riga per ottenere accesso al presentationMode
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            // Colore di sfondo che copre tutta la vista
            Color(red: 69/255, green: 117/255, blue: 91/255)
                .ignoresSafeArea()

            VStack {
                // Spaziatura sopra il testo
                Spacer().frame(height: 10)
                
                // Testo principale con grassetto su parole specifiche
                VStack {
                    Text("Have ")
                        .font(.system(size: 30, weight: .thin, design: .default)) // Ridotto la dimensione del font
                        .foregroundColor(.white) +
                    Text("fun ")
                        .font(.system(size: 30, weight: .bold, design: .default)) // Ridotto la dimensione del font
                        .foregroundColor(.white) +
                    Text("and climb ")
                        .font(.system(size: 30, weight: .thin, design: .default)) // Ridotto la dimensione del font
                        .foregroundColor(.white) +
                    Text("the\n")
                        .font(.system(size: 30, weight: .thin, design: .default)) // Ridotto la dimensione del font
                        .foregroundColor(.white) +
                    Text("leaderboard")
                        .font(.system(size: 30, weight: .bold, design: .default)) // Ridotto la dimensione del font
                        .foregroundColor(.white)
                }
                .multilineTextAlignment(.center)
                .lineLimit(2) // Limita il testo a due righe
                .padding(.top, 20)
                .frame(maxWidth: .infinity) // Si espande per adattarsi alla larghezza disponibile
                .padding(.horizontal, 20) // Ridotto il padding orizzontale per adattare il testo

                // Forma quadrata con simbolo trofeo
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color(red: 38/255, green: 54/255, blue: 46/255))
                    .frame(width: 300, height: 300)
                    .overlay(
                        Image(systemName: "trophy.fill")
                            .font(.system(size: 250))
                            .foregroundColor(Color(red: 69/255, green: 117/255, blue: 91/255))
                    )
                    .padding(.top, 30)

                // Pulsanti "Back" e "Next"
                HStack(spacing: 20) { // Aggiungi spacing personalizzato
                    // Pulsante "Back"
                    Button(action: {
                        // Azione per il pulsante "Back"
                        presentationMode.wrappedValue.dismiss() // Torna alla vista precedente
                    }) {
                        Text("Back")
                            .font(.title2)
                            .padding(.horizontal, 40)
                            .padding(.vertical, 12)
                            .foregroundColor(.white)
                            .background(Color(red: 38/255, green: 54/255, blue: 46/255))
                            .cornerRadius(25)
                    }
                    
                    // Pulsante "Next"
                    NavigationLink(destination: LoginView()) { // Cambiato a LoginView
                        Text("Next")
                            .font(.title2)
                            .padding(.horizontal, 40)
                            .padding(.vertical, 12)
                            .foregroundColor(.white)
                            .background(Color(red: 38/255, green: 54/255, blue: 46/255))
                            .cornerRadius(25)
                    }
                }
                .padding(.top, 20)
                .padding(.horizontal, 30) // Allineato orizzontalmente i pulsanti

                Spacer()
            }

            // Immagine decorativa
            Image("Plant")
                .resizable()
                .scaledToFit()
                .frame(width: 212, height: 285)
                .position(x: UIScreen.main.bounds.width - 120, y: UIScreen.main.bounds.height - 190)
                .zIndex(0) // Immagine sotto i puntini

            // Indicatori di navigazione (tre puntini), posizionati sotto l'immagine
            VStack {
                Spacer()
                HStack(spacing: 8) {
                    Circle()
                        .stroke(Color.white, lineWidth: 2) // Primo vuoto
                        .frame(width: 10, height: 10)
                    Circle()
                        .stroke(Color.white, lineWidth: 2) // Secondo vuoto
                        .frame(width: 10, height: 10)
                    Circle()
                        .fill(Color.white) // Terzo pieno (pagina attuale)
                        .frame(width: 10, height: 10)
                }
                .padding(.bottom, 20) // Distanza dal bordo inferiore
                .zIndex(1) // Puntini sopra l'immagine
            }
        }
        .navigationBarBackButtonHidden(true) // Rimuove il pulsante di back automatico
    }
}

struct Tutorial3View_Previews: PreviewProvider {
    static var previews: some View {
        Tutorial3View()
    }
}

