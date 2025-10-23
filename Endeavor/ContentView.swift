import SwiftUI
import PhotosUI
import Foundation

extension UIColor {
    class var appBackgroundColor: UIColor {
        guard let color = UIColor(named: "appBackgroundColor") else {
            return .white
        }
        return color
    }
}

extension Color {
    static let navy = Color(red: 0.110, green: 0.176, blue: 0.267)
}


//MODELS
//info for fam
struct Family: Identifiable {
    let id = UUID()
    var name: String
    var age: Int
}

// info for profile
struct User: Identifiable {
    let id = UUID()
    var name: String
    var age: Int
    var email: String?
    var birthDate: Date?
}

//info for the calendar
struct Tasks: Identifiable{
    let id = UUID()
    var title: String
    var description: String?
    var dueDate: Date?
    
}
    
//info for NGOs
struct Organization: Identifiable {
    let id = UUID()
    var name: String
    var location: String
    var type: String
    var description: String?
    var services: [String]
    var referrals: [String]?
    var communityOutreach: [String]?
    var languagesSpoken: [String]
    var website: String?
}
 
//info for hospitals
struct Hospital: Identifiable {
    let id = UUID()
    var name: String
    var location: String
    var phoneNum: String
}

// MARK - Data

//object that adds info for NGO
let organizations: [Organization] = [
Organization(
    name: "Immigration Advocacy Services Inc.",
    location: "36-16 Astoria Blvd South, Astoria, NY 11103",
    type: "Nonprofit Outreach Center",
    description: "Focused on immigration support since 1988.",
    services: [
        "Free consultations (appointment only)",
        "Online filings",
        "Green card and naturalization support",
        "Employment Authorization Documents (EAD)",
        "Citizenship application support",
        "Fingerprinting",
        "Photo services",
        "Document certification",
        "Anti-fraud assistance"
    ],
    referrals: [
        "Accredited attorneys",
        "Social service agencies",
        "Government offices"
    ],
    communityOutreach: [
        "Speakers for events",
        "Citizenship drives",
        "LGBTQ-friendly support"
    ],
    languagesSpoken: ["Greek", "Hindi", "Italian", "Portuguese", "Punjabi", "Spanish", "Urdu"]
),
Organization(
    name: "HANAC Community Services Center",
    location: "23-16 30th Ave, Astoria, NY 11102",
    type: "Nonprofit Social Services",
    services: [
        "Legal assistance",
        "Court representation",
        "Citizenship support",
        "Employment and ESL programs",
        "Health support",
        "Know Your Rights sessions"
    ],
    communityOutreach: [
        "Remote appointments",
        "Rights advocacy",
        "Agency referrals"
    ],
    languagesSpoken: ["English", "Greek", "Spanish"]
),
Organization(
    name: "CUNY Citizenship Now!",
    location: "Various NYC locations",
    type: "University-based Program",
    services: [
        "Free legal help",
        "Family reunification",
        "Consultations and workshops"
    ],
    languagesSpoken: [],
    website: "https://www.cuny.edu/about/citizenship-now/"
),
Organization(
    name: "LatinoJustice PRLDEF",
    location: "Serving NYC",
    type: "Legal Advocacy",
    services: [
        "Deportation defense",
        "Civil rights support",
        "Community education"
    ],
    languagesSpoken: [],
    website: "https://www.latinojustice.org"
),
Organization(
    name: "Queens Legal Services",
    location: "Queens, NYC",
    type: "Legal Services",
    services: [
        "Help with USCIS forms",
        "Asylum support",
        "Legal aid for vulnerable groups",
        "Civil legal aid"
    ],
    languagesSpoken: [
        "Albanian", "Chinese", "Croatian", "English", "French", "Hebrew", "Italian", "Japanese",
        "Korean", "Mandarin", "Pashto", "Serbian", "Spanish", "Urdu"
    ]
),
Organization(
    name: "Astoria Community Church - ESL Classes",
    location: "Astoria, Queens",
    type: "Faith-Based Service",
    services: ["Free English classes"],
    languagesSpoken: ["English"],
    website: "https://www.astoriachurch.org/esl"
)
]


//adding info for the hospitals
let hospitals: [Hospital] = [
Hospital(
    name: "Women's Medical Center",
    location: "59-17 Junction Blvd Corona, NY 11368",
    phoneNum: "(718) 334-6300",
    
),
Hospital(
    name: "Elmhurst Hospital Center",
    location: "79-01 Broadway Elmhurst, NY 11373",
    phoneNum: "(718) 334-2424",
    
),
Hospital(
    name: "Queens Hospital Center",
    location: "82-68 164th Street Jamaica, NY 11432",
    phoneNum: "(718) 883-3000",
    
),
Hospital(
    name: "Ridgewood Medical Center",
    location: "769 Onderdonk Ave Ridgewood, NY 11385",
    phoneNum: "(718) 334-6190",
    
),
Hospital(
    name: "South Queens Multi-Service Center",
    location: "114-02 Guy R. Brewer Blvd Jamaica, NY 11434",
    phoneNum: "(718) 883-6699",
    
),
Hospital(
    name: "Woodside Medical Center",
    location: "50-53 Newton Road Woodside, NY 11377",
    phoneNum: "(718) 334-6140",
    
),
Hospital(
    name: "Corona Medical Center",
    location: "104-04 Corona Ave Corona, NY 11368",
    phoneNum: "(718) 334-6100",
    
),
Hospital(
    name: "Queens Health Network Medical Center at Parsons Blvd",
    location: "90-37 Parsons Blvd Jamaica, NY 11432",
    phoneNum: "(718) 334-6440",
    
),
Hospital(
    name: "Queens Health Network Medical Center at Springfield Blvd",
    location: "134-64 Springfield Blvd Springfield Gardens, NY 11413",
    phoneNum: "(718) 334-6801",
)
]

//MARK - viewModels

class FamilyViewModel: ObservableObject {
    @Published var fams: [Family] = []
    func addFam(name: String, age: Int) {
        let newFam = Family(name: name, age: age)
        fams.append(newFam)
    }
}

class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    func addUser(firstName: String, lastName: String, email: String, birthDate: Date) {
        let newUser = User(name: "\(firstName) \(lastName)", age: 0, email: email, birthDate: birthDate)
        users.append(newUser)  // Append to the array
    }
}
    
class TaskViewModel: ObservableObject {
    @Published var tasks: [Tasks] = []
    func addTask(title: String, description: String, dueDate: Date) {
        let newTask = Tasks(title: title, description: description, dueDate: dueDate)
        tasks.append(newTask)
    }
    
    func deleteTask(at offsets: IndexSet){
        tasks.remove(atOffsets: offsets)
    }
}

// MARK - Views

struct AddTaskView: View{
    @ObservedObject var viewModel: TaskViewModel
    @State private var title: String = ""
    @State private var dueDate = Date()
    @State private var description: String = ""
    var body: some View {
        ZStack{
            Color.navy.edgesIgnoringSafeArea(.all)
            VStack{
                Text("Add Task")
                    .foregroundStyle(.white)
                    .font(.system(size:24, weight:.bold))
                
                Form{
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)
                    DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                    
                    Button(action: {
                        viewModel.addTask(title: title, description: description, dueDate: dueDate)
                        title = ""
                        description = ""
                        dueDate = Date()
                    }){
                        Text("Add Task")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, minHeight: 44)
                            .background(Color.navy)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                .scrollContentBackground(.hidden)
            }
            .padding()
        }
    }
}
    
        // for the calendar
    struct TaskListView: View{
        @ObservedObject var viewModel: TaskViewModel
        
        var body: some View{
            ZStack{
                Color.navy.edgesIgnoringSafeArea(.all)
                
                List{
                    ForEach(viewModel.tasks){ task in
                        NavigationLink(destination: TaskDetailView(task: task)){
                            VStack(alignment: .leading){
                                Text(task.title)
                                    .font(.headline)
                                if let dueDate = task.dueDate{
                                    Text("Due: \(dueDate, style: .date)")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }
                    .onDelete(perform: viewModel.deleteTask)
                }
            }
            .navigationBarTitle("Tasks")
        }
    }
    
    struct TaskDetailView:View{
        var task: Tasks
        
        var body: some View{
            VStack (alignment: .leading, spacing: 20){
                Text(task.title)
                    .font(.largeTitle)
                    .bold()
                if let desc = task.description{
                    Text(desc)
                        .font(.body)
                }
                if let date = task.dueDate{
                    Text("Due Date: \(date, style: .date)")
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            .padding()
        }
    }
    
    // View for adding a family member
    struct AddFamView: View {
        @State private var name = ""
        @State private var age = ""
        @ObservedObject var viewModel: FamilyViewModel
        var body: some View {
            ZStack{
                Color.navy.edgesIgnoringSafeArea(.all)
                
                VStack{
                    Text("Add Family Member").foregroundColor(.white).font(.system(size: 20, weight: Font.Weight.bold))
                    
                    Form {
                        TextField("Name", text: $name)
                        TextField("Age", text: $age)
                            .keyboardType(.numberPad)
                        
                        Button("Add Family Member") {
                            if let FamAge = Int(age) {
                                viewModel.addFam(name: name, age: FamAge)
                                name = ""
                                age = ""
                            }
                        }
                    }
                    .scrollContentBackground(.hidden)
                }
            }
        }
    }
    
    
    struct FamilyListView: View {
        @ObservedObject var viewModel: FamilyViewModel
        
        var body: some View {
            
            ZStack{
                Color.navy.edgesIgnoringSafeArea(.all)
                
                List(viewModel.fams) { fam in
                    NavigationLink(destination: FamilyDetailView(fam: fam)) {
                        VStack(alignment: .leading) {
                            Text(fam.name).font(.headline)
                            Text("Age: \(fam.age)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                    }
                    
                }
                
            }
            .navigationTitle("My Family")
        }
    }
    
    struct ContentView: View {
        @StateObject var viewModel = FamilyViewModel()
        var body: some View {
            NavigationView {
                ZStack{ Color.navy.edgesIgnoringSafeArea(.all)
                    VStack {
                        NavigationLink(destination: formView(viewModel: viewModel)) {
                            VStack {
                                //                        Color.navy.edgesIgnoringSafeArea(.all)
                                Image("logo")
                                    .resizable()
                                    .frame(width: 260, height: 200)
                                
                                Text(" ")
                                    .font(.largeTitle)
                                    .background(Color.navy)
                                
                            }
                        }
                    }
                    .padding()
                    
                    
                }
            }
        }
    }
    struct FamilyDetailView: View {
        var fam: Family
        @State private var pickerItems = [PhotosPickerItem]()
        @State private var selectedImages = [Image]()
        var body: some View {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height:100)
                        .foregroundColor(.gray)
                    VStack(alignment: .leading) {
                        Text("Name: \(fam.name)").font(.title2)
                        Text("Age: \(fam.age)").font(.title2)
                    }
                }
                VStack{
                    PhotosPicker(selection: $pickerItems, maxSelectionCount: 3, matching: .images){
                        Label("Select documents", systemImage: "document.badge.plus")
                    }
                    
                    ScrollView{
                        ForEach(0..<selectedImages.count, id: \.self){ i in
                            selectedImages[i]
                                .resizable()
                                .scaledToFit()
                                .padding(.leading, 10)
                                .padding(.trailing, 10)
                        }
                        .contentMargins(.horizontal, 10, for:
                                .scrollContent)
                    }
                    
                }
                .onChange(of: pickerItems){
                    Task{
                        selectedImages.removeAll()
                        
                        for item in pickerItems{
                            if let loadedImage = try await item.loadTransferable(type:Image.self){
                                selectedImages.append(loadedImage)
                            }
                        }
                    }
                }
                
            }
            .padding()
        }
    }
    
    
    struct formView: View {
        @ObservedObject var viewModel: FamilyViewModel
        @StateObject var userViewModel = UserViewModel()
        @State private var firstName: String = ""
        @State private var lastName: String = ""
        @State private var eMail: String = ""
        @State private var birthDate = Date()
        @State private var navigateToNextScreen = false
        var body: some View {
            NavigationStack {
                ZStack{
                    Color.navy
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack{
                        Text("Sign Up").foregroundColor(.white).font(.system(size: 40, weight: Font.Weight.bold))
                            .frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 30)
                        
                        Form {
                            Section(header: Text("Personal Inforamtion")
                                .font(.headline).foregroundColor(.white))
                            {
                                TextField("First Name", text: $firstName)
                                TextField("Last Name", text: $lastName)
                                TextField("Enter Your Email", text: $eMail)
                                DatePicker(
                                    "Birthdate",
                                    selection: $birthDate,
                                    displayedComponents: [.date]
                                )
                            }
                            
                            Button("Create Account"){
                                // Calculate age based on birthdate
                                let age = Calendar.current.dateComponents([.year], from: birthDate, to: Date()).year ?? 0
                                
                                // Add user to the view model
                                userViewModel.addUser(firstName: firstName, lastName: lastName, email: eMail, birthDate: birthDate)
                                
                                firstName = ""
                                lastName = ""
                                eMail = ""
                                birthDate = Date()
                                
                                navigateToNextScreen = true
                                
                            }
                            .fontWeight(.bold)
                            .frame(maxWidth: 500, minHeight: 44)
                            .background(Color.white)
                            .foregroundColor(.navy)
                            .cornerRadius(3)
                        }
                        .scrollContentBackground(.hidden)
                        .background(Color.navy)
                        
                        //  NavigationLink outside
                        NavigationLink(
                            destination: SecondView(viewModel: viewModel, userViewModel: userViewModel),
                            isActive: $navigateToNextScreen
                        ) {
                            EmptyView()
                        }
                        .hidden()
                    }.padding()
                }
            }
        }
        
        struct SecondView: View {
            @ObservedObject var viewModel: FamilyViewModel
            @ObservedObject var userViewModel: UserViewModel
            @ObservedObject var taskViewModel = TaskViewModel()
            
            @State private var selectedTap = 0
            
            @State private var pickerItems = [PhotosPickerItem]()
            @State private var selectedImages = [Image]()
            
            var body: some View {
                TabView(selection: $selectedTap) {
                    // Profile Tab
                    NavigationStack {
                        VStack(alignment: .leading, spacing: 20) {
                            HStack{
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height:100)
                                    .foregroundColor(.gray)
                                if let user = userViewModel.users.last{
                                    Text(" \(user.name)")
                                }
                                
                            }
                            VStack(spacing: 12){
                                NavigationLink(destination: DocumentView()) {
                                    Text("Documents")
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color.navy)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                }
                                
                                NavigationLink(destination: NGOView()) {
                                    Text("NGOs")
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color.navy)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                }
                                
                                NavigationLink(destination: HealthcareView()) {
                                    Text("Healthcare")
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color.navy)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                }
                            }.padding(.top)
                        }
                        .navigationTitle("Profile")
                        .navigationBarBackButtonHidden(true)
                        .padding()
                    }
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Profile")
                    }
                    .tag(0)
                    
                    // Family Tab
                    NavigationStack {
                        VStack {
                            NavigationLink("Add Family Member") {
                                AddFamView(viewModel: viewModel)
                            }
                            .fontWeight(.bold)
                            .frame(maxWidth: 600, minHeight: 70)
                            .background(Color.navy)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .padding()
                            
                            NavigationLink("View Family Members") {
                                FamilyListView(viewModel: viewModel)
                            }
                            .fontWeight(.bold)
                            .frame(maxWidth: 600, minHeight: 70)
                            .background(Color.navy)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .padding()
                        }
                        .navigationTitle("Family Members")
                        .padding()
                    }
                    .tabItem {
                        Image(systemName: "person.2.badge.plus")
                        Text("Family")
                        //
                        //                }
                        
                        Text("Family")
                    }
                    .tag(1)
                    
                    
                    //calendar tab
                    NavigationStack{
                        VStack{
                            NavigationLink("Add Task"){
                                AddTaskView(viewModel: taskViewModel)
                            }
                            .fontWeight(.bold)
                            .frame(maxWidth: 500, minHeight: 70)
                            .background(Color.navy)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .padding()
                            
                            NavigationLink("View Tasks"){
                                TaskListView(viewModel: taskViewModel)
                            }
                            .fontWeight(.bold)
                            .frame(maxWidth: 500, minHeight: 70)
                            .background(Color.navy)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .padding()
                        }
                        .navigationTitle(Text("Calendar"))
                    }
                    .tabItem {
                        Image(systemName: "calendar")
                        Text("Calendar")
                    }
                    .tag(2)
                }        .navigationBarBackButtonHidden(true) // Keep this
            }
        }
        
    struct NGOView: View {
        let columns = [
            GridItem(.flexible(minimum: 100, maximum: 210), spacing: 16),
            GridItem(.flexible(minimum: 100, maximum: 210), spacing: 16)
            ]
        
        var body: some View {
            NavigationView {
                    ZStack{
                        Color.navy.edgesIgnoringSafeArea(.all)
                            .ignoresSafeArea()
                        
                        ScrollView {
                            LazyVGrid(columns: columns, spacing: 16) {
                                ForEach(organizations) { org in
                                    VStack(alignment: .leading, spacing: 8){
                                        Text(org.name)
                                            .font(.headline)
                                            .foregroundColor(.primary)
                                        Text(org.location)
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                        Text(org.type)
                                            .font(.caption)
                                            .foregroundColor(.blue)
                                        if !org.services.isEmpty {
                                            Text("Services: \(org.services.prefix(2).joined(separator: ", "))...")
                                                .font(.caption2)
                                                .foregroundColor(.gray)
                                        }
                                    }
                                    .frame(maxWidth: .infinity, minHeight: 100)
                                    .padding()
                                    .background(Color(.systemBackground))
                                    .cornerRadius(10)
                                    .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
                                    .onTapGesture {
                                        // Future expansion: tap to show detail popup or navigate
                                    }
                                }
                            }
                            .padding()
                        }
                    }
                    Text("NGO RESOURCES").background(Color.white)
                        .navigationTitle(".")
                        .navigationBarBackButtonHidden(true)
                    
                }
                
            }
        }
        struct HealthcareView: View {
            let columns = [
                GridItem(.flexible(minimum: 0, maximum: 200), spacing: 16),
                GridItem(.flexible(minimum: 0, maximum: 200), spacing: 16)
            ]
            
            var body: some View {
                NavigationView {
                    ZStack{
                        Color.navy.edgesIgnoringSafeArea(.all)
                            .ignoresSafeArea()
                        VStack{
                            Text("Community Healthcare Center").foregroundColor(.white).padding()
                            
                            ScrollView {
                                LazyVGrid(columns: columns, spacing: 16) {
                                    ForEach(hospitals) { hos in
                                        VStack(alignment: .leading, spacing: 8){
                                    
                                            Text(hos.name)
                                                .font(.headline)
                                                .foregroundColor(.primary)
                                            Text(hos.location)
                                                .font(.subheadline)
                                                .foregroundColor(.secondary)
                                            Text(hos.phoneNum)
                                                .font(.caption)
                                                .foregroundColor(.blue)
                                            
                                        }
                                    }
                                    .frame(maxWidth: .infinity, minHeight: 100)
                                    .padding()
                                    .background(Color(.systemBackground))
                                    .cornerRadius(10)
                                    .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
                                    .onTapGesture {
                                        // Future expansion: tap to show detail popup or navigate
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                }
                
            }
        }
    }
    struct DocumentView: View {
        @State private var pickerItems = [PhotosPickerItem]()
        @State private var selectedImages = [Image]()
        var body: some View {
            VStack{
                PhotosPicker(selection: $pickerItems, maxSelectionCount: 3, matching: .images){
                    Label("Select documents", systemImage: "document.badge.plus")
                }
                
                ScrollView{
                    ForEach(0..<selectedImages.count, id: \.self){ i in
                        selectedImages[i]
                            .resizable()
                            .scaledToFit()
                            .padding(.leading, 10)
                            .padding(.trailing, 10)
                    }
                    .contentMargins(.horizontal, 30, for:
                            .scrollContent)
                }
                
            }
            .onChange(of: pickerItems){
                Task{
                    selectedImages.removeAll()
                    
                    for item in pickerItems{
                        if let loadedImage = try await item.loadTransferable(type:Image.self){
                            selectedImages.append(loadedImage)
                        }
                    }
                }
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

