/*
 👾Created by Darren Bryant | University of Texas ar Austin | BS ECE 24👾
 */
import SwiftUI

@main
/*
 * This App is designed to aid in automatic grade calculation. 
 * Allows for multiple courses with distinct assignments, grades and weights
 * Includes option to edit theme
 */
struct MyApp: App {
    @StateObject var courses = Courses()
    @State var color = Color.white
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                ContentView().navigationTitle("Courses")//.colorMultiply(color)
                ColorPicker("Choose a Theme", selection: $color)
                    .frame(width: 200, height: 50, alignment: .bottom).colorMultiply(color)
            }.environmentObject(courses).colorMultiply(color)
        }
        
    }
}
