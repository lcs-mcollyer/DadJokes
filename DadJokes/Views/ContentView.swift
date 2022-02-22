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