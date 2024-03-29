import SwiftUI

struct FruitDetailView: View {
    
    var fruit: Fruits
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                Image(fruit.image)
                    .resizable()
                    .frame(width: 400, height: 350)
                    .background(LinearGradient(
                        gradient: Gradient(colors: [Color(self.fruit.colorLight), Color(self.fruit.colorDark)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    )
                Text(fruit.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(self.fruit.colorDark))
                    .padding(.bottom, 25.0)
                Text(fruit.description)
                    .font(.title2)
                    .padding(.bottom, 25.0)
                Text("Nutrition value per 100g")
                    .font(.title2)
                    .frame(width: 300.0, height: 50.0)
                    .background(Color(hue: 1.0, saturation: 0.025, brightness: 0.816))
                    .cornerRadius(10)
                Text("LEARN MORE ABOUT " + self.fruit.name.uppercased())
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color(self.fruit.colorDark))
                Text("Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.")
                    .padding()
            }
            .padding()
            .padding(.bottom, 250.0)
        }
    }
}

#Preview {
    FruitDetailView(fruit: Fruits(id: 1, name: "Apple", image: "apple", description: "Lorem ipsum dolor si amet", colorLight: "ColorAppleLight", colorDark: "ColorAppleDark"))
}
