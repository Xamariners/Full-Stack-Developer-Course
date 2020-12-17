using System.Threading.Tasks;
using XamarinUniversity.Interfaces;

namespace GreatQuotes.UnitTests.Stubs
{
    public class MessageVisualizerServiceStub : IMessageVisualizerService
    {
        public bool ShowMessageWasCalled { get; set; }
        public async Task<bool> ShowMessage(string title, string message, string ok, string cancel = null)
        {
            await Task.Delay(1000);
            ShowMessageWasCalled = true;
            return true;
        }
    }
}
