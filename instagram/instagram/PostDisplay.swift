import SwiftUI

struct PostDisplay: View {
    var post: Posts
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .foregroundColor(Color.gray)
                    .frame(width: 30.0, height: 30.0)
                Text(self.post.username)
            }
            .padding(.trailing, 280.0)
            Image(systemName: self.post.post)
                .resizable()
                .foregroundColor(Color.gray)
                .frame(width: 550.0, height: 350.0)
            HStack(spacing: 35) {
                HStack(spacing: 35) {
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 30.0, height: 30.0)
                    Image(systemName: "bubble")
                        .resizable()
                        .frame(width: 30.0, height: 30.0)
                    Image(systemName: "paperplane")
                        .resizable()
                        .frame(width: 30.0, height: 30.0)
                }
                .padding(.trailing, 150.0)
                Image(systemName: "bookmark")
                    .resizable()
                    .frame(width: 25.0, height: 25.0)
            }
            .padding()
            Text("20 likes")
                .padding(.trailing, 280.0)
        }
    }
}

#Preview {
    PostDisplay(post: Posts(id: 1, username: "nidal_", post: "square.fill"))
}
