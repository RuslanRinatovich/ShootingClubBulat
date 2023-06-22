using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;

namespace ShootingClub.Entities
{
    public partial class ShootingClubEntities : DbContext
    {
        private static ShootingClubEntities _context;

        public static ShootingClubEntities GetContext()
        {
            if (_context == null)
            {
                _context = new ShootingClubEntities();
            }
            return _context;
        }
    }
}
