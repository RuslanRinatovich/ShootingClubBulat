using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuestWorldApp.Models 
{
    public partial class ShootingClubBDEntities : DbContext
    {
        private static ShootingClubBDEntities _context;
        public static ShootingClubBDEntities GetContext()
        {
            if (_context == null)
            {
                _context = new ShootingClubBDEntities();
            }
            return _context;
        }
    }
}
