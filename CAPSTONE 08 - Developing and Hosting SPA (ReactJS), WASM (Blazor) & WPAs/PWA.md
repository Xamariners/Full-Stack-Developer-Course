# CAPSTONE 8 - Developing and Hosting SPA (ReactJS), WASM (Blazor) & WPAs

## PWA

------------------------ PREPARE THE PROJECT

01. Add the new ASP.NET CORE Website

02. Add the LibMan Client Library

03. Add the "js" and "css" files

04. Add the Nuget Package
	BuildBundlerMinifier

05. Add the BundleConfig.json file

06. Add the Pages to the project.

07. If only Static content, configure the "Stratup.cs" file accordingly.

08. Run the application to check if everything is fine.


------------------------- PREPARE THE PROJECT FOR PWA

09. Create the image and generate the rest of the Application Icons using 
	https://www.favicon-generator.org/

10. Add the meta-tags into the Web page, and the images to the project.

11. Move the "manifest.json" to the root "wwwroot" folder

12. Make the needed corrections to the path of the images in the meta tags and in the manifest.json file.

13. Check the application using "Lighthouse" on Chrome


-------------------------- CONFIGURE THE APPLICATION TO BE A "PWA"

14. Add the Service Worker "sw.js" file to the "wwwroot" folder, and configure the registration process.

15. Add the Service Worker Installer "app-sw.js" file to the "wwwroot" folder.

16. In the desired home page fo the application:
    (a) Add the DIV Placeholder for the "add-to-home" feature
	(b) Register the "app-sw" service worker installer javascript file.

17. Run and Install/Uninstall the application.