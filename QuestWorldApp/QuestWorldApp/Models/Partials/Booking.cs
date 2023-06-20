using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace QuestWorldApp.Models
{
    public partial class Order
    {
        public Visibility GetVisibility
        {
            get
            {
                if (Paid)
                    return Visibility.Collapsed;
                
                return Visibility.Visible;
            }
        }
    }
}
