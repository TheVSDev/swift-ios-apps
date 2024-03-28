import SwiftUI

struct LoginSuccess: View {
    var body: some View {
        VStack {
            Image("check_big")
            VStack {
                Text("You are successfully")
                    .font(.title)
                Text("connected to your bank")
                    .font(.title)
            } 
            VStack {
                Text("You will receive a message on your")
                Text("email address with the receipt.")
                Text("It's time to enjoy the new upgraded")
                Text("plan with its new cool features.")
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    LoginSuccess()
}
