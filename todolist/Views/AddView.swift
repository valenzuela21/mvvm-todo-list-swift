import SwiftUI
struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showlert: Bool = false
    
    @FocusState private var nameIsFocused: Bool
    
    var body: some View {
        ScrollView{
            VStack {
            
                ZStack(alignment: .leading) {
             
                    TextField("Type something here...", text: $textFieldText)
                             .padding(.leading, 45)
                             .frame(height: 55)
                             .background(Color(.white))
                             .foregroundColor(.gray)
                             .overlay(
                                 RoundedRectangle(cornerRadius: 10)
                                     .stroke(Color.gray, lineWidth: 1)
                             )
                             .cornerRadius(10)
                             .focused($nameIsFocused)
                    Image(systemName: "scribble.variable")
                        .foregroundColor(.gray)
                        .font(.system(size: 24)) 
                        .padding(.leading, 12)
                }
               
        
                Button(action: {
                    saveButtonPressed()
                }, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 65)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }.padding(14)
        }.navigationTitle("Add and Item ✏️")
            .alert(isPresented: $showlert, content: getAlert)
    }
    
    func saveButtonPressed(){
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            textFieldText = ""
            nameIsFocused = false
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Yuor new todo item must be at least 3 characteres."
            showlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationView{
        AddView()
    }.environmentObject(ListViewModel())
}
