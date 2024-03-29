import SwiftUI

struct UserDisplay: View {
    var user: Users
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Image(systemName: "person.circle")
                    .resizable()
                    .foregroundColor(Color.gray)
                    .frame(width: 75, height: 75)
                Text(self.user.username)
                    .font(.headline)
                    .padding(.leading, 15.0)
            }
        }
        .padding()
    }
}

#Preview {
    UserDisplay(user: Users(id: 1, username: "nidal_"))
}
