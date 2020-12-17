using Xamarin.Forms;

namespace GreatQuotes
{
    public partial class QuoteListPage : ContentPage
    {
        public QuoteListPage()
        {
            BindingContext = App.MainViewModel;
            InitializeComponent();
        }

        void OnQuoteSelected(object sender, ItemTappedEventArgs e)
        {
            Navigation.PushAsync(new QuoteDetailPage(), true);
        }
    }
}

