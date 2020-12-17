// Uncomment this if you are using NUnit
//#define USE_NUNIT
using System;
using XamarinUniversity.Interfaces;
using GreatQuotes.UnitTests.Stubs;
using GreatQuotes.Data;
using GreatQuotes.ViewModels;
using System.Linq;
using System.Threading.Tasks;

#if USE_NUNIT
using TestClass = NUnit.Framework.TestFixtureAttribute;
using TestMethod = NUnit.Framework.TestAttribute;
using TestInitialize = NUnit.Framework.SetUpAttribute;
using TestCleanup = NUnit.Framework.TearDownAttribute;
using NUnit.Framework;
#else
using Microsoft.VisualStudio.TestTools.UnitTesting;
#endif

namespace GreatQuotes.UnitTests
{
    [TestClass]
    public class MainViewModelTests
    {
        static IDependencyService dependencyService;

#if USE_NUNIT
        [OneTimeSetUp]
        public void Setup()
#else
        [AssemblyInitialize]
        public static void Setup(TestContext context)
#endif
        {
            var ds = new DependencyServiceStub();
            ds.Register <IQuoteLoader> (new QuoteLoaderStub());
            ds.Register <INavigationService> (new NavigationServiceStub());
            ds.Register <IMessageVisualizerService> (new MessageVisualizerServiceStub());

            dependencyService = ds;
        }

        [TestMethod]
        public void MainViewModel_Should_load_quotes_with_new_vm()
        {
            var vm = new MainViewModel(dependencyService);
            Assert.AreEqual(20, vm.Quotes.Count);
        }

        [TestMethod]
        public async Task MainViewModel_AddQuote_should_go_to_edit_page()
        {
            var vm = new MainViewModel(dependencyService);
            await vm.AddQuote.ExecuteAsync(null);
            var navService = dependencyService.Get<INavigationService>() as NavigationServiceStub;
            Assert.AreEqual(AppPages.Edit, navService.CurrentPage);
        }

        [TestMethod]
        public async Task MainViewModel_AddQuote_should_go_add_selected_quote()
        {
            var vm = new MainViewModel(dependencyService);
            var numberOfQuotes = vm.Quotes.Count;
            await vm.AddQuote.ExecuteAsync(null);
            Assert.AreEqual(numberOfQuotes + 1, vm.Quotes.Count);
        }

        [TestMethod]
        public async Task MainViewModel_EditQuote_should_go_to_edit_page()
        {
            var vm = new MainViewModel(dependencyService);
            await vm.EditQuote.ExecuteAsync(null);
            var navService = dependencyService.Get<INavigationService>() as NavigationServiceStub;
            Assert.AreEqual(AppPages.Edit, navService.CurrentPage);
        }

        [TestMethod]
        public async Task MainViewModel_DeleteQuote_should_show_message()
        {
            var vm = new MainViewModel(dependencyService);
            await vm.DeleteQuote.ExecuteAsync(vm.Quotes.First());

            var messageService = dependencyService.Get<IMessageVisualizerService>() as MessageVisualizerServiceStub;
            Assert.IsTrue(messageService.ShowMessageWasCalled,
                "ShowMessage was not called on delete");
        }

        [TestMethod]
        public async Task MainViewModel_DeleteQuote_should_remove_quote()
        {
            var vm = new MainViewModel(dependencyService);
            var quoteToRemove = vm.Quotes.First();
            var numberOfQuotes = vm.Quotes.Count;

            await vm.DeleteQuote.ExecuteAsync(quoteToRemove);

            Assert.AreEqual(numberOfQuotes - 1,
                vm.Quotes.Count, "DeleteQuote did not remove quote from collection");
            Assert.IsFalse(vm.Quotes.Contains(quoteToRemove));
        }

        [TestMethod]
        public async Task MainViewModel_DeleteQuote_should_set_next_quote_as_selected()
        {
            var vm = new MainViewModel(dependencyService);

            var quoteToRemove = vm.Quotes[0];
            var nextQuote = vm.Quotes[1];

            await vm.DeleteQuote.ExecuteAsync(quoteToRemove);

            Assert.AreEqual(nextQuote, vm.SelectedQuote,
                "Next Quote was not selected");
        }
    }
}
