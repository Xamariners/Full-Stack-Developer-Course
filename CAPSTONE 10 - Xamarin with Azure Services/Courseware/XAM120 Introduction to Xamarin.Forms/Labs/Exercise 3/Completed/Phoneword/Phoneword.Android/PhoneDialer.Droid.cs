using System.Linq;
using System.Threading.Tasks;
using Android.Content;
using Android.Telephony;
using Xamarin.Forms;
using Uri = Android.Net.Uri;
using Phoneword.Droid;
using Plugin.Permissions;
using Plugin.Permissions.Abstractions;

[assembly: Dependency(typeof(PhoneDialer))]
namespace Phoneword.Droid
{
    public class PhoneDialer : IDialer
    {
        /// <summary>
        /// Dial the phone
        /// </summary>
        public async Task<bool> DialAsync(string number)
        {
            var status = await CrossPermissions.Current.CheckPermissionStatusAsync<PhonePermission>();
            if (status != PermissionStatus.Granted)
            {
                status = await CrossPermissions.Current.RequestPermissionAsync<PhonePermission>();
            }

            if (status == PermissionStatus.Granted)
            {
                var context = Android.App.Application.Context;
                if (context != null)
                {
                    var intent = new Intent(Intent.ActionCall);
                    intent.SetData(Uri.Parse("tel:" + number));

                    if (IsIntentAvailable(context, intent))
                    {
                        context.StartActivity(intent);
                        return await Task.FromResult(true);
                    }
                }
            }

            return await Task.FromResult(false);
        }

        /// <summary>
        /// Checks if an intent can be handled.
        /// </summary>
        public static bool IsIntentAvailable(Context context, Intent intent)
        {
            var packageManager = context.PackageManager;

            var list = packageManager.QueryIntentServices(intent, 0)
                .Union(packageManager.QueryIntentActivities(intent, 0));
            if (list.Any())
                return true;

            TelephonyManager mgr = TelephonyManager.FromContext(context);
            return mgr.PhoneType != PhoneType.None;
        }
    }
}
