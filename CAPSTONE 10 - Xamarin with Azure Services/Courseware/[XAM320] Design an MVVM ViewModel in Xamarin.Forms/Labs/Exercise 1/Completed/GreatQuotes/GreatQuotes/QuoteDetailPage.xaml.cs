using Xamarin.Forms;

namespace GreatQuotes
{    
    public partial class QuoteDetailPage : ContentPage
    {
        public QuoteDetailPage()
        {
            BindingContext = App.MainViewModel.SelectedQuote;
            App.MainViewModel.SelectedQuote = null;
            InitializeComponent ();
        }
    }
}

