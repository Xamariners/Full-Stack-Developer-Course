using System;
using GreatQuotes.ViewModels;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

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

        protected override void OnStart()
        {
        }

        protected override void OnSleep()
        {
        }

        protected override void OnResume()
        {
        }
    }
}
