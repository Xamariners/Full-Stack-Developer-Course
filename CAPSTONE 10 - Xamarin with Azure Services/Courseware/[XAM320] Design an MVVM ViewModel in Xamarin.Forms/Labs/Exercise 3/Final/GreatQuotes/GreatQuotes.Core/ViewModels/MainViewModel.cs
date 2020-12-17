using System.Collections.Generic;
using System.Collections.ObjectModel;
using GreatQuotes.Data;
using System.Linq;
using System.Threading.Tasks;
using XamarinUniversity.Infrastructure;
using XamarinUniversity.Interfaces;

namespace GreatQuotes.ViewModels
{
    public class MainViewModel : SimpleViewModel
    {
        IDependencyService serviceLocator;
        public IList<QuoteViewModel> Quotes { get; private set; }

        QuoteViewModel selectedQuote;
        public QuoteViewModel SelectedQuote {
            get {
                return selectedQuote;
            }
            set {
                SetPropertyValue(ref selectedQuote, value);
            }
        }

        public IAsyncDelegateCommand AddQuote { get; private set; }
        public IAsyncDelegateCommand<QuoteViewModel> DeleteQuote { get; private set; }
        public IAsyncDelegateCommand<QuoteViewModel> EditQuote { get; private set; }
        public IAsyncDelegateCommand<QuoteViewModel> ShowQuoteDetail { get; private set; }

        public MainViewModel() : this(new XamarinUniversity.Services.DependencyServiceWrapper())
        {
        }

        public MainViewModel(IDependencyService serviceLocator)
        {
            this.serviceLocator = serviceLocator;

            Quotes = new ObservableCollection<QuoteViewModel>(QuoteManager.Load(serviceLocator.Get<IQuoteLoader>())
                            .Select(q => new QuoteViewModel(q)));

            SelectedQuote = Quotes.FirstOrDefault();

            AddQuote = new AsyncDelegateCommand(OnAddQuote);
            DeleteQuote = new AsyncDelegateCommand<QuoteViewModel>(OnDeleteQuote);
            EditQuote = new AsyncDelegateCommand<QuoteViewModel>(OnEditQuote);
            ShowQuoteDetail = new AsyncDelegateCommand<QuoteViewModel>(OnShowQuoteDetails);
        }

        private async Task OnShowQuoteDetails(QuoteViewModel qvm)
        {
            SelectedQuote = qvm;
            await serviceLocator.Get<INavigationService>()
                .NavigateAsync(AppPages.Detail);
        }

        private async Task OnAddQuote()
        {
            var newQuote = new QuoteViewModel();
            Quotes.Add(newQuote);
            SelectedQuote = newQuote;

            if (!serviceLocator.Get<INavigationService>().CanGoBack)
            {
                await serviceLocator.Get<INavigationService>()
                                   .NavigateAsync(AppPages.Edit, newQuote);
            }
        }

        private async Task OnEditQuote(QuoteViewModel quote)
        {
            SelectedQuote = quote;
            await serviceLocator.Get<INavigationService>()
                .NavigateAsync(AppPages.Edit, quote);
        }

        private async Task OnDeleteQuote(QuoteViewModel quote)
        {
            bool result = await serviceLocator.Get<IMessageVisualizerService>()
                .ShowMessage("Are you sure?", 
                    "Are you sure you want to delete this quote from " + quote.Author + "?",
                    "Yes", "No");

            if (result == true) {
                int pos = Quotes.IndexOf(quote);
                Quotes.Remove(quote);
                if (SelectedQuote == quote) {
                    if (pos > Quotes.Count - 1)
                        pos = Quotes.Count - 1;
                    SelectedQuote = Quotes[pos];
                }
            }
        }
    }
}

