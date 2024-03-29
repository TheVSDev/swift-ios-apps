import SwiftUI

struct FruitCard: View {
    
    var fruit: Fruits
    
    var body: some View {
        HStack {
            Image(self.fruit.image)
                .resizable()
                .frame(width: 150, height: 150)
                .background(LinearGradient(
                    gradient: Gradient(colors: [Color(self.fruit.colorLight), Color(self.fruit.colorDark)]),
                    startPoint: .top,
                    endPoint: .bottom
                ))
                .cornerRadius(20)
            Spacer()
            VStack(alignment: .leading) {
                Text(self.fruit.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                Text(String(self.fruit.description))
                    .foregroundColor(Color.gray)
            }
        }
        .padding()
    }
}

#Preview {
    FruitCard(fruit: Fruits(id: 1, name: "Apple", image: "apple", description: "Lorem ipsum dolor si amet", colorLight: "ColorAppleLight", colorDark: "ColorAppleDark"))
}
