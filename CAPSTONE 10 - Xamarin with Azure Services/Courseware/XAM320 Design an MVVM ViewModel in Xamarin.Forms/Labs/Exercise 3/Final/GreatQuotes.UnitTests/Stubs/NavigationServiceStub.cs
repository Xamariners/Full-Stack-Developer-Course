using System;
using System.Threading.Tasks;
using XamarinUniversity.Interfaces;

namespace GreatQuotes.UnitTests.Stubs
{
    public class NavigationServiceStub : INavigationService
    {
        public object CurrentPage { get; set; }

        public event EventHandler Navigated;
        public event EventHandler NavigatedBack;

        public Task NavigateAsync(object pageKey, object viewModel = null)
        {
            this.CurrentPage = pageKey;

            Navigated?.Invoke(this, EventArgs.Empty);

            return Task.FromResult(0);
        }

        public bool CanGoBack { get; set; }

        public Task GoBackAsync()
        {
            NavigatedBack?.Invoke(this, EventArgs.Empty);

            return Task.FromResult(0);
        }

        public Task PushModalAsync(object pageKey, object viewModel = null)
        {
            throw new NotImplementedException();
        }

        public Task PopModalAsync()
        {
            throw new NotImplementedException();
        }
    }
}
