import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Budget Planner")
                    .font(.title)
                    .padding(.bottom, 20.0)
                Image("budget")
                    .padding(.trailing, 20.0)
                    .padding(.top, 50.0)
                Text("Welcome to Budget Planner")
                    .font(.title)
                    .padding(.top, 20.0)
                VStack {
                    Text("Take control of your money")
                        .font(.title2)
                        .foregroundColor(Color(hue: 1.0, saturation: 0.023, brightness: 0.372))
                    Text("and save them by tracking your")
                        .font(.title2)
                        .foregroundColor(Color(hue: 1.0, saturation: 0.023, brightness: 0.372))
                    Text("expenses")
                        .font(.title2)
                        .foregroundColor(Color(hue: 1.0, saturation: 0.023, brightness: 0.372))
                }
                .padding(.top, 20.0)
                NavigationLink(destination: LoginPage()) {
                    Text("Login")
                }
                .foregroundColor(.green)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.white)
                        .shadow(color: .gray, radius: 2, x: 0, y: 2)
                )
                .padding(.top, 150)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
