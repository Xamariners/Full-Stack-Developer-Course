using System;
using GreatQuotes.Data;
using System.Collections.Generic;
using XamarinUniversity.Infrastructure;

namespace GreatQuotes.ViewModels
{
    public class QuoteViewModel : SimpleViewModel
    {
        readonly GreatQuote quote;

        public string FirstName
        {
            get { return quote.FirstName; }
            set {
                if (quote.FirstName != value) {
                    quote.FirstName = value;
                    RaisePropertyChanged();
                    RaisePropertyChanged(() => Author);
                }
            }
        }

        public string LastName
        {
            get { return quote.LastName; }
            set {
                if (quote.LastName != value) {
                    quote.LastName = value;
                    RaisePropertyChanged();
                    RaisePropertyChanged(() => Author);
                }
            }
        }

        public string Author
        {
            get { return quote.FirstName + " " + quote.LastName; }
        }

        public Gender Gender
        {
            get {return quote.Gender;}
            set { 
                if (quote.Gender != value) {
                    quote.Gender = value;
                    RaisePropertyChanged();
                }
            }
        }

        public string QuoteText
        {
            get { return quote.QuoteText; }
            set { 
                if (quote.QuoteText != value) {
                    quote.QuoteText = value;
                    RaisePropertyChanged();
                }
            }
        }

        public IEnumerable<Gender> GenderChoices
        {
            get
            {
                yield return Gender.Male;
                yield return Gender.Female;
            }
        }

        internal GreatQuote Model
        {
            get { return quote; }
        }

        public QuoteViewModel()
            : this(new GreatQuote())
        {
            QuoteText = "Enter some amazing saying here.";
        }

        public QuoteViewModel(GreatQuote quote)
        {
            this.quote = quote;
        }
    }
}

