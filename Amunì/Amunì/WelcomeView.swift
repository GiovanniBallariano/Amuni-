//
//  WelcomeView.swift
//  Amunì
//
//  Created by Giovanni Ballariano on 13/02/25.
//
import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Colore di sfondo che copre tutta la vista
                Color(red: 69/255, green: 117/255, blue: 91/255)
                    .ignoresSafeArea()

                VStack {
                    // Spazio sopra la scritta "Welcome to"
                    Spacer().frame(height: 50)

                    // Titolo "Welcome to" non in grassetto
                    Text("Welcome to")
                        .font(.custom("SFPro", size: 32)) // Font SF Pro Thin, dimensione 32
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)

                    // Sottotitolo "Amunì" in grassetto, bianco e leggermente più grande
                    Text("Amunì")
                        .font(.custom("SFPro-BoldItalic", size: 36)) // Font SF Pro Bold Italic, dimensione 36
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)

                    // Ridurre lo Spacer per diminuire lo spazio tra "Amunì" e il testo sottostante
                    Spacer().frame(height: 120) // Ho ridotto lo Spacer qui per avvicinare il pulsante

                    // Testo "Definition" senza grassetto
                    Text("Definition")
                        .font(.custom("SFPro", size: 20)) // Font SF Pro Thin, dimensione 20
                        .foregroundColor(.white)
                        .padding(.bottom, 5)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    // Testo della definizione su più righe, allineato a sinistra
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            Text("Amunì") // Amunì in grassetto e italic
                                .font(.custom("SFPro-BoldItalic", size: 20)) // Font SF Pro Bold Italic
                                .foregroundColor(.white)
                            Text("- one of the most used")
                                .font(.custom("SFPro", size: 20))
                                .foregroundColor(.white)
                        }
                        Text("words in Sicily, it can be translated")
                            .font(.custom("SFPro", size: 20))
                            .foregroundColor(.white)
                        Text("as \"let's go\" or \"let's move\"")
                            .font(.custom("SFPro", size: 20))
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                    // Pulsante "Get Started!" con dimensioni e font specificati
                    NavigationLink(destination: Tutorial1View()) { // Aggiungi la navigazione corretta
                        Text("Get Started!")
                            .font(.custom("SFProRounded-Bold", size: 15)) // Font SF Pro Rounded, Bold, dimensione 15
                            .padding(.horizontal, 40)
                            .padding(.vertical, 12)
                            .foregroundColor(.white)
                            .background(Color(red: 38/255, green: 54/255, blue: 46/255))
                            .cornerRadius(25)
                            .frame(width: 180, height: 50) // Aumenta la larghezza e altezza del pulsante
                    }
                    .padding(.top, 120) // Ridotto il padding top per alzare il pulsante
                    .frame(maxWidth: .infinity, alignment: .center)

                    Spacer(minLength: 0)

                }
                .padding(.horizontal, 30)

                // Immagine posizionata in basso a destra con dimensioni 250x250
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Image("Plant")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250, height: 250)
                            .padding(.bottom, 0)
                            .padding(.trailing, 10)
                    }
                }
                .edgesIgnoringSafeArea(.bottom)

            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
            .previewDevice("iPhone 14")
            .previewLayout(.sizeThatFits)
    }
}
