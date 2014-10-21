using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Net.Mail;
using System.Data;
using System.Text;

namespace Mobitel.OnlineChanelling.Web
{
    public partial class Default : System.Web.UI.Page
    {
        #region Properties

        public List<Doctor> Doctors 
        {
            get
            {
                List<Doctor> doctorList = new List<Doctor>
                {
                   new Doctor("Dr W.K Balasuriya", "Physician", "Nawaloka Hospital", "Yes"),
                   new Doctor("Dr(Ms) Damayanthi Bandara", "Dermatologist", "Lanka Hospitals", "Yes"),
                   new Doctor("Dr Jagath Bandara", "Psychiatrist", "Durdans Hospital", "Yes"),
                   new Doctor("Dr Mihira Bandara", "Surgeon", "Hemas Hospital Thalawathugoda", "Yes"),
                   new Doctor("Dr Chameera Bandara", "Oculoplastic Surgeon", "Central Hospital (Asiri Group)", "Yes"),
                   new Doctor("Dr Piyasena Bandujeewa", "Orthopaedic Surgeon", "New Philip Hospitals (Pvt) Ltd", "Yes"),
                   new Doctor("Dr Uditha Bulugahapitiya", "Endocrinologist/Diabetologist", "Lanka Hospitals", "Yes"),
                   new Doctor("Dr Kulasiri Buddhakorala", "General Physician", "Hemas Southern Hospital Galle", "Yes"),
                   new Doctor("Dr Thushan Beneragama", "Plastic Surgeon", "Lanka Hospitals", "Yes"),
                   new Doctor("Dr Milhan Batcha", "Gynaecologist And Consultant In Fertility", "Asiri Hospital Ltd", "Yes"),
                   new Doctor("Dr W.K Balasuriya", "Physician", "Nawaloka Hospital", "Yes"),
                   new Doctor("Dr(Ms) Damayanthi Bandara", "Dermatologist", "Lanka Hospitals", "Yes"),
                   new Doctor("Dr Jagath Bandara", "Psychiatrist", "Durdans Hospital", "Yes"),
                   new Doctor("Dr Mihira Bandara", "Surgeon", "Hemas Hospital Thalawathugoda", "Yes"),
                   new Doctor("Dr Chameera Bandara", "Oculoplastic Surgeon", "Central Hospital (Asiri Group)", "Yes"),
                   new Doctor("Dr Piyasena Bandujeewa", "Orthopaedic Surgeon", "New Philip Hospitals (Pvt) Ltd", "Yes"),
                   new Doctor("Dr Uditha Bulugahapitiya", "Endocrinologist/Diabetologist", "Lanka Hospitals", "Yes"),
                   new Doctor("Dr Kulasiri Buddhakorala", "General Physician", "Hemas Southern Hospital Galle", "Yes"),
                   new Doctor("Dr Thushan Beneragama", "Plastic Surgeon", "Lanka Hospitals", "Yes"),
                   new Doctor("Dr Milhan Batcha", "Gynaecologist And Consultant In Fertility", "Asiri Hospital Ltd", "Yes")
                };

                return doctorList;
            }
        }

        #endregion

        #region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {
            BindDoctorSearchDataGrid();

            if (!IsPostBack)
            {
                
            }
        }

        #endregion

        #region Private Methods

        private void BindDoctorSearchDataGrid()
        {
            DoctorSearchDataGrid.DataSource = Doctors;
            DoctorSearchDataGrid.DataBind();
        }

        #endregion

        #region Events

        protected void DoctorSearchDataGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            DoctorSearchDataGrid.PageIndex = e.NewPageIndex;
            DoctorSearchDataGrid.DataBind();
        }

        #endregion
    }

    public class Doctor
    {
        public string Name { get; set; }
        public string Specialization { get; set; }
        public string Hospital { get; set; }
        public string Availablility { get; set; }

        public Doctor(string name, string specialization, string hospital, string availablility)
        {
            this.Name = name;
            this.Specialization = specialization;
            this.Hospital = hospital;
            this.Availablility = availablility;
        }
    }
}
