using System.Threading.Tasks;
using XamarinUniversity.Interfaces;

namespace GreatQuotes.UnitTests.Stubs
{
    public class MessageVisualizerServiceStub : IMessageVisualizerService
    {
        public bool ShowMessageWasCalled { get; set; }
        public Task<bool> ShowMessage(string title, string message, string ok, string cancel = null)
        {
            ShowMessageWasCalled = true;
            return Task.FromResult(true);
        }
    }
}
