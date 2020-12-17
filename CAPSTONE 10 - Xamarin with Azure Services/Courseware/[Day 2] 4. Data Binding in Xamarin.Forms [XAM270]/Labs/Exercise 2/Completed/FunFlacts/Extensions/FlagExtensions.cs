using FlagData;
using System.Reflection;
using Xamarin.Forms;

namespace FunFlacts.Extensions
{
    public static class FlagExtensions
    {
        /// <summary>
        /// Method to retrieve the ImageSource for a flag. The
        /// flag images are stored as embedded resources in the
        /// data assembly.
        /// </summary>
        /// <param name="flag">Flag object to retrieve the image for</param>
        /// <returns>Xamarin.Forms ImageSource</returns>
        public static ImageSource GetImageSource(this Flag flag)
        {
            return ImageSource.FromResource(flag.ImageUrl, flag.GetType().GetTypeInfo().Assembly);
        }
    }
}
