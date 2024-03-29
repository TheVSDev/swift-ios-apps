import SwiftUI

struct FruitsDisplay: View {
    
    var fruit: Fruits
    
    var body: some View {
        VStack {
            Image(self.fruit.image)
                .resizable()
                .frame(width: 290.0, height: 250.0)
                .cornerRadius(10)
            Text(self.fruit.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .padding(.top, 8)
            Text(self.fruit.description)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 16)
                .foregroundColor(Color.white)
            NavigationLink(destination: FruitListView()) {
                Text("Start")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.clear)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(Color.white, lineWidth: 2)
                        )
                        .padding(.horizontal, 20)
            }
            .padding(.top, 20.0)
            
        }
        .padding()
        .frame(width: 360.0, height: 700.0)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color(self.fruit.colorLight), Color(self.fruit.colorDark)]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .cornerRadius(10)
    }
}

#Preview {
    FruitsDisplay(fruit: Fruits(id: 1, name: "Apple", image: "apple", description: "Lorem ipsum dolor si amet", colorLight: "ColorAppleLight", colorDark: "ColorAppleDark"))
        .previewLayout(.sizeThatFits)
}
