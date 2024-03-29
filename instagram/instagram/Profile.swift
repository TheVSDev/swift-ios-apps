import SwiftUI

struct Profile: View {
    
    @State private var searchValue: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Mounir")
                        .font(.largeTitle)
                    Spacer()
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 40.0, height: 40.0)
                }
                .padding()
                TextField("Search photos", text: $searchValue)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                VStack {
                    HStack {
                        Image(systemName: "square.fill")
                            .resizable()
                            .foregroundColor(Color.gray)
                            .frame(width: 150.0, height: 150.0)
                        Image(systemName: "square.fill")
                            .resizable()
                            .foregroundColor(Color.gray)
                            .frame(width: 150.0, height: 150.0)
                    }
                    HStack {
                        Image(systemName: "square.fill")
                            .resizable()
                            .foregroundColor(Color.gray)
                            .frame(width: 150.0, height: 150.0)
                        Image(systemName: "square.fill")
                            .resizable()
                            .foregroundColor(Color.gray)
                            .frame(width: 150.0, height: 150.0)
                    }
                    HStack {
                        Image(systemName: "square.fill")
                            .resizable()
                            .foregroundColor(Color.gray)
                            .frame(width: 150.0, height: 150.0)
                        Image(systemName: "square.fill")
                            .resizable()
                            .foregroundColor(Color.gray)
                            .frame(width: 150.0, height: 150.0)
                    }
                }
                .padding()
                
                Spacer()
                
            }
            
            // Bottom Navbar
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack(spacing: 40) {
                        Image(systemName: "house")
                        Image(systemName: "magnifyingglass")
                        Image(systemName: "play.square.fill")
                        Image(systemName: "bag")
                        Image(systemName: "person.circle")
                    }
                    Spacer()
                }
            }
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
