using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;


namespace ShootingClub.Entities
{
    public partial class Weapon
    {
        public string GetPhoto => WeaponImage == null || WeaponImage.Length == 0 ? "/Assets/picture.png" : Directory.GetCurrentDirectory() + "/Images/" + WeaponImage.Trim();
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
