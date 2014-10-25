using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Mobitel.OnlineChanelling.DataAccess.DTO
{
    public class DoctorAvailability
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Doctor
        {
            get
            {
                return FirstName + " " + LastName;
            }
        }
        public string Hospital { get; set; }
        public string Speciality { get; set; }

    }
}
