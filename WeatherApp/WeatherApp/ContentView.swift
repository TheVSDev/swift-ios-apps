import SwiftUI

struct ContentView: View {
    @State private var cityName: String = ""
    @State private var weather: CurrentWeather?

    // Fetch weather data from the API
    func fetchWeather() {
        guard let urlString = "https://api.weatherapi.com/v1/current.json?key=36996b98a27d4d22a12123416242803&q=\(cityName)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            if let decodedResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data) {
                DispatchQueue.main.async {
                    self.weather = decodedResponse.current
                }
            } else {
                print("Failed to decode JSON response")
            }
        }.resume()
    }

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            VStack {
                HStack {
                    Image("weather")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(.trailing, 20)

                    Text("Weather")
                        .font(Font.custom("Poppins-Regular", size: 45))
                        .foregroundColor(Color.white)
                        .padding(.trailing, 20.0)
                }
                .padding(.top, 100)

                HStack {
                    TextField("Enter city name", text: $cityName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        .font(Font.custom("Poppins-Regular", size: 15))

                    Button(action: {
                        self.fetchWeather()
                    }) {
                        Text("Search")
                            .foregroundColor(Color.white)
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                            .background(Color(red: 0.176, green: 0.581, blue: 0.883))
                            .cornerRadius(8)
                            .font(Font.custom("Poppins-Regular", size: 15))
                    }
                    .padding(.trailing)
                }
                .padding(.top, 20)

                if let weather = weather {
                    // Display weather information
                    VStack {
                        Text(cityName)
                            .foregroundColor(Color(red: 0.064, green: 0.358, blue: 0.698))
                            .padding(.bottom, 20.0)
                            .font(Font.custom("Poppins-Regular", size: 35))
                        Text("\(Int(round(weather.temp_c)))°C")
                            .font(Font.custom("Poppins-Regular", size: 35))
                            .foregroundColor(Color.white)
                        Text("\(weather.condition.text)")
                            .font(Font.custom("Poppins-Regular", size: 25))
                            .foregroundColor(Color.white)
                        if let iconURL = URL(string: "https:\(weather.condition.icon)") {
                            Image(systemName: "questionmark.square")
                                .data(url: iconURL)
                                .resizable()
                                .frame(width: 80, height: 80)
                        }
                        
                    }
                    .padding()
                    .padding(.top, 20)
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

// Extension to load image from URL
extension Image {
    func data(url: URL) -> Self {
        guard let data = try? Data(contentsOf: url) else {
            return self
        }
        guard let uiImage = UIImage(data: data) else {
            return self
        }
        return Image(uiImage: uiImage)
    }
}

#Preview {
    ContentView()
}
