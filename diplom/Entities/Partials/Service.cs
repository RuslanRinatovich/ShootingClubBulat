using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShootingClub.Entities
{
    public partial class Service
    {
        public string GetVisibility
        {
            get
            {
                if (Manager.UserInfo.RoleID == 1)
                {
                    return "Visible";
                }
                else
                {
                    return "Collapsed";
                }
            }
        }
    }
}
