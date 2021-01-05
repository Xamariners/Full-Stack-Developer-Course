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

Best practices guidelines:
- Read through the provided Resource links before starting each section
- Thoroughly read the step by step guidelines in each section
- Type the code implementation yourself rather than copying and pasting
- Create your own code solutions by following the step by step guidelines

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

In Home Page, 2nd Section there's a Label element that shows a greeting message to the user such as "Hey there, Good Morning!", which needs to be handled in the C# code behind according to the time of the day (Morning, Afternoon, Evening times).  
```csharp
if (DateTime.Now.Hour < 12)
{
	return "Hey there, Good morning!";
}
...
```

Then we need to display the distance to the University from User's location in Home Page, 2nd Section, there's a Label element below the greeting message as "You are 5 km away from the University!", which needs to be handled in the C# code behind by using the Xamarin.Essential's Geolocation API. Usually you need to set up Location access permission declaration in each platform project separately, but for this exercise we have already set it up for you in the project, so you only have to write the code to access the Location features from the Geolocation API.
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

You need to retrieve the User's location Weather data using the REST API endpoint, ```https://wedra.azurewebsites.net/api/``` hosted in Azure for you. You may use the RestClient to consume the REST API calls. We have already included the Model classes required in the Starter project. Below shows how to use the API along with the RestClient, which you can directly use in your own project.

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

In the new CourseListPage, you need to add a ```CollectionView``` element with a name reference as ```CourseListCollectionView``` and ```Button``` element, preferably in a Grid Layout. We're going to use this Button to navigate to ```CourseCreatePage```, so let's name it accordingly and set up the click event handler with navigation in ```CourseListPage.xaml.cs``` class. 
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

<img src="Screenshots/Course List Page - Android.png" height="450" /> <img src="Screenshots/Course List Page - iOS.png" height="450" /> <img src="Screenshots/Course List Page - UWP.png" height="450" />

Completion criteria:
- Use of Simple data validation
- Use of File System API
- Use of Read/Write data in Device Storage
- Use of CollectionView to populate data
- Use of ItemTemplating to populate data

#### Instructions:

Starter Project located in DAY4/Starter.zip file.

Your objective is to save Course data that you create in the ```CourseCreatePage```, into the Device storage using File System API provided by the Xamarin.Essentials library and System.IO classes in .NET framework. Then you can access those data in the ```CourseListPage``` directly and populate them in the CollectionView element.

First we need to make sure the User enters valid data into the fields in UI. In your  ```CourseCreatePage``` page, when the User enter data into the Entry fields, and click on "Create Course" Button, we should check for the validity of the entered data. You can add this logic in the ```SaveNewCourseButton_Clicked``` event handler and perform this validation for each input element.
```csharp
private async void SaveNewCourseButton_Clicked(object sender, EventArgs e)
{
	string courseIdValue = CourseIdEntry.Text;
	...

	if (!string.IsNullOrEmpty(courseIdValue) &&
		...
		...)
	{
		...
	}
}
```

Bonus Tip: You can validate numerical input values using ```int.TryParse()``` method, which will return you a boolean value based on the validity of the input. The TryParse method will also return you the converted value as an out parameter, which can be set up as an example below,
```csharp
bool courseIdValueParseResult = int.TryParse(courseIdValue, out int courseIdIntValue)
```
You can use the out parameter ```courseIdIntValue``` as the resulting value.

Once the validation is success we construct a new Course object with the data.
```csharp
Course newCourse = new Course()
{...}
```

Keep in mind here, we're trying to maintain a list of Courses provided by our Contoso University. So we need to use a list of Course objects when we save our new Course data.
```csharp
List<Course> courseList = new List<Course>();
courseList.Add(newCourse);
```

Then you can convert that list of Courses into a JSON text using the ```Newtonsoft.Json``` plugin with```JsonConvert.SerializeObject()```. Your Starter project is already set up with this package, hence you only need to write the code.

**WRITE DATA TO FILE SYSTEM**

Every app has its own Cache directory in Android, iOS and Windows, which we can use to save our Course data. So we use the Xamarin.Essential plugin's File System API to save our data to the App cache directory. We can retrieve the Cache folder path using ```FileSystem.CacheDirectory``` and use it with ```System.IO.Path``` class provided by .NET itself, which allows us to construct a full path to the file that we're going to create and use to save our data. We're going to save our data in JSON format in the file, so let's name it as ```CourseListData.json``` and retrieve the full path.
```csharp
string dataFilePath = Path.Combine(FileSystem.CacheDirectory, "CourseListData.json");
```

Then we use the ```System.IO.File``` class provided by .NET itself, which allows us to write files into the App's Cache folder. We could use ```File.WriteAllText(...)``` method to write our JSON data into the ```CourseListData.json``` file. 
```csharp
File.WriteAllText(dataFilePath, courseListJson);
```

**READ DATA FROM FILE SYSTEM**

Now that we've written and saved our data in File System, next we should be able to to read it yeah? That should basically be done in ```CourseListPage```, where you should override the ```OnAppearing``` method in the code behind class, just like how we did in ```HomePage.xaml.cs``` class.

Let's read the file by using the same Xamarin.Essential plugin's File System API and with the help from ```System.IO.Path``` and ```System.IO.File``` .NET classes. First we construct the path to our ```CourseListData.json``` file,
```csharp
string dataFilePath = Path.Combine(FileSystem.CacheDirectory, "CourseListData.json");
```

Before we try to read a file, we need to make sure it exists in the given directory, so let's do that with the help of ```File.Exists(...)``` method which returns a boolean value based on the result. Then if we're certain the file exists, we should read it using ```File.ReadAllText(...)``` method provided by same .NET ```System.IO.File``` class.
```csharp
if (File.Exists(dataFilePath))
{
	string currentDataJson = File.ReadAllText(dataFilePath);
}
```

Then you should be able to convert JSON text into a list of Courses ```List<Course>``` using the ```Newtonsoft.Json``` plugin  ```JsonConvert.DeserializeObject<T>()```.

**COLLECTIONVIEW AND DATA**

Now that we have our list of Course objects, we can populate it in our CollectionView, using the ```CollectionView.ItemsSource``` property.
```csharp
CourseListCollectionView.ItemsSource = courseList;
```

That's not all though, since we're dealing with a list of objects that needs to be populated in a repeatable set of UI Elements, we need to use the concept of Item Templating. We can define the each Items appearance in the CollectionView by using the ```CollectionView.ItemTemplate``` property. You basically set up you UI elements inside the ItemTemplate by wrapping it around a DataTemplate object.
```xaml
<CollectionView
	x:Name="CourseListCollectionView"
	... >
	<CollectionView.EmptyView>
		...
	</CollectionView.EmptyView>
	<CollectionView.ItemTemplate>
		<DataTemplate>
			<Grid>
				...
			</Grid>
		</DataTemplate>
	</CollectionView.ItemTemplate>
</CollectionView>
```

Make sure to follow the Design you see on the screenshots, with all 4 Label elements and their styling. Once you set up your Labels, then you need to add Binding to their Text properties to display each field in the ```Course``` modal class.
```xaml
<Label
	...
	Text="{Binding Id, StringFormat='Id: {0}'}" />
<Label 
	...
	Text="{Binding Title}" />
```

**DATA WRITE CHALLENGE!**

That's it! pretty straight foward eh!, but here's the next challenge for you. We go back to the ```CourseCreatePage```, where we save the data, and from what we have done so far, we're directly writing our new Course data into the ```CourseListData.json``` file in the Cache folder. As of now, this is creating a problem where every time we save the new Course data, its overriding the previously stored data, which needs to be fixed. Your challenge is to fix this bug. Below are the logical steps that will help you to achieve this solution,
1. Check data validation on new Course data
1. Check if there is previously saved data
   1. If previously saved data exists
      1. Then load the previously saved data into a list
      1. And append the new Course data into the existing list
   1. If no previously saved data exists
      1. Then add the new Course data into a new list
1. Finally save the finalized data into the file

One more tip, you may have to use both Read and Write logic that we implemented before in order to solve this. Good luck!

Make sure to add the ```Navigation.PopAsync();``` at the end of this logic block to perform a backward navigation upon saving the new Course data.

Resources: 

- Xamarin.Essentials: File System Helpers - 
https://docs.microsoft.com/en-us/xamarin/essentials/file-system-helpers?context=xamarin%2Fxamarin-forms&tabs=android
- System.IO.Path in .NET - https://docs.microsoft.com/en-us/dotnet/api/system.io.path?view=net-5.0
- System.IO.File in .NET - https://docs.microsoft.com/en-us/dotnet/api/system.io.file?view=net-5.0
- Xamarin.Forms CollectionView with Data - https://docs.microsoft.com/en-us/xamarin/xamarin-forms/user-interface/collectionview/populate-data
- Xamarin.Forms CollectionView with ItemTemplating - 
https://docs.microsoft.com/en-us/xamarin/xamarin-forms/user-interface/collectionview/populate-data#define-item-appearance

---

### Day 5 (05th January) - 

#### CollectionView Item Selection and Advanced Navigation 

You are to let your User select an item from the list of Courses and Navigate to the Detailed Page of it. Here you will be passing an object across pages as a parameter. Then you will perform a delete operation on your data with a confirmation from your User. (deploy and test on at least 1 or more platforms as you prefer)

<img src="Screenshots/Course View Page - Android.png" height="450" /> <img src="Screenshots/Course View Page - iOS.png" height="450" /> <img src="Screenshots/Course View Page - UWP.png" height="450" />

<img src="Screenshots/Course View Page - Delete - Android.png" height="450" /> <img src="Screenshots/Course View Page - Delete - iOS.png" height="450" /> <img src="Screenshots/Course View Page - Delete - UWP.png" height="450" />

Completion criteria:
- Use of CollectionView's Item Selection feature
- Use of Passing data between Pages
- Use of Deleting data
- Use of Confirmation Alert Dialog

#### Instructions:

Starter Project located in DAY5/Starter.zip file.

Your objective is to create a new XAML Page in the "Pages" folder, ```CourseViewPage.xaml```, which will display all the details of a selected Course. Then you're going to enable item selection in the ```CollectionView``` of the ```CourseListPage``` and you will navigate to the new page while passing in the selected Course item as a parameter. Then at the end you implement logic to delete a selected Course upon an alert confirmation from the User.

First we create the new XAML Page, ```CourseViewPage.xaml``` inside the "Pages" folder. Then you need to implement the UI as shown in the screenshots, also making sure to set up naming for each Label element so that later you can access them from your Page behind code.
```xaml
<ContentPage>
    <ContentPage.Content>
        <Grid>
            <Label
                x:Name="CourseIdLabel" ... />
            <Label
                x:Name="CourseTitleLabel" ... />
            ...
			
            <Grid
                ... >
                <Button
                    Text="Delete"
                    ... />
                <Button
                    Text="Edit"
                    ... />
            </Grid>
        </Grid>
    </ContentPage.Content>
</ContentPage>
```

**COLLECTIONVIEW AND ITEM SELECTION**

Next you need to modify the ```CollectionView``` in the ```CourseListPage``` to enable Selection feature, which will allow your users to select any given Course item in the list. Use the ```CollectionView.SelectionMode``` property and set up the event handler for ```CollectionView.SelectionChanged``` event in the CollectionView as follows,
```xaml
<CollectionView
	SelectionChanged="..."
	SelectionMode="..."
	... >
	<CollectionView.EmptyView>
		...
	</CollectionView.EmptyView>
	<CollectionView.ItemTemplate>
		...
	</CollectionView.ItemTemplate>
</CollectionView>
```

In the code behind ```CollectionView.SelectionChanged``` event handler, you can retrieve the selected item using ```CurrentSelection``` property provided in the ```SelectionChangedEventArgs``` parameter. You may take that value and pass into the constructor of your new ```CourseViewPage``` while navigating as shown below,
```csharp
Course selectedCourse = (Course) e.CurrentSelection.First();
this.Navigation.PushAsync(new CourseViewPage(selectedCourse));
```

**NAVIGATION AND DATA**

Do not forget to modify your ```CourseViewPage``` code behind constructor to accept the parameter and set up the values in the UI elements that you set up earlier. Go through all the properties in the passed in Course object and popuplate them in the Label elements.
```csharp
public partial class CourseViewPage : ContentPage
{
	public CourseViewPage(Course course)
	{
		_course = course;
		InitializeComponent();

		CourseIdLabel.Text = _course.Id.ToString();
		...
	}
}
```

**CONFIRMATION AND DATA DELETE**

Now let's handle the Delete button, which allows your User to delete the selected Course item. First you need to make sure you have added the Click event handler in the code behind,
```xaml
<Button
	x:Name="DeleteCourseButton"
	Clicked="DeleteCourseButton_OnClicked"
	... />
```

It is best practice to implement confirmation barrier when it comes to executing sensitive operations such as deleting data. So let's follow the same principle here. In the code behind click event handler, you need need to use the Xamarin.Forms ```Page.DisplayAlert()``` method to show a confirmation dialog before executing our data delete logic.
```csharp
private async void DeleteCourseButton_OnClicked(object sender, EventArgs e)
{
	bool isDeleteConfirmed = 
		await this.DisplayAlert(
			"Warning!", 
			"Are you sure, you want to delete?", 
			"Yes", "Cancel");

	if (isDeleteConfirmed)
	{
		// Implement Delete data logic
	}
	else
	{
		// Do nothing. Delete operation cancelled by User
	}
}
```

Once we confirm with our User that they acutually want to delete the Course item from our data store, then we can implement the logic following these steps,

1. Check if there is previously saved data
	1. Yes, previously saved data exists
		1. Then load the previously saved data into a list
	1. If no previously saved data exists
		1. Then ignore the execution and return
1. Delete the selected Course object from the list
1. Check if item was successfully removed
	1. Yes, successfully removed
		1. Then save the updated list of Courses
		1. Navigate back to the previous Page
	1. Nope, removal failed
		1. Then stay in the current page
		
Tip: You can delete an item from a List in C# using the ```List.Remove(...)``` method, by passing in that list item object. Then to retrieve that targeted list item, you can using use C# LINQ queries and look it up using the unique Id value as follows.
```csharp
var isRemoveSuccess =  courseList.Remove(courseList.First(x => x.Id == _course.Id));
```

**HOMEWORK - DATA EDIT CHALLENGE!**

Now that we managed to Delete our data, next we can look into Editing or Updating the data. This is going to be a home work assignment, where you will handle the logic and implementation yourself. 

Remember the ```Edit Button``` we added in our ```CourseViewPage``` page? This is where Data Edit execution should begin by navigating to a new Page which allows you to Edit and save your selected Course data.

Your objective is to add new Page ```CourseEditPage```, pass in the selected Course to update, then save the update changes in it, and finally navigate back to the previous page. Additionally, you should be navigating back to the ```CourseListPage``` direction upon successfully saving the data. You will have to use a mix of both logic of, ```CourseViewPage``` navigation and data delete implementation that we did today. Good luck!

Resources:

- Xamarin.Forms CollectionView with Item Selection - https://docs.microsoft.com/en-us/xamarin/xamarin-forms/user-interface/collectionview/selection 
- Xamarin.Forms Display Confirmation Pop-ups - https://docs.microsoft.com/en-us/xamarin/xamarin-forms/user-interface/pop-ups
- Xamarin.Forms Page Navigation and Parameters - https://docs.microsoft.com/en-us/xamarin/xamarin-forms/app-fundamentals/navigation/hierarchical#passing-data-through-a-page-constructor

---

### Day 6 (06th January, 1/2 day) -

#### Adopting Resources and Styles in XAML

You are to improve your XAML UI implementation with the help of Resources and Styles, in order to reduce code repetition, minimize complexity, improve readability and maintenance. (deploy and test on at least 1 or more platforms as you prefer)

Completion criteria:
- Use of Resources in XAML
- Use of Styles in XAML

#### Instructions:

Starter Project located in DAY6/Starter.zip file.

Your objective is to identify repeated XAML code and use Resources isolation and Style extraction to properly structure the XAML code, while improving readability and maintainability.

**PAGE CONTEXT XAML RESOURCE AND STYLES**

Let's take a look at the HomePage, where you have used multiple ```Frame``` elements to implement the UI. You may notice that all the Frame elements share the same background color value, ```#593196```. This can be extracted out as a XAML Resource and shared across all the elements that uses this Color. In order to do this, you need to set up the ```ResourceDictionary``` in your ```HomePage.xaml```,
```xaml
<ContentPage
    x:Class="ContosoUniMobileApp.Pages.HomePage"
	... >
    <ContentPage.Resources>
        <ResourceDictionary>
            ...
        </ResourceDictionary>
    </ContentPage.Resources>
	...
</ContentPage>
```

**XAML RESOURCES**

Then inside the ```ResourceDictionary``` you can create your new Resource as a Color resource which holds the Color value, ```#593196``` as follows settings it's Key name as ```AppThemeColor```,
```xaml
<Color x:Key="AppThemeColor">#593196</Color>
```
After that you can update all your Frame elements to reference the new ```AppThemeColor``` Resource to for their ```Frame.BorderColor``` property value using ```StaticResource``` markup extension. Now you no longer have to set up the Color property individually in your Frame elements,
```xaml
<Frame
    Margin="7"
    HasShadow="False" 
    BorderColor="{StaticResource AppThemeColor}"
	... >
		...
</Frame>
```

**XAML STYLES**

If you take a closer look you may have noticed that all your Frame elements in the HomePage shares a bunch of common visual properties and values such as Margin, HasShadow, and BorderColor. This is a good opportunity to make use of XAML Styles and reduce this repetition of code, all over your XAML. Let's create our first Style object as ```FrameElementStyle```, targeting the Frame element, in the same HomePage ```ResourceDictionary``` as follows,
```xaml
<Style x:Key="FrameElementStyle" TargetType="Frame">
	<Setter Property="BorderColor" Value="{StaticResource AppThemeColor}" />
	<Setter Property="Margin" Value="7" />
	<Setter Property="HasShadow" Value="True" />
</Style>
```

After that you can update all your Frame elements to reference the new ```FrameElementStyle``` Style using the ```StaticResource``` markup extension. Now you no longer have to set up the visual properties in each Frame element individually,
```xaml
<Frame Style="{StaticResource FrameElementStyle}">
	...
</Frame>
```

**APP CONTEXT XAML RESOURCE AND STYLES**

Now looking at all the Pages you have in your project solution, you may have noticed that we're using the same Color value ```#593196``` and Frame element styling in multiple pages. So its a good idea to elevate our HomePage level Resources and Styles to the App global context level, allowing them to accessible from all the Pages in the app. In order to do this, you need to move the Resource ```AppThemeColor``` and Style ```FrameElementStyle``` over to your ```App.xaml```'s ```ResourceDictionary``` as follows,
```xaml
<Application
    x:Class="ContosoUniMobileApp.App"
	... >
    <Application.Resources>

        <!--  Resources  -->
        <Color x:Key="AppThemeColor">#593196</Color>

        <!--  Styles  -->
        <Style x:Key="FrameElementStyle" TargetType="Frame">
            ...
        </Style>

        ...
    </Application.Resources>
</Application>
```

This will allow you to use the ```AppThemeColor``` and Style ```FrameElementStyle``` across all your Pages, CourseListPage, CourseCreatePage, CourseViewPage, etc. Go ahead and upload all the UI elements that uses the ```#593196``` color, ```AppThemeColor``` Resource and all the Frame elements with the ```FrameElementStyle``` Style, increasing the readability, maintainability and reducing repetition in your XAML.

Following the same approach you create Style object for all the Button elements as follows,
```xaml
<Style x:Key="ButtonElementStyle" TargetType="Button">
	<Setter Property="BackgroundColor" Value="{StaticResource AppThemeColor}" />
	<Setter Property="Margin" Value="7,0,7,7" />
	<Setter Property="FontSize" Value="Medium" />
	<Setter Property="TextColor" Value="White" />
</Style>
```

And you may simplify all your Button elements as follows,
```xaml
<Button
	Style="{StaticResource ButtonElementStyle}"
	... />
```

Build and run your app to make sure everything is in order, and the UI is behaving as expected.

You can proceed to apply the same approach to create a Style object for all the Label elements as well in your app. As you can see the use of Resources and Styles in XAML greatly reduces repetition, improves reusability and maintainability.

Resources: 

- Xamarin.Forms XAML Resources - https://docs.microsoft.com/en-us/xamarin/xamarin-forms/xaml/resource-dictionaries#create-resources-in-xaml
- Xamarin.Forms XAML Styles - https://docs.microsoft.com/en-us/xamarin/xamarin-forms/user-interface/styles/xaml/

---

### Final Result - Contoso University App

Built with Xamarin.Forms, and deployed to Android/iOS/Windows,

Android:

<img src="Screenshots/Home Page - Android.png" height="250" /> <img src="Screenshots/Course List Page - Android.png" height="250" /> <img src="Screenshots/Course Create Page - Android.png" height="250" /> <img src="Screenshots/Course View Page - Android.png" height="250" /> <img src="Screenshots/Course View Page - Delete - Android.png" height="250" /> <img src="Screenshots/Course Edit Page - Android.png" height="250" />

iOS:

<img src="Screenshots/Home Page - iOS.png" height="250" /> <img src="Screenshots/Course List Page - iOS.png" height="250" /> <img src="Screenshots/Course Create Page - iOS.png" height="250" /> <img src="Screenshots/Course View Page - iOS.png" height="250" /> <img src="Screenshots/Course View Page - Delete - iOS.png" height="250" /> <img src="Screenshots/Course Edit Page - iOS.png" height="250" />

Windows UWP:

<img src="Screenshots/Home Page - UWP.png" height="250" /> <img src="Screenshots/Course List Page - UWP.png" height="250" /> <img src="Screenshots/Course Create Page - UWP.png" height="250" /> <img src="Screenshots/Course View Page - UWP.png" height="250" /> <img src="Screenshots/Course View Page - Delete - UWP.png" height="250" /> <img src="Screenshots/Course Edit Page - UWP.png" height="250" />

Cheers!

