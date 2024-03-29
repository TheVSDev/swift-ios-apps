import SwiftUI

struct ContentView: View {
    
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
        NavigationView {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(listFruits) { fruit in
                        FruitsDisplay(fruit: fruit)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
