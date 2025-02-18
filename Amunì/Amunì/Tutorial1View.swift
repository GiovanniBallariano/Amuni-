//
//  Tutorial1View.swift
//  Amunì
//
//  Created by Giovanni Ballariano on 13/02/25.
//
import SwiftUI

struct Tutorial1View: View {
    // Aggiungi questa riga per ottenere accesso al presentationMode
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            // Colore di sfondo che copre tutta la vista
            Color(red: 69/255, green: 117/255, blue: 91/255)
                .ignoresSafeArea()

            VStack {
                // Spaziatura sopra il testo
                Spacer().frame(height: 20)
                
                // Testo principale con grassetto su parole specifiche
                VStack {
                    Text("Enjoy ")
                        .font(.system(size: 34, weight: .thin, design: .default))
                        .foregroundColor(.white) +
                    Text("Sicily")
                        .font(.system(size: 34, weight: .bold, design: .default))
                        .foregroundColor(.white) +
                    Text(" by playing,")
                        .font(.system(size: 34, weight: .thin, design: .default))
                        .foregroundColor(.white)

                    ExtractedView()
                }
                .frame(width: 400, height: 66)
                .multilineTextAlignment(.center)
                .padding(.top, 20)
                
                // Forma quadrata con simbolo di mappa
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color(red: 38/255, green: 54/255, blue: 46/255))
                    .frame(width: 300, height: 300)
                    .overlay(
                        Image(systemName: "map.fill")
                            .font(.system(size: 250))
                            .foregroundColor(Color(red: 69/255, green: 117/255, blue: 91/255))
                    )
                    .padding(.top, 30)

                // HStack per allineare i pulsanti a sinistra e a destra
                HStack(spacing: 20) { // Modifica spacing per avvicinare i pulsanti
                    // Pulsante "Back" a sinistra
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
                    
                    // Pulsante "Next" a destra
                    NavigationLink(destination: Tutorial2View()) {
                        Text("Next")
                            .font(.title2)
                            .padding(.horizontal, 40)
                            .padding(.vertical, 12)
                            .foregroundColor(.white)
                            .background(Color(red: 38/255, green: 54/255, blue: 46/255))
                            .cornerRadius(25)
                    }
                }
                .padding(.top, 20) // Spazio sopra i pulsanti
                
                Spacer()
            }
            .padding(.horizontal, 30)

            // Immagine decorativa, posizionata sopra il bordo inferiore
            Image("Plant")
                .resizable()
                .scaledToFit()
                .frame(width: 212, height: 285)
                .position(x: UIScreen.main.bounds.width - 100, y: UIScreen.main.bounds.height - 190) // Posizionata sopra il bordo inferiore

            // Indicatori di navigazione (tre puntini), posizionati sopra l'immagine
            VStack {
                Spacer()
                HStack(spacing: 8) {
                    Circle()
                        .fill(Color.white) // Primo pieno (pagina attuale)
                        .frame(width: 10, height: 10)
                    Circle()
                        .stroke(Color.white, lineWidth: 2) // Secondo vuoto
                        .frame(width: 10, height: 10)
                    Circle()
                        .stroke(Color.white, lineWidth: 2) // Terzo vuoto
                        .frame(width: 10, height: 10)
                }
                .padding(.bottom, 20) // Distanza dal bordo inferiore
            }
            .zIndex(1) // Puntini sopra l'immagine
        }
        .navigationBarBackButtonHidden(true) // Rimuove il pulsante di back automatico
    }
}

struct Tutorial1View_Previews: PreviewProvider {
    static var previews: some View {
        Tutorial1View()
    }
}

struct ExtractedView: View {
    var body: some View {
        Text("discover ")
            .font(.system(size: 34, weight: .bold, design: .default))
            .foregroundColor(.white) +
        Text("new ")
            .font(.system(size: 34, weight: .thin, design: .default))
            .foregroundColor(.white) +
        Text("places")
            .font(.system(size: 34, weight: .bold, design: .default))
            .foregroundColor(.white)
    }
}
