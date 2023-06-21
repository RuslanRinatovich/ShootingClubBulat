using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace QuestWorldApp.Models
{
    public partial class Pricelist
    {
        public Visibility GetVisibility
        {
            get
            {
                if (Manager.CurrentUser == null)
                    return Visibility.Collapsed;
                if (Manager.CurrentUser.RoleId < 2)
                    return Visibility.Collapsed;
                return Visibility.Visible;
            }
        }

    }
}
