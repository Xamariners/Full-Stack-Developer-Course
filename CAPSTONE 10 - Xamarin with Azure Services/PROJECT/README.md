# Capstone Project - ContosoUniMobileApp

Project Concept: Contoso University Mobile App
Each day you should be able to deploy to at least 1 or more Platforms (Android/iOS/Windows)

### Objective Competencies:
- XAML UI Implementation
- Device Location API
- REST API (Weather data)
- Color Themes with Styles
- Page Navigation
- File System API
- Read/Write Data from device
- Use of CollectionView
- Use of Data Binding
- Implementing CRUD operations on data

### Overall Page Structure
- Home Page
	- Grid/Stack Layouts, Frame Layouts, Images 
	- Navigation Bar, Tool Bar Item Buttons
	- Access Device Location API
	- RestClient, Calling RESTFul Weather API

- Course List Page
	- Page Navigation
	- CollectionView, Empty Data Views
	- Add/View/Edit/Delete Data
	- Data Binding
	- Read/Write with System File Storage

- Course Create, View, Edit Pages
- Student Create, View, Edit Pages (Optional)
- Department Create, View, Edit Pages (Optional)
- Instructor Create, View, Edit Pages (Optional)

---

### Day 1 (28th December) - 

#### Implementing the Home Page UI

You are to implement the ```Home Page``` UI as shown below, on Android, on iOS and on Windows UWP (deploy to at least 1 or more platforms as you prefer)

<img src="Screenshots/Home Page - Android.png" height="450" /> <img src="Screenshots/Home Page - iOS.png" height="450" /> <img src="Screenshots/Home Page - UWP.png" height="450" />

Completion criteria:
- Use of ToolBar Button
- Use of Grid/Stack Layout
- Use of Image Element
- Use of Frame Layout
- Use of ScrollView Layout

#### Instructions:

Starter Project located in DAY1/Starter.zip file.

Your objective is to implement the Home Page UI as shown in the design, and the final outcome of your implementation should be similar to it. The Home Page consists of 3 main sections.
```xaml
<Grid ... >
	<Frame ... />
	<Frame ... />
	<Frame ... />
</Grid>
```

1st Section - Frame element with a border and shadow effect is wrapping its content inside. The Frame element consists of 3 elements inside it, two Labels and 1 Image element. The 2nd Label needs to wrap its content inside a ScrollView layout. The Image is loading a JPG image from the app package which is already provided in the Project Solution. The Image will be loaded as an ```Embedded Resource```, hence would require an ```Extension``` class, which is already provided in the Starter Solution.
```xaml
<Image Source="{extensions:ImageResource ....banner1.jpg}" />
```

2nd Section - Frame element with 2 Labels inside it. As for the data displayed, feel free to use any hard coded dummy data.

3rd Section - Frame element with 3 other Frame elements inside it. The content inside should be able to scroll horizontally. In each Frame element there are 3 Labels displaying Weather data. As for the data displayed, feel free to use any hard coded dummy data. You need to make sure to apply the Text attributes according to the design such as Bold, Font Sizing and etc.
```xaml
<Frame ... >
	<Grid>
		<Label ... />
		<ScrollView Orientation="Horizontal">
			<Grid ... >
				<Frame ... />
				<Frame ... />
				<Frame ... />
			</Grid>
		</ScrollView>
	</Grid>
</Frame>
```

You need to implement the button at the top right corner of the Home Page which is implemented using ToolbarItem Button as well.
```xaml
<ContentPage.ToolbarItems>
	<ToolbarItem Text="Courses" ... />
</ContentPage.ToolbarItems>
```

You may pick any UI Elements/Controls available in Xamarin.Forms as you prefer to build the UI.

Resources: 

- Xamarin.Forms UI Controls - https://docs.microsoft.com/en-us/xamarin/xamarin-forms/user-interface/controls/
- Using Image Element - https://docs.microsoft.com/en-us/xamarin/xamarin-forms/user-interface/images?tabs=windows
- Using ToolbarItem Buttons - https://docs.microsoft.com/en-us/xamarin/xamarin-forms/user-interface/toolbaritem
- Using Frame Layout - https://docs.microsoft.com/en-us/xamarin/xamarin-forms/user-interface/layouts/frame
- Using Grid Layout - https://docs.microsoft.com/en-us/xamarin/xamarin-forms/user-interface/layouts/grid
- Using StackLayout - https://docs.microsoft.com/en-us/xamarin/xamarin-forms/user-interface/layouts/stacklayout

---

### Day 2 (29th December) - 

#### Implementing Features of Home Page using APIs

You are to implement the features of the Home Page such as loading the Greeting, distance to the University from User's location, and Weather Report of the User's location. (deploy and test on at least 1 or more platforms as you prefer)

Completion criteria:
- Use of Page behind code implementation
- Use of Device Location API
- Use of RestClient to connect to Weather API
- Use of JSON data parsing
- Use of dynamic data updating in UI Elements

#### Instructions:

Starter Project located in DAY2/Starter.zip file.

Your objective is to implement the features Home Page that are shown in the UI. You are to implement the functional logic in the page behind class ```HomePage.xaml.cs``` of the ```HomePage.xaml```. As a best practice all the Page behind logic should be executed on the ```OnAppearing()``` event of the Page, which you can override in the ```HomePage.xaml.cs``` class. The Starter project has already set it up for you in the code, so you may start off there itself.

Display the Greeting - In Home Page, 2nd Section there's a Label element that shows a greeting message to the user such as "Hey there, Good Morning!", which needs to be handled in the C# code behind according to the time of the day (Morning, Afternoon, Evening times).  
```csharp
if (DateTime.Now.Hour < 12)
{
	return "Hey there, Good morning!";
}
...
```

Display the distance to the University from User's location - In Home Page, 2nd Section there's a Label element below the greeting message as "You are 5 km away from the University!", which needs to be handled in the C# code behind by using the Xamarin.Essential's Geolocation API.
```csharp
var deviceLocation = await Geolocation.GetLastKnownLocationAsync();
... 
Location contosoUniLocation = new Location(1.3521, 103.8198);
double distance = Location.CalculateDistance(
                           deviceLocation, 
                           contosoUniLocation,
                           DistanceUnits.Kilometers);

YourLabel.Text = "You are " + Math.Floor(distance) + " km away from the University!";
...
```

Retrieve the User's location Weather data using the REST API endpoint, ```https://wedra.azurewebsites.net/api/``` hosted in Azure for you. You may use the RestClient to consume the REST API calls. We have already included the Model classes required in the Starter project. Below shows how to use the API along with the RestClient, which you can directly use in your own project.

First execute the location search endpoint, ```/api/location/search``` to retrieve the Weather location data using the ```Latitude``` and ```Longitude``` values you retrieved from the Geolocation API.
```csharp
var locationDataUrl = $"https://wedra.azurewebsites.net/api/location/search?lattlong={deviceLocation.Latitude},{deviceLocation.Longitude}";
HttpClient client = new HttpClient();
string locationDataResult = await client.GetStringAsync(locationDataUrl);
var locationData = JsonConvert.DeserializeObject<WeatherLocationData>(locationDataResult);
```

Once you retrive the WeatherLocationData result, finally you can use the Weather data endpoint, ```/api/location/{locationid}``` with the ```WeatherLocationData.Woeid``` parameter to retrieve the Weather data for the location.
```csharp
var locationWeatherDataUrl = $"https://wedra.azurewebsites.net/api/location/{locationData.Woeid}";
string locationWeatherDataResult = await client.GetStringAsync(locationWeatherDataUrl);
var locationWeatherData = JsonConvert.DeserializeObject<WeatherData>(locationWeatherDataResult);
```

Once you retrieve the data from the API, you can populate the data in the Home Page UI elements. Then you need to set ```WeatherDataDisplayGrid``` to Visible in order to make the weather panel visible. Keep in mind the use of Newtonsoft.JSON library, ```JsonConvert``` here to parse JSON data to C# objects, so make sure to add the necessary reference to your project.

Resources: 

- Xamarin.Forms Page Life Cycle -  https://docs.microsoft.com/en-us/xamarin/xamarin-forms/app-fundamentals/app-lifecycle#page-navigation-events
- Xamarin.Essentials: Geolocation - https://docs.microsoft.com/en-us/xamarin/essentials/geolocation?tabs=android
- Consume a RESTful Web Service - https://docs.microsoft.com/en-us/xamarin/xamarin-forms/data-cloud/web-services/rest
- Parsing JSON data with Newtonsoft.JSON - https://www.newtonsoft.com/json

---

### Day 3 (30th December) - 

#### Implementing Navigation, Course List and Create Pages

Your objective is to create new Pages, ```Course List Page``` and ```Course Create Page``` along with their UI as shown in the design, and implement Navigation from Home Page. (deploy and test on at least 1 or more platforms as you prefer)

<img src="Screenshots/Course List Page Empty - Android.png" height="450" /> <img src="Screenshots/Course Create Page - Android.png" height="450" />

Completion criteria:
- Use of Page Navigation
- Use of CollectionView Element
- Use of Entry Element
- Use of Slider Element
- Use of Simple Binding in UI

#### Instructions:

Starter Project located in DAY3/Starter.zip file.

Your objective is to create two new XAML Pages in the "Pages" folder, ```CourseListPage.xaml```, ```CourseCreatePage.xaml``` and navigate to them from Home Page. The navigation from ```HomePage``` to the ```CourseListPage``` should be handled using the ToolbarItem's Click event, which should be placed inside ```HomePage.xaml.cs``` class.
```xaml
<ToolbarItem
	Clicked="CoursesButton_Clicked"
	Text="Courses" ... />
```
```csharp
private void CoursesButton_Clicked(object sender, EventArgs e)
{ ... }
```
You can use the ```Navigation.PushAsync(...)``` method to Navigate to CourseListPage.

In the new CourseListPage, you need to add a ```CollectionView``` element and ```Button``` element, preferably in a Grid Layout. We're going to use this Button to navigate to ```CourseCreatePage```, so let's name it accordingly and set up the click event handler with navigation in ```CourseListPage.xaml.cs``` class. 
```xaml
<CollectionView
	x:Name="CourseListCollectionView"
	Grid.Row="0"
	SelectionMode="Single"
	... />
<Button
	x:Name="AddNewCourseButton"
	Text="Create New Course"
	Clicked="AddNewCourseButton_Clicked"
	Grid.Row="1"
	...	/>
```

Then the CollectionView, we're going to use this for populating the list of Courses, which we'll do on the next day, but for now let's just add an Empty data declaration View using the ```Collection.EmptyView``` property. Additionally decorate the view with a Frame layout with border and shadow effect.
```xaml
<CollectionView
	... >
	<CollectionView.EmptyView>
		<Grid>
			<!--  Empty data declaration view  -->
		</Grid>
	</CollectionView.EmptyView>
</CollectionView>
```

A "Course" contains 4 mandatory fields ```Id```, ```Title```, ```Credits``` and ```Department```, as shown in the ```Course.cs``` model class. In the new CourseCreatePage, add 3 pairs of Label and Entry elements for fields Course Id, Title, and Department. Make sure to set up the ```Keyboard``` property to enable numeric keyboard and ```MaxLength``` property to set up maximum of 4 characters input limit accordingly. 
```xaml
<Label Text="Id:" />
<Entry x:Name="CourseIdEntry" Keyboard="..." MaxLength="..." />
```

Then for the Credits field you need to set up a Label and a Slider element for selecting the value between 1 - 10 credits. Make sure to set up the ```Binding``` between the Slider ```Value``` and Label's ```Text``` property. We need to format the value displayed in the Label, hence use the  ```StringFormat``` extension to display it as, "Credits: (4) Allocated".
```xaml
<Label
	BindingContext="..."
	Text="{Binding Path=Value, StringFormat='Credits: ({0:F0}) Allocated'}" />
<Slider
	x:Name="CourseCreditsSlider" Maximum="..." Minimum="..." />
```

Implement a Button at the bottom with text, "Create Course" with a click event handler, which will navigate back to the previous page using ```Navigation.PopAsync();```
```xaml
<Button
	Clicked="SaveNewCourseButton_Clicked"
	Text="Create Course" ... />
```
```csharp
private void SaveNewCourseButton_Clicked(object sender, EventArgs e)
{ ... }
```

Additionally decorate the view with a Frame layout with border and shadow effect. You need to make sure to apply the Color styling for Text and Background of the elements according to the design provided.

Resources: 

- Xamarin.Forms Navigation - https://docs.microsoft.com/en-us/xamarin/xamarin-forms/app-fundamentals/navigation/
- Xamarin.Forms CollectionView - https://docs.microsoft.com/en-us/xamarin/xamarin-forms/user-interface/collectionview/
- Xamarin.Forms Entry - https://docs.microsoft.com/en-us/xamarin/xamarin-forms/user-interface/text/entry
- Xamarin.Forms Slider - https://docs.microsoft.com/en-us/xamarin/xamarin-forms/user-interface/slider
- Xamarin.Forms Basic Binding - https://docs.microsoft.com/en-us/xamarin/xamarin-forms/app-fundamentals/data-binding/basic-bindings

---

### Day 4 (04th January) - 

#### Read/Write data in Device Storage

You are to access Device Storage and save Course data. You will perform simple validations on input data through the UI elements and perform data read/write operations in the Device File System to save your data. Then you will populate your data in the CollectionView element. (deploy and test on at least 1 or more platforms as you prefer)

Completion criteria:
- Use of Simple data validation
- Use of File System API
- Use of Read/Write data in Device Storage
- Use of CollectionView to populate data
- Use of ItemTemplating to populate data

#### Instructions:

Starter Project located in DAY4/Starter.zip file.

Your objective is to save Course data that you create in the ```CourseCreatePage```, into the Device storage using File System API provided by the Xamarin.Essentials library. Then you can access those data in the ```CourseListPage``` directly and populate them in the CollectionView element.

Before we write/save data, we need to make sure the User enters valid data into the fields in UI. In your  ```CourseCreatePage``` page, when the User enter data into the Entry fields, and click on "Create Course" Button, we should check for the validity of the entered data. You can add this logic in the ```SaveNewCourseButton_Clicked``` event handler and perform this validation for each input element.
```csharp
private async void SaveNewCourseButton_Clicked(object sender, EventArgs e)
{
	var courseIdValue = CourseIdEntry.Text;
	...

	if (!string.IsNullOrEmpty(courseIdValue) &&
		...
		...)
	{
		...
	}
}
```

Once the validation is success 

WIP

Reference: 

- Xamarin.Forms CollectionView with Data - https://docs.microsoft.com/en-us/xamarin/xamarin-forms/user-interface/collectionview/populate-data
- Xamarin.Essentials: File System Helpers - 
https://docs.microsoft.com/en-us/xamarin/essentials/file-system-helpers?context=xamarin%2Fxamarin-forms&tabs=android

---

### Day 5 (05th January) - 

#### Advanced Navigation and App Styles Management

Completion criteria:
- Use of Confirmation Alert Dialogs
- Use of Resources and Styles in XAML

#### Instructions:

Starter Project located in DAY5/Starter.zip file.

Reference: 

WIP

---

### Day 6 (06th January, 1/2 day) - 

...

WIP


