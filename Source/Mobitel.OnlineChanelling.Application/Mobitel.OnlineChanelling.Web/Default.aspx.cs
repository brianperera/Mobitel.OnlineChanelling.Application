using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Net.Mail;
using System.Data;
using System.Text;
using Mobitel.OnlineChanelling.DataAccess.DTO;

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
                   //new Doctor("Dr W.K Balasuriya", "Physician", "Nawaloka Hospital", "Yes"),
                   //new Doctor("Dr(Ms) Damayanthi Bandara", "Dermatologist", "Lanka Hospitals", "Yes"),
                   //new Doctor("Dr Jagath Bandara", "Psychiatrist", "Durdans Hospital", "Yes"),
                   //new Doctor("Dr Mihira Bandara", "Surgeon", "Hemas Hospital Thalawathugoda", "Yes"),
                   //new Doctor("Dr Chameera Bandara", "Oculoplastic Surgeon", "Central Hospital (Asiri Group)", "Yes"),
                   //new Doctor("Dr Piyasena Bandujeewa", "Orthopaedic Surgeon", "New Philip Hospitals (Pvt) Ltd", "Yes"),
                   //new Doctor("Dr Uditha Bulugahapitiya", "Endocrinologist/Diabetologist", "Lanka Hospitals", "Yes"),
                   //new Doctor("Dr Kulasiri Buddhakorala", "General Physician", "Hemas Southern Hospital Galle", "Yes"),
                   //new Doctor("Dr Thushan Beneragama", "Plastic Surgeon", "Lanka Hospitals", "Yes"),
                   //new Doctor("Dr Milhan Batcha", "Gynaecologist And Consultant In Fertility", "Asiri Hospital Ltd", "Yes"),
                   //new Doctor("Dr W.K Balasuriya", "Physician", "Nawaloka Hospital", "Yes"),
                   //new Doctor("Dr(Ms) Damayanthi Bandara", "Dermatologist", "Lanka Hospitals", "Yes"),
                   //new Doctor("Dr Jagath Bandara", "Psychiatrist", "Durdans Hospital", "Yes"),
                   //new Doctor("Dr Mihira Bandara", "Surgeon", "Hemas Hospital Thalawathugoda", "Yes"),
                   //new Doctor("Dr Chameera Bandara", "Oculoplastic Surgeon", "Central Hospital (Asiri Group)", "Yes"),
                   //new Doctor("Dr Piyasena Bandujeewa", "Orthopaedic Surgeon", "New Philip Hospitals (Pvt) Ltd", "Yes"),
                   //new Doctor("Dr Uditha Bulugahapitiya", "Endocrinologist/Diabetologist", "Lanka Hospitals", "Yes"),
                   //new Doctor("Dr Kulasiri Buddhakorala", "General Physician", "Hemas Southern Hospital Galle", "Yes"),
                   //new Doctor("Dr Thushan Beneragama", "Plastic Surgeon", "Lanka Hospitals", "Yes"),
                   //new Doctor("Dr Milhan Batcha", "Gynaecologist And Consultant In Fertility", "Asiri Hospital Ltd", "Yes")
                };

                return doctorList;
            }
        }

        TempDataAccess dataAccess;
        #endregion

        #region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {
            //BindDoctorSearchDataGrid();

            if (!IsPostBack)
            {
                BindComboData();
            }
        }

        #endregion

        #region Private Methods

        private void BindDoctorSearchDataGrid()
        {
            DoctorSearchDataGrid.DataSource = Doctors;
            DoctorSearchDataGrid.DataBind();
        }

        private void BindComboData()
        {
            dataAccess = new TempDataAccess();

            var dummy = new DataAccess.DTO.Hospital() { Id = -1, Name = "Select Hospital" };
            var list = dataAccess.GetAllHospitals();
            list.Insert(0, dummy);

            this.ddlHospitals.DataSource = list;
            this.ddlHospitals.DataTextField = "Name";
            this.ddlHospitals.DataValueField = "Id";
            this.ddlHospitals.DataBind();

            var dummy2 = new DataAccess.DTO.Speciality() { Id = -1, SpecialityName = "Select Speciality" };
            var list2 = dataAccess.GetAllSpeciality();
            list2.Insert(0, dummy2);

            this.ddlSpeciality.DataSource = list2;
            this.ddlSpeciality.DataTextField = "SpecialityName";
            this.ddlSpeciality.DataValueField = "Id";
            this.ddlSpeciality.DataBind();
        }
        #endregion

        #region Events

        protected void DoctorSearchDataGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Search();
            DoctorSearchDataGrid.PageIndex = e.NewPageIndex;
            DoctorSearchDataGrid.DataBind();
        }

        #endregion

        protected void ddlHospitals_SelectedIndexChanged(object sender, EventArgs e)
        {
            Search();

            //dataAccess = new TempDataAccess();
            //int id;
            //int.TryParse(ddlHospitals.SelectedValue, out id);

            //DoctorSearchDataGrid.DataSource = dataAccess.GetByHospitalID(id);
            //DoctorSearchDataGrid.DataBind();
        }

        protected void ddlSpeciality_SelectedIndexChanged(object sender, EventArgs e)
        {
            Search();
            //dataAccess = new TempDataAccess();
            //int hospId;
            //int.TryParse(ddlHospitals.SelectedValue, out hospId);
            //int speId;
            //int.TryParse(ddlSpeciality.SelectedValue, out speId);
            //DoctorSearchDataGrid.DataSource = dataAccess.GetBySpecialityAndHospital(speId,hospId);
            //DoctorSearchDataGrid.DataBind();
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static List<string> SearchDoctores(string prefixText, int count)
        {
            List<string> selected = new List<string>();

            var res = new List<Doctor>();
            TempDataAccess da = new TempDataAccess();

            foreach (var item in da.GetAllDoctorss())
            {
                if (item.FirstName.StartsWith(prefixText, StringComparison.OrdinalIgnoreCase) ||
                    item.LastName.StartsWith(prefixText, StringComparison.OrdinalIgnoreCase))
                {
                    selected.Add(item.ToString());
                    res.Add(item);
                }
            }

            return selected;
        }

        private void Search()
        {
            dataAccess = new TempDataAccess();
            int hospId;
            int.TryParse(ddlHospitals.SelectedValue, out hospId);
            int speId;
            int.TryParse(ddlSpeciality.SelectedValue, out speId);
            string fName = string.Empty;
            string lName = string.Empty;

            if (!string.IsNullOrWhiteSpace(hdnSelectedDoctor.Value))
            {
                string[] names = hdnSelectedDoctor.Value.Split(' ');

                if (names.Length == 2)
                {
                    fName = names[0];
                    lName = names[1];
                }
            }

            //if (hospId > 0 && speId > 0)
            //{
            //    DoctorSearchDataGrid.DataSource = dataAccess.GetBySpecialityAndHospital(speId, hospId);
            //}
            //else if (hospId > 0)
            //{
            //    DoctorSearchDataGrid.DataSource = dataAccess.GetByHospitalID(hospId);
            //}
            //else if (speId > 0)
            //{
            //    DoctorSearchDataGrid.DataSource = dataAccess.GetBySpecialityID(speId);
            //}
            //else
            {
                DoctorSearchDataGrid.DataSource = dataAccess.GetByNameSpecialityAndHospital(fName, lName, speId, hospId);
            }
            DoctorSearchDataGrid.DataBind();
        }

        protected void hdnSelectedDoctor_ValueChanged(object sender, EventArgs e)
        {
            HiddenField control = sender as HiddenField;

            if (control != null)
            {
                if (string.IsNullOrWhiteSpace(control.Value))
                    txtDoctorsSearch.Text = string.Empty;

                Search();
                //string name = control.Value;
            }
        }
    }

    //public class Doctor
    //{
    //    public string Name { get; set; }
    //    public string Specialization { get; set; }
    //    public string Hospital { get; set; }
    //    public string Availablility { get; set; }
    //    public Doctor()
    //    {

    //    }
    //    public Doctor(string name, string specialization, string hospital, string availablility)
    //    {
    //        this.Name = name;
    //        this.Specialization = specialization;
    //        this.Hospital = hospital;
    //        this.Availablility = availablility;
    //    }
    //}
}
