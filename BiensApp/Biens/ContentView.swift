import SwiftUI

struct ContentView: View {
    
    var listBiens:[Biens]!
    
    init(){
        let url = Bundle.main.url(forResource: "data", withExtension: "plist")
        let data = try! Data(contentsOf: url!)
        
        let decoder = PropertyListDecoder()
        
        do {
            self.listBiens = try decoder.decode([Biens].self, from: data)
        } catch let error {
            print(error)
        }
        
        
    }
    
    var body: some View {
        NavigationView {
                    List {
                        ForEach(listBiens, id: \.self) { bien in
                            NavigationLink(destination: BienDetailView(bien: bien)) {
                                CardInfo(bien: bien)
                            }
                        }
                    }
                }
                .padding()
            }
    }

#Preview {
    ContentView()
}
