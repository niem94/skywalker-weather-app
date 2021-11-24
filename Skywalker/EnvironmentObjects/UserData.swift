import Foundation
class UserData : ObservableObject {
    private var defaults: UserDefaults = UserDefaults.standard
    @Published var locations: [String] = []
    @Published var trips: [Trip] = []
    
    init(){
        loadLocations()
        self.trips = loadTrips()
    }
    
    func saveLocation(locationName: String) {
        self.locations.append(locationName)
        defaults.set(self.locations, forKey: "locations")
    }
    
    func deleteLocation(locationName: String) {
        for (index, locName) in self.locations.enumerated() {
            if locName == locationName {
                self.locations.remove(at: index)
                break
            }
        }
        defaults.set(self.locations, forKey: "locations")
    }
    
    private func loadLocations() {
        self.locations = defaults.object(forKey: "locations") as? [String] ?? [String]()
    }
    
    private func loadTrips() -> [Trip] {
        return []
    }
}
