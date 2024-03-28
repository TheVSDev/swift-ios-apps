import SwiftUI

struct BienDetailView: View {
    var bien: Biens
    
    var body: some View {
        VStack {
            Image(bien.image)
                .resizable()
                .frame(width: 350, height: 350)
            Text(bien.title)
                .font(.title)
                .padding(.bottom, 25.0)
            Text(bien.description)
                .font(.title2)
                .padding(.bottom, 25.0)
            Text("Price: \(bien.price) €")
                .font(.title3)
                .padding(.top, 10.0)
        }
        .padding()
        .navigationBarTitle(bien.title)
    }
}

#Preview {
    BienDetailView(bien: Biens(id: 1, title: "Villa 1", image: "villa1", price: 30000, description: "Lorem ipsum dolor si amet"))
}
