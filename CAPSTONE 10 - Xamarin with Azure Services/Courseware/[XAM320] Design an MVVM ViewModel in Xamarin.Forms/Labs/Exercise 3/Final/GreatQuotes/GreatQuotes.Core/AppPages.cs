namespace GreatQuotes
{
    /// <summary>
    /// Constants class to register known pages
    /// Can be any object type. Here we used a closed set of enumerations
    /// but could be dynamic strings, etc.
    /// </summary>
    public enum AppPages
    {
        // Place holder for the "details" page. The Navigation Service
        // will (by default) always hide the master page when you do a navigation
        // and a MasterDetailPage is in use. That means that _every_ navigation
        // starts at the detail page. If we don't register a page for this key, then
        // the Navigation system will just show the details page.
        Detail,
        
        /// <summary>
        /// Page used to edit a quote. This is a real page registered in App.xaml.cs
        /// </summary>
        Edit 
    }
}