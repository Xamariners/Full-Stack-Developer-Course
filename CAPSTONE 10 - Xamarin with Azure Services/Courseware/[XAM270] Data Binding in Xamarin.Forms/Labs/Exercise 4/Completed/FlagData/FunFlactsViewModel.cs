using System.Collections.Generic;
using System.ComponentModel;

namespace FlagData
{
    /// <summary>
    /// A class to hold our basic flag logic which flips between 
    /// flags and holds the current "state" of the view.
    /// </summary>
    public class FunFlactsViewModel : INotifyPropertyChanged
    {
        FlagRepository repository;
        int currentFlag;

        public event PropertyChangedEventHandler PropertyChanged;

        /// <summary>
        /// List of the countries
        /// </summary>
        public IList<string> Countries { get { return repository.Countries; } }

        /// <summary>
        /// Currently selected flag
        /// </summary>
        public Flag CurrentFlag
        {
            get
            {
                return repository.Flags[currentFlag];
            }
        }

        public FunFlactsViewModel()
        {
            repository = new FlagRepository();
        }

        public void MoveToNextFlag()
        {
            currentFlag++;
            if (currentFlag >= repository.Flags.Count)
                currentFlag = 0; // wrap

            // The CurrentFlag has changed.
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(nameof(CurrentFlag)));
        }

        public void MoveToPreviousFlag()
        {
            currentFlag--;
            if (currentFlag < 0)
                currentFlag = repository.Flags.Count-1;

            // The CurrentFlag has changed.
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(nameof(CurrentFlag)));
        }
    }
}
