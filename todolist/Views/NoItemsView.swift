import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView{
            VStack(spacing: 14){
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are yuo a productive person? I think yuo should click the add button and a bunch odf items to your todo list!")
                    .padding(.bottom, 30)
                
                NavigationLink(
                    destination: AddView(), label: {
                        Text("Add Something 🥱")
                            .foregroundColor(Color.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(animate ?  secondaryAccentColor : Color.accentColor)
                            .cornerRadius(10)
                    }
                ).padding(.horizontal, animate ?  40 : 20)
                    .shadow(
                        color: animate ? secondaryAccentColor.opacity(0.2) : Color.accentColor.opacity(0.2),
                        radius:  10,
                        x: 0.0,
                        y: 0.0
                    )
                    .scaleEffect(animate ? 1.1 : 1.0)
                    .offset(y: animate ? -7 : 0)
            }.multilineTextAlignment(.center)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
         .padding(40)
         .onAppear(perform: addAnimation)
    }
    
    func addAnimation(){
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeOut(duration: 2.0)
                    .repeatForever()
                
            ){
                animate.toggle()
            }
        }
    }
}

#Preview{
    NoItemsView()
        .navigationTitle("Title")
}
