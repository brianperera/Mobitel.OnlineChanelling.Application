using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Mobitel.OnlineChanelling.DataAccess.DTO
{
    public class Doctor
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }

        public override string ToString()
        {
            return FirstName +" "+ LastName;
        }
    }
}
