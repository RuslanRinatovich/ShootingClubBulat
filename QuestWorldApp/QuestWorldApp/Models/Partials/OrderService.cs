﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuestWorldApp.Models
{
    public partial class OrderService
    {
        public int Total
        {
            get
            {
                
                return Pricelist.Price * Count;
            }
        }
    }
}
