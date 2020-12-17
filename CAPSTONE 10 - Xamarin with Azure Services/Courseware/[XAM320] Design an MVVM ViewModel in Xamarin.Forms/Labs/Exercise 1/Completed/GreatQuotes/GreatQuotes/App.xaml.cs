using Xamarin.Forms;
using GreatQuotes.ViewModels;

namespace GreatQuotes
{
    public partial class App : Application
    {
        public static MainViewModel MainViewModel { get; private set; }

        static App()
        {
            MainViewModel = new MainViewModel();
        }

        public App()
        {
            InitializeComponent();

            MainPage = new NavigationPage(new QuoteListPage());
        }
    }
}

