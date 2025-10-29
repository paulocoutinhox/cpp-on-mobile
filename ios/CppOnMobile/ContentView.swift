import SwiftUI

struct ContentView: View {
    var body: some View {
        Text(MyObjcClass.getStringFromObjc())
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
