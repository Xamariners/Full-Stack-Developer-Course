using Xamarin.Forms;

namespace FunFlacts
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();

            var np = new NavigationPage(new MainPage());
            Xamarin.Forms.PlatformConfiguration.WindowsSpecific.Page.SetToolbarPlacement(
                np.On<Xamarin.Forms.PlatformConfiguration.Windows>(),
                Xamarin.Forms.PlatformConfiguration.WindowsSpecific.ToolbarPlacement.Bottom);

            Xamarin.Forms.PlatformConfiguration.iOSSpecific.Page.SetUseSafeArea(
                np.On<Xamarin.Forms.PlatformConfiguration.iOS>(),
                true);

            MainPage = np;
        }

        protected override void OnStart()
        {
            // Handle when your app starts
        }

        protected override void OnSleep()
        {
            // Handle when your app sleeps
        }

        protected override void OnResume()
        {
            // Handle when your app resumes
        }
    }
}
