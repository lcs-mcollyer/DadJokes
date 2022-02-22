import SwiftUI

struct ContentView: View {
    
//MARK: Stored proprotys
    @State var currentJoke: DadJoke = DadJoke(id: "", joke: "Knock Knock", status: 0)
    
    
    //MARK: Computed proprotys
    
    var body: some View {
        VStack {
            
            Text(currentJoke.joke)
                .multilineTextAlignment(.leading)
                .padding(30)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.primary, lineWidth: 4)
                )
                .padding(10)
            
            //heart.circle
            //needs to turn red
            //
            Image(systemName: "heart.circle")
                .resizable()
                .frame(width: 40, height: 40)
            
            Button(action: {
                print("button was pressed")
            },label: {
                Text("Another One!")
            })
                .buttonStyle(.bordered)
          
            HStack{
                Text("Favourites")
                    .font(.title)
                    .bold()
            }
            Spacer()
            
            
            
            List {
                Text("Which side of the chicken has more feathers? The outside.")
                Text("Why did the Clydesdale give the pony a glass of water? Because he was a little horse!")
                Text("The great thing about stationery shops is they're always in the same place...")
            }
            
            Spacer()
                        
        }
       //when the app opens, get a new joke from the webs service
        .task{
            // Assemble the URL that points to the end point
            let url = URL(string: "https://icanhazdadjoke.com/")!
            
            // Define the type of ddat we want from the end point
            // Configure the request to the website
            var request = URLRequest(url: url)
            // Ask for JSON data
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            
            //Start a session to interact or talk with the endpiont
            let urlSession = URLSession.shared
            
            // Try to fetch a new joke
            //but it might not work so we use a do-catch statment
            
            
            do {
               //Get the raw data from the endpiont
                let (data, _) = try await urlSession.data(for: request)
                
                //Atemt to decode the raw data into a Swift strucher
                //Take whats in data and puts it in currentJoke
                //                                       |
                //                                       V
                //
                currentJoke = try JSONDecoder().decode(DadJoke.self, from: data)
                
            } catch  {
                print("could not retrieve or decode the JSON from endpoint")
                // Print the contents of the "error" constant that the do-catch block populates
                print(error)
            }
            
        }
        .navigationTitle("icanhazdadjoke?")
        .padding()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
