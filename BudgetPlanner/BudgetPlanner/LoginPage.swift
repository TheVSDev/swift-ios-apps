import SwiftUI

struct LoginPage: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showErrorAlert = false
    @State private var isLoggedIn = false

    var body: some View {
        VStack {
            Text("Credentials")
                .font(.title)
                .padding(.trailing, 200)
            Text("For delivery updates")
                .font(.title2)
                .padding(.trailing, 150)
                .padding(.top, 30)
            TextField("E-mail", text: $email)
                .autocapitalization(.none)
                .padding(.leading, 25)
                .padding(.top, 10)
                .textFieldStyle(.roundedBorder)
            SecureField("Password", text: $password)
                .padding(.bottom, 410)
                .padding(.leading, 25)
                .padding(.top, 10)
                .textFieldStyle(.roundedBorder)

            // Check the fields before connecting
            Button(action: {
                if email.isEmpty || password.isEmpty || !isValidEmail(email) {
                    showErrorAlert = true
                } else {
                    isLoggedIn = true
                }
            }) {
                Text("Connect")
            }
            .foregroundColor(.green)
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.white)
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
            )
            .padding()
        }
        // Show error alert
        .alert(isPresented: $showErrorAlert) {
            Alert(title: Text("Error"), message: Text("Please enter a valid email and fill out all fields"), dismissButton: .default(Text("OK")))
        }
        // Open LoginSuccess page in full screen if login successful
        .fullScreenCover(isPresented: $isLoggedIn) {
            LoginSuccess()
        }
    }
}

func isValidEmail(_ email: String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: email)
    }

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
