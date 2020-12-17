using FlagData;
using Xamarin.Forms;
using System;

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
			// Set the binding context
			this.BindingContext = new { Countries = repository.Countries, CurrentFlag };
		}

		private async void OnShow(object sender, EventArgs e)
		{
			CurrentFlag.DateAdopted = CurrentFlag.DateAdopted.AddYears(1);

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
