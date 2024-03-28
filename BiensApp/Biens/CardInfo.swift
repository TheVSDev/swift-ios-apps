import SwiftUI

struct CardInfo: View {
    var bien: Biens
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(self.bien.title)
                    .font(.title2)
                Text(String(self.bien.price) + " €")
            }
            Spacer()
            Image(self.bien.image)
                .resizable()
                .frame(width: 150, height: 150)
        }
        .padding()
    }
}

#Preview {
    CardInfo(bien: Biens(id: 1, title: "Villa 1", image: "villa1", price: 30000, description: "Lorem ipsum dolor si amet"))
}
