using Xamarin.Forms;
using GreatQuotes.ViewModels;
using GreatQuotes.Data;
using System.Linq;
using XamarinUniversity.Interfaces;
using XamarinUniversity.Services;
using Xamarin.Forms.Xaml;

[assembly: XamlCompilation(XamlCompilationOptions.Compile)]

namespace GreatQuotes
{
    public partial class App : Application
    {
        static App()
        {
            // Register dependencies.
            DependencyService.Register<MainViewModel>();
            // Register standard XamU services
            XamUInfrastructure.Init();
        }

        public App ()
        {
            InitializeComponent ();

            MasterDetailPage mdPage = new MainPage ();
            MainPage = mdPage;

            // Register pages.
            var navService = DependencyService.Get<INavigationService> () as FormsNavigationPageService;
            navService.RegisterPage (AppPages.Edit, () => new EditQuotePage ());
        }

        protected override void OnSleep()
        {
            base.OnSleep();

            // Persist the quotes back out.
            QuoteManager.Save(DependencyService.Get<MainViewModel>()
                .Quotes.Select(qvm => qvm.Model));
        }
    }
}

