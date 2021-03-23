# CAPSTONE 8 - Developing and Hosting SPA (ReactJS), WASM (Blazor) & WPAs

-------- PREPARE THE API PROJECT

01. Add the Blank Solution

02. Add the "ASP.NET CORE WEB APPLICATION" -> "API PROJECT" 

03. Add the Nuget Packages:
	Microsoft.EntityFrameworkCore
	Microsoft.EntityFrameworkCore.SqlServer  OR System.Data.SqlClient

04. Add the "Data" folder and the "DbContext"

05. Add the "Models" folder and the Model

06. Add the "ConnectionString" to the AppSettings.json file

07. Register the Database Context and Logging Services in the Startup.cs file

08. Scaffold the API Controller for performing the CRUD Operations on the Model

09. Check if the API application is working properly.


-------- ADD THE API DOCUMENTATION GENERATOR using SwashBuckle & Swagger

10. Add the Nuget Package:
	Swashbuckle.AspNetCore 

11. Register the Swagger Service in the Startup.cs file

12. Enable the Middleware to serve the generated Swagger Documentation.

13. Navigate to: https://localhost:44369/swagger/v1/swagger.json to view the generated Swagger documentation

14. Navigate to https://localhost:44369/swagger to view the generated SwaggerUI for the APIs
    NOTE: Check out the commented line in Startup.cs to suppress the "/swagger" path for displaying "index.html"

15. Add the Assembly Attribute to Startup.cs 
    to generate detailed Swagger documentation leveraging upon Assembly Reflection for all API Controllers.

16. Check if the Swagger Documentation is getting generated correctly.
    https://localhost:44369/api-docs (as configured!)


-------- PREPARE THE BLAZOR CLIENT PROJECT

17. Add the Blazor Project using the "BLAZOR APP" -> "BLAZOR SERVER APP" Template

*18. Add the FontAwesome related files in wwwroot/css folder.

*19. Add the CSS references in the _Host.cshtml (layout file)

20. Configure the Solution to run both the applications - API & Blazor Client.

21. Check if both the applications are working fine.



-------- ADD THE RAZOR COMPONENT - to display the list of the Model (Eg: Employees / Departments)

22. Add the View Model (with annotations to address validation needs)

23. Add the RAZOR COMPONENT for Listing the Collection (calling the HTTP GET API)

24. Add the Menu item to the Shared\NavMenu.razor to point to the Listing page.
    Specify the Route as defined in the Listing page.

25. Add the code, defining placeholders for the Add/Edit/Delete pages.

26. Check if the Blazor Client application is able to get the data from the API application.



-------- ADD THE RAZOR COMPONENT - to CRUD the Model (Eg: Employees / Departments)

27. Add the RAZOR COMPONENT for Editing the Employees

28. Add the Enumeration to identify the current editing mode

29. Pass the required parameters from the Listing Blazor Component

30. Receive the parameters in the Editing page in the OnInitializedAsync() method

31. Add the Cancel Button and using the Navigation Manager, redirect back to the Listing page.

32. Check if the base flow of the page is working currectly.

33. Configure the calls to the API to perform the Edit operation

34. Check if the application is working fine.

35. Configure the calls to the API to perform the Delete operation

36. Check if the application is working fine.

37. Finally, configure the calls to the API to perform the Add operation

38. Check if everything is working fine.
