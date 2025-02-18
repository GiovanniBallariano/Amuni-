//
//  Tutorial2View.swift
//  Amunì
//
//  Created by Giovanni Ballariano on 13/02/25.
//
import SwiftUI

struct Tutorial2View: View {
    // Aggiungi questa riga per ottenere accesso al presentationMode
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            // Colore di sfondo che copre tutta la vista
            Color(red: 69/255, green: 117/255, blue: 91/255)
                .ignoresSafeArea()

            VStack {
                // Spaziatura sopra il testo
                Spacer().frame(height: 0)
                
                // Testo principale con grassetto su parole specifiche
                VStack {
                    Text("Scan ")
                        .font(.system(size: 34, weight: .bold, design: .default))
                        .foregroundColor(.white) +
                    Text("QR codes ")
                        .font(.system(size: 34, weight: .thin, design: .default))
                        .foregroundColor(.white) +
                    Text("to\n") // Aggiunto salto di linea dopo "to"
                        .font(.system(size: 34, weight: .thin, design: .default))
                        .foregroundColor(.white) +
                    Text("earn ")
                        .font(.system(size: 34, weight: .bold, design: .default))
                        .foregroundColor(.white) +
                    Text("points")
                        .font(.system(size: 34, weight: .thin, design: .default))
                        .foregroundColor(.white)
                }
                .multilineTextAlignment(.center)
                .lineLimit(nil) // Permette di andare a capo senza limiti
                .padding(.top, 20)
                .frame(maxWidth: .infinity) // Si espande per adattarsi alla larghezza disponibile
                .padding(.horizontal, 30)
                
                // Forma quadrata con simbolo QR code
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color(red: 38/255, green: 54/255, blue: 46/255))
                    .frame(width: 300, height: 300)
                    .overlay(
                        Image(systemName: "qrcode.viewfinder")
                            .font(.system(size: 250))
                            .foregroundColor(Color(red: 69/255, green: 117/255, blue: 91/255))
                    )
                    .padding(.top, 20)

                // Pulsanti "Back" e "Next"
                HStack {
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
                    
                    Spacer() // Spazio tra i due pulsanti
                    
                    // Pulsante "Next"
                    NavigationLink(destination: Tutorial3View()) { // Cambiato a Tutorial3View
                        Text("Next")
                            .font(.title2)
                            .padding(.horizontal, 40)
                            .padding(.vertical, 12)
                            .foregroundColor(.white)
                            .background(Color(red: 38/255, green: 54/255, blue: 46/255))
                            .cornerRadius(25)
                    }
                }
                .padding(.top, 10) // Ridotto lo spazio sopra i pulsanti
                .padding(.horizontal, 30) // Allineato orizzontalmente i pulsanti

                // Indicatori di navigazione (tre puntini) con il secondo pieno
                .padding(.top, 15) // Spazio sotto i pulsanti
                
                Spacer()
            }
            .padding(.horizontal, 30)

            // Immagine decorativa, posizionata sopra il bordo inferiore
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
                        .fill(Color.white) // Secondo pieno (pagina attuale)
                        .frame(width: 10, height: 10)
                    Circle()
                        .stroke(Color.white, lineWidth: 2) // Terzo vuoto
                        .frame(width: 10, height: 10)
                }
                .padding(.bottom, 20) // Distanza dal bordo inferiore
                .zIndex(1) // Puntini sopra l'immagine
            }
        }
        .navigationBarBackButtonHidden(true) // Rimuove il pulsante di back automatico
    }
}

struct Tutorial2View_Previews: PreviewProvider {
    static var previews: some View {
        Tutorial2View()
    }
}
