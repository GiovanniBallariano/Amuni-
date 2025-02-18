//
//  ContentView.swift
//  Amunì
//
//  Created by Giovanni Ballariano on 13/02/25.
//
import SwiftUI

struct ContentView: View {
    @State private var currentTab = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                // Tutorial flusso
                TabView(selection: $currentTab) {
                    // Tutorial 1
                    Tutorial1View()
                        .tag(0)
                    
                    // Tutorial 2
                    Tutorial2View()
                        .tag(1)
                    
                    // Tutorial 3
                    Tutorial3View()
                        .tag(2)
                    
                    // Accesso
                    NewUserView()
                        .tag(3)
                    
                    
                    /*ExploreView()
                        .tag(4)
                    
                    QrCodeView()
                        .tag(5)
                    
                    CitiesListView()
                        .tag(6)
                    
                    RankingBoard()
                        .tag(7)
                    
                    UserProfile()
                        .tag(8)
                    
                    MonumentContentView()
                        .tag(9)*/
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Usando PageTabViewStyle per uno scorrimento orizzontale
                .frame(height: 400) // Limita l'altezza del TabView
                
                // Pulsante per andare al tutorial successivo o alla schermata di login
                Button(action: {
                    if currentTab < 3 {
                        currentTab += 1
                    } else if currentTab == 3 {
                        // Naviga al tab delle nuove viste
                        currentTab = 4
                    }
                }) {
                    Text(currentTab < 3 ? "Avanti" : currentTab == 3 ? "Accedi" : "Esplora")
                        .font(.title2)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
            }
            .navigationTitle("Benvenuto alla guida")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 14")
            .previewLayout(.sizeThatFits)
    }
}
