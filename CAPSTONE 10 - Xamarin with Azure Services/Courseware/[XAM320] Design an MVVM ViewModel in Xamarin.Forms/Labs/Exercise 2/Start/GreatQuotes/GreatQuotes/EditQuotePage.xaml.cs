using System;
using Xamarin.Forms;
using XamarinUniversity.Interfaces;

namespace GreatQuotes
{
    public partial class EditQuotePage : ContentPage
    {
        public EditQuotePage()
        {
            InitializeComponent();
        }
        async void OnGoBack(object sender, EventArgs e)
        {
            await DependencyService.Get<INavigationService>().GoBackAsync();
        }
    }
}