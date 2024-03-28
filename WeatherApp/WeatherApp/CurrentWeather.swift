import Foundation

struct CurrentWeather: Codable {
    let temp_c: Double
    let condition: WeatherCondition
}
