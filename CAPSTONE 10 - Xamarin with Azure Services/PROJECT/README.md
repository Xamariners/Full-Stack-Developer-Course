# Capstone Project - ContosoUniMobileApp
Deploy to at least 2 Platforms (Android/iOS/Windows)

Project Concept: Contoso University Mobile App

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
- Implementing Detailed View pattern
- Implementing data CRUD Add/Edit/Delete

### Overall Page Structure
Home Page
- Images
- Navigation Bar Button
- CarouelView
- Access Device Location API
- Call Weather API

https://docs.microsoft.com/en-us/xamarin/xamarin-forms/user-interface/images?tabs=windows
https://docs.microsoft.com/en-us/xamarin/xamarin-forms/user-interface/toolbaritem
https://docs.microsoft.com/en-us/xamarin/xamarin-forms/user-interface/carouselview/
https://docs.microsoft.com/en-us/xamarin/essentials/geolocation?tabs=android

Course List Page
- CollectionView
- Detailed View
- Binding
- Add/Edit/Delete
- Write to Storage

https://docs.microsoft.com/en-us/xamarin/xamarin-forms/user-interface/collectionview/
https://docs.microsoft.com/en-us/xamarin/essentials/file-system-helpers?context=xamarin%2Fxamarin-forms&tabs=android

Overall
- Color Theme
- Styles

### Day 1 - 
Implementing the Home Page UI

<img src="/Screenshots/Home Page - Android.png" width="203"/> <img src="/Screenshots/Home Page - iOS.png" width="203"/> <img src="/Screenshots/Home Page - UWP.png" width="203"/>

Completion criteria:
Use of ToolBar Button
Use of Grid/Stack Layout
Use of Image Element
Use of Frame Element
Use of ScrollView Element

#### Instructions:

Your objective is to implement the Home Page UI as shown in the design, and the final outcome of your implementation should be similar to it. The Home Page consists of 3 main sections.

1st Section - Frame element with a border and shadow effect is wrapping its content inside. The Frame element consists of 3 elements inside it, two Labels and 1 Image element. The 2nd Label needs to wrap its content inside a ScrollView layout. The Image is loading a JPG image from the app package which is already provided in the Project Solution. The Image will be loaded as an Embedded Resource, hence would require an Extension class, which is already provided in the Starter Solution.

2nd Section - Frame element with 2 Label elements inside it. As for the data displayed, feel free to use any hard coded dummy data.

3rd Section - Frame element with 3 other Frame elements inside it. The content inside should be able to scroll horizontally. In each Frame element there are 3 Labels displaying Weather data. As for the data displayed, feel free to use any hard coded dummy data. You need to make sure to apply the Text attributes according to the design such as Bold, Font Sizing and etc.

Useful Resources: 

- Xamarin.Forms UI Controls - https://docs.microsoft.com/en-us/xamarin/xamarin-forms/user-interface/controls/
- Using Image Element - https://docs.microsoft.com/en-us/xamarin/xamarin-forms/user-interface/images?tabs=windows
- Using ToolbarItem Buttons - https://docs.microsoft.com/en-us/xamarin/xamarin-forms/user-interface/toolbaritem
- Using Frame Layout - https://docs.microsoft.com/en-us/xamarin/xamarin-forms/user-interface/layouts/frame
- Using Grid Layout - https://docs.microsoft.com/en-us/xamarin/xamarin-forms/user-interface/layouts/grid
- Using StackLayout - https://docs.microsoft.com/en-us/xamarin/xamarin-forms/user-interface/layouts/stacklayout

### Day 2 - 

WIP


