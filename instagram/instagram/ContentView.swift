import SwiftUI

struct ContentView: View {
    
    var listUsers:[Users]!
    var listPosts:[Posts]!
    
    init() {
        // Fetch Users from Users.plist
        let usersURL = Bundle.main.url(forResource: "Users", withExtension: "plist")!
        let usersData = try! Data(contentsOf: usersURL)
        let usersDecoder = PropertyListDecoder()
        self.listUsers = try! usersDecoder.decode([Users].self, from: usersData)
            
        // Fetch Posts from Posts.plist
        let postsURL = Bundle.main.url(forResource: "Posts", withExtension: "plist")!
        let postsData = try! Data(contentsOf: postsURL)
        let postsDecoder = PropertyListDecoder()
        self.listPosts = try! postsDecoder.decode([Posts].self, from: postsData)
    }
     
    
    var body: some View {
        NavigationView {
            VStack {
                // Header Navbar
                HStack {
                    Image("instagram")
                        .resizable()
                        .frame(width: 140, height: 75)
                    Spacer()
                    HStack(spacing: 35) {
                        Image(systemName: "plus.app")
                            .resizable()
                            .frame(width: 26.0, height: 26.0)
                        Image(systemName: "heart")
                            .resizable()
                            .frame(width: 26.0, height: 26.0)
                        Image(systemName: "paperplane")
                            .resizable()
                            .frame(width: 26.0, height: 26.0)
                    }
                    .padding()
                }
                
                // Horizontal ScrollView for Users
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(listUsers) { user in
                            UserDisplay(user: user)
                        }
                    }
                }
                
                // Vertical ScrollView for Posts
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20) {
                        ForEach(listPosts) { post in
                            PostDisplay(post: post)
                        }
                    }
                }
            }
            .padding()
            .navigationBarHidden(true)
            
            // Bottom Navbar
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack(spacing: 40) {
                        Image(systemName: "house")
                        Image(systemName: "magnifyingglass")
                        Image(systemName: "play.square.fill")
                        Image(systemName: "bag")
                        NavigationLink(destination: Profile()) { 
                            Image(systemName: "person.circle")
                                .foregroundColor(Color.black)
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
