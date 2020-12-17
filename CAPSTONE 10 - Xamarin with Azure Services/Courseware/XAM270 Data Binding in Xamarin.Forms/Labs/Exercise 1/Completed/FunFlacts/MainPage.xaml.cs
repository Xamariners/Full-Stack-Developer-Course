using FlagData;
using Xamarin.Forms;
using FunFlacts.Extensions;
using System;
using System.Collections;

namespace FunFlacts
{
	public partial class MainPage : ContentPage
	{
		FlagRepository repository;
		int currentFlag;

		public MainPage()
		{
            InitializeComponent();

			// Load our data
			repository = new FlagRepository();

            // Setup the view
            InitializeData();
        }

        public Flag CurrentFlag
		{
			get {
				return repository.Flags[currentFlag];
			}
		}

        private void InitializeData()
        {
            country.ItemsSource = (IList) repository.Countries;
            //country.SelectedItem = CurrentFlag.Country;
            //country.SelectedIndexChanged += (s, e) => CurrentFlag.Country = repository.Countries[country.SelectedIndex];
            //country.BindingContext = CurrentFlag;
            //country.SetBinding(Picker.SelectedItemProperty, new Binding(nameof(CurrentFlag.Country)));

            flagImage.Source = CurrentFlag.GetImageSource();

            //adopted.Date = CurrentFlag.DateAdopted;
            //adopted.DateSelected += (s, e) => CurrentFlag.DateAdopted = e.NewDate;

            //hasShield.IsToggled = CurrentFlag.IncludesShield;
            //hasShield.Toggled += (s, e) => CurrentFlag.IncludesShield = hasShield.IsToggled;

            //description.Text = CurrentFlag.Description;

            // Set the binding context
            this.BindingContext = CurrentFlag;
        }

        private async void OnShow(object sender, EventArgs e)
		{
			await DisplayAlert(CurrentFlag.Country,
				$"{CurrentFlag.DateAdopted:D} - {CurrentFlag.IncludesShield}: {CurrentFlag.MoreInformationUrl}", 
				"OK");
		}

		private void OnMoreInformation(object sender, EventArgs eventArgs)
		{
			Device.OpenUri(CurrentFlag.MoreInformationUrl);
		}

		private void OnPrevious(object sender, EventArgs e)
		{
			currentFlag--;
			if (currentFlag < 0)
				currentFlag = 0;
			InitializeData();
		}

		private void OnNext(object sender, EventArgs e)
		{
			currentFlag++;
			if (currentFlag >= repository.Flags.Count)
				currentFlag = repository.Flags.Count-1;
			InitializeData();
		}
	}
}
