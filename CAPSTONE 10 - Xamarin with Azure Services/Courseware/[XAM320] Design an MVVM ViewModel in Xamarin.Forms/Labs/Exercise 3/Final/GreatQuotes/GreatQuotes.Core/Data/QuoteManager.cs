using System;
using System.Collections.Generic;

namespace GreatQuotes.Data
{
	public static class QuoteManager
	{
		public static IEnumerable<GreatQuote> Load(IQuoteLoader loader)
		{
			if (loader == null)
				throw new Exception("Missing quote loader from platform.");

			return loader.Load();
		}

		public static void Save(IQuoteLoader loader, IEnumerable<GreatQuote> quotes)
		{
			if (loader == null)
				throw new Exception("Missing quote loader from platform.");

			loader.Save(quotes);
		}
	}
}

