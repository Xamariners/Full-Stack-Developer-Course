using GreatQuotes.Data;
using System.Collections.Generic;
using System.Linq;
using Ploeh.AutoFixture;

namespace GreatQuotes.UnitTests.Stubs
{
    public class QuoteLoaderStub : IQuoteLoader
    {
        private IList<GreatQuote> quotes;

        public QuoteLoaderStub()
        {
            quotes = new Fixture()
                .CreateMany<GreatQuote>(20)
                   .ToList();
        }

        public IEnumerable<GreatQuote> Load()
        {
            return quotes;
        }

        public void Add(GreatQuote quote)
        {
            quotes.Add(quote);
        }

        public void Save(IEnumerable<GreatQuote> quotes)
        {
        }
    }
}