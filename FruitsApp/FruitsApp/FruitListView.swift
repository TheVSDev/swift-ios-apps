import SwiftUI

struct FruitListView: View {
    
    var listFruits:[Fruits]!
    
    // Fetch Fruits from Fruits.plist
    init(){
        let url = Bundle.main.url(forResource: "Fruits", withExtension: "plist")
        let data = try! Data(contentsOf: url!)
        
        let decoder = PropertyListDecoder()
        
        do {
            self.listFruits = try decoder.decode([Fruits].self, from: data)
        } catch let error {
            print(error)
        }
        
    }
    
    var body: some View {
        Text("Fruits")
            .font(.largeTitle)
            .fontWeight(.bold)
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(listFruits, id: \.self) { fruit in
                            NavigationLink(destination: FruitDetailView(fruit: fruit)) {
                                FruitCard(fruit: fruit)
                            }
                        }
                    }
                .padding()
            }
    }

#Preview {
    FruitListView()
}
