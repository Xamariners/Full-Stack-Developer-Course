using Xamarin.Forms;
using System;
using GreatQuotes.ViewModels;
using XamarinUniversity.Interfaces;

namespace GreatQuotes
{
    public partial class QuoteListPage : ContentPage
    {
        public QuoteListPage ()
        {
            InitializeComponent ();
        }

        public async void OnQuoteTapped(object sender, ItemTappedEventArgs e)
        {
            await DependencyService.Get<INavigationService>()
                .NavigateAsync(AppPages.Detail);
        }

        async void OnAddQuote(object sender, EventArgs e)
        {
            await DependencyService.Get<MainViewModel>().OnAddQuote();
        }

        async void OnDeleteQuote(object sender, EventArgs e)
        {
            var mi = (MenuItem)sender;
            QuoteViewModel quote = (QuoteViewModel) mi.BindingContext;
            await DependencyService.Get<MainViewModel>().OnDeleteQuote(quote);
        }

        async void OnEditQuote(object sender, EventArgs e)
        {
            var mi = (MenuItem)sender;
            QuoteViewModel quote = (QuoteViewModel) mi.BindingContext;
            await DependencyService.Get<MainViewModel>().OnEditQuote(quote);
        }
    }
}

