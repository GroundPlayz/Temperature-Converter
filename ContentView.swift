import SwiftUI

struct ContentView: View {
    // Declare Variables
    @State private var input = 0
    @State private var index = 0
    @State private var options = ["Â°C", "Â°F"]
    @State var calculation = "-17.78Â°C"
    @State var number = Float()
    
    // A Function to calculate Farenheight or Celsius
    func Calculate(){
        if(index == 0){
            number = Float(input) - 32 * (5 / 9)
            number = round(number * 100) / 100
            calculation = String(number) + "Â°C"
        }
        else if(index == 1){
            number = (Float(input) + 32) * 1.8
            number = round(number * 100) / 100
            calculation = String(number) + "Â°F"
        }
    }
    
    // Main veiw Section
    var body: some View {
        VStack{
            HStack {
                TextField("Enter your score", value: $input, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                VStack{
                    Text("Convert to:")
                    Picker(selection: $index, label: Text("I'm a Picker in a Form")) {
                        ForEach(0 ..< options.count, id: \.self) {
                            Text(self.options[$0])
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                .padding()
                }
            
            Divider()
                .padding()
            
            Text("\(calculation)")
            
            ZStack{
                Button(action: {
                    Calculate()
                }){
                    RoundedRectangle(cornerRadius: 5)
                        .frame(maxWidth: 200, maxHeight: 50)
                        .foregroundColor(.blue)
                }
                Text("Calculate")
            }
        }
    }
}