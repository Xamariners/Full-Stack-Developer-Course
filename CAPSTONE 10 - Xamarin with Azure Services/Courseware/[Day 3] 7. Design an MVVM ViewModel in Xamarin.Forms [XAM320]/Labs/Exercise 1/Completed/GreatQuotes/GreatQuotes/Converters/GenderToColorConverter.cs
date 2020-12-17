using System;
using Xamarin.Forms;
using GreatQuotes.Data;

namespace GreatQuotes.Converters
{
    /// <summary>
    /// Converts a Gender enumeration into a color for the UI
    /// </summary>
    public class GenderToColorConverter : IValueConverter
    {
        public Color Male { get; set; }
        public Color Female { get; set; }

        public object Convert(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
        {
            Gender gender = (Gender)value;
            return gender == Gender.Male
                ? Male
                : Female;
        }

        public object ConvertBack(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
        {
            throw new NotSupportedException();
        }
    }
}

