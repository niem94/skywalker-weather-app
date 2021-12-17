import SwiftUI


struct WeatherView: View {
    var deleteAction: () -> Void
    @ObservedObject var viewModel: WeatherViewModel
    
    init(deleteAction: @escaping () -> Void, locationName: String, isCurrentLocation: Bool = false) {
        self.deleteAction = deleteAction
        self.viewModel = .init(locationName: locationName, isCurrentLocation: isCurrentLocation)
    }
    
    var body: some View {
        VStack(alignment: .center){
            ZStack(alignment: .top){
                if(!viewModel.isCurrentLocation){
                    HStack(){
                        Spacer()
                        Button {
                            deleteAction()
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(Font.system(.largeTitle))
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color.red)
                                .padding(.trailing).padding(.top)
                            
                        }
                    }.zIndex(1)
                }
                VStack{
                    Card{
                        WeatherLine(location: viewModel.locationAndWeather.0, weather: viewModel.locationAndWeather.1, styling: WeatherLineStyling(fontStyle: .title3, iconSize: 50))
                    }.padding()
                    Card{
                        WeatherForecast()
                    }.padding()
                }
            }
            Spacer()
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(deleteAction: {print("clicked delete")}, locationName: "Odense")
    }
}