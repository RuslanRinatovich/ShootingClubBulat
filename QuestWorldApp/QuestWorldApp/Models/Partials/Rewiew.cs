using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuestWorldApp.Models
{
    public partial class Rewiew
    {
        
             public string GetQualityOfPuzzles
        {
            get
            {
                
                return $"{QualityOfPuzzles.ToString("f1")}/{10}";
            }
        }
        public string GetEntourage
        {
            get
            {

                return $"{Entourage.ToString("f1")}/{10}";
            }
        }
        public string GetService
        {
            get
            {

                return $"{Sevice.ToString("f1")}/{10}";
            }
        }
        public string GetSafety
        {
            get
            {

                return $"{Safety.ToString("f1")}/{10}";
            }
        }
    }
}
