using Mobitel.OnlineChanelling.DataAccess.DTO;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Mobitel.OnlineChanelling.Web
{
    public class TempDataAccess
    {
        string ConnectionString;

        List<Doctor> _AllDoctors;

        public TempDataAccess()
        {
            ConnectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        }

        internal SqlConnection GetConnection()
        {
            return new SqlConnection(ConnectionString);
        }

        internal SqlParameter GetParameter(string parameterName, SqlDbType sqlDbType, object value)
        {
            SqlParameter parameter = new SqlParameter();

            parameter.Direction = ParameterDirection.Input;
            parameter.ParameterName = parameterName;
            parameter.SqlDbType = sqlDbType;
            parameter.Value = value;

            return parameter;
        }

        public List<Hospital> GetAllHospitals()
        {
            List<Hospital> list = new List<Hospital>();

            using (SqlConnection con = GetConnection())
            {
                con.Open();

                SqlCommand command = new SqlCommand("GetAllHospitals", con);
                command.CommandType = CommandType.StoredProcedure;

                var results = command.ExecuteReader();

                if (results.HasRows)
                {
                    Hospital hospital;
                    int tempInt;

                    while (results.Read())
                    {
                        hospital = new Hospital();

                        hospital.Name = results["Name"].ToString();

                        int.TryParse(results["Id"].ToString(), out tempInt);
                        hospital.Id = tempInt;

                        list.Add(hospital);
                    }
                }
            }

            return list;
        }

        public List<Speciality> GetAllSpeciality()
        {
            List<Speciality> list = new List<Speciality>();

            using (SqlConnection con = GetConnection())
            {
                con.Open();

                SqlCommand command = new SqlCommand("GetAllSpeciality", con);
                command.CommandType = CommandType.StoredProcedure;

                var results = command.ExecuteReader();

                if (results.HasRows)
                {
                    Speciality speciality;
                    int tempInt;

                    while (results.Read())
                    {
                        speciality = new Speciality();

                        speciality.SpecialityName = results["SpecialityName"].ToString();

                        int.TryParse(results["Id"].ToString(), out tempInt);
                        speciality.Id = tempInt;

                        list.Add(speciality);
                    }
                }
            }

            return list;
        }

        public List<DoctorAvailability> GetByHospitalID(int id)
        {
            List<DoctorAvailability> list = new List<DoctorAvailability>();

            using (SqlConnection con = GetConnection())
            {
                con.Open();

                SqlCommand command = new SqlCommand("GetDoctorsByHospitalID", con);
                command.CommandType = CommandType.StoredProcedure;

                SqlParameter hospitalId = GetParameter("@HospitalId", SqlDbType.Int, id);
                command.Parameters.Add(hospitalId);

                var results = command.ExecuteReader();

                if (results.HasRows)
                {
                    DoctorAvailability record;

                    while (results.Read())
                    {
                        record = new DoctorAvailability();

                        record.FirstName = results["FirstName"].ToString();
                        record.LastName = results["LastName"].ToString();
                        record.Speciality = results["Speciality"].ToString();
                        record.Hospital = results["HospitalName"].ToString();

                        list.Add(record);
                    }
                }
            }

            return list;
        }

        public List<DoctorAvailability> GetBySpecialityID(int id)
        {
            List<DoctorAvailability> list = new List<DoctorAvailability>();

            using (SqlConnection con = GetConnection())
            {
                con.Open();

                SqlCommand command = new SqlCommand("GetDoctorsBySpecialityId", con);
                command.CommandType = CommandType.StoredProcedure;

                SqlParameter hospitalId = GetParameter("@SpecialityId", SqlDbType.Int, id);
                command.Parameters.Add(hospitalId);

                var results = command.ExecuteReader();

                if (results.HasRows)
                {
                    DoctorAvailability record;

                    while (results.Read())
                    {
                        record = new DoctorAvailability();

                        record.FirstName = results["FirstName"].ToString();
                        record.LastName = results["LastName"].ToString();
                        record.Speciality = results["Speciality"].ToString();
                        record.Hospital = results["HospitalName"].ToString();

                        list.Add(record);
                    }
                }
            }

            return list;
        }

        public List<DoctorAvailability> GetBySpecialityAndHospital(int specialityId,int hospitalId)
        {
            List<DoctorAvailability> list = new List<DoctorAvailability>();

            using (SqlConnection con = GetConnection())
            {
                con.Open();

                SqlCommand command = new SqlCommand("GetDoctorsByHospitalAndSpeciality", con);
                command.CommandType = CommandType.StoredProcedure;

                SqlParameter spcId = GetParameter("@SpecialityId", SqlDbType.Int, specialityId);
                SqlParameter hosId = GetParameter("@HospitalId", SqlDbType.Int, hospitalId);
                command.Parameters.Add(spcId);
                command.Parameters.Add(hosId);

                var results = command.ExecuteReader();

                if (results.HasRows)
                {
                    DoctorAvailability record;

                    while (results.Read())
                    {
                        record = new DoctorAvailability();

                        record.FirstName = results["FirstName"].ToString();
                        record.LastName = results["LastName"].ToString();
                        record.Speciality = results["Speciality"].ToString();
                        record.Hospital = results["HospitalName"].ToString();

                        list.Add(record);
                    }
                }
            }

            return list;
        }

        public List<DoctorAvailability> GetByNameSpecialityAndHospital(string firstName, string lastName, int specialityId, int hospitalId)
        {
            List<DoctorAvailability> list = new List<DoctorAvailability>();

            using (SqlConnection con = GetConnection())
            {
                con.Open();

                SqlCommand command = new SqlCommand("GetDoctorsByNameHsptlSpclty", con);
                command.CommandType = CommandType.StoredProcedure;

                SqlParameter spcId = GetParameter("@SpecialityId", SqlDbType.Int, specialityId);
                SqlParameter hosId = GetParameter("@HospitalId", SqlDbType.Int, hospitalId);
                SqlParameter fName = GetParameter("@FirstName", SqlDbType.VarChar, firstName);
                SqlParameter lName = GetParameter("@LastName", SqlDbType.VarChar, lastName);

                command.Parameters.Add(spcId);
                command.Parameters.Add(hosId);
                command.Parameters.Add(fName);
                command.Parameters.Add(lName);

                var results = command.ExecuteReader();

                if (results.HasRows)
                {
                    DoctorAvailability record;

                    while (results.Read())
                    {
                        record = new DoctorAvailability();

                        record.FirstName = results["FirstName"].ToString();
                        record.LastName = results["LastName"].ToString();
                        record.Speciality = results["Speciality"].ToString();
                        record.Hospital = results["HospitalName"].ToString();

                        list.Add(record);
                    }
                }
            }

            return list;
        }

        public List<DoctorAvailability> GetByNameSpecialityAndHospital()
        {
            List<DoctorAvailability> list = new List<DoctorAvailability>();

            using (SqlConnection con = GetConnection())
            {
                con.Open();

                SqlCommand command = new SqlCommand("GetAllDoctorsAvailability", con);
                command.CommandType = CommandType.StoredProcedure;

                var results = command.ExecuteReader();

                if (results.HasRows)
                {
                    DoctorAvailability record;

                    while (results.Read())
                    {
                        record = new DoctorAvailability();

                        record.FirstName = results["FirstName"].ToString();
                        record.LastName = results["LastName"].ToString();
                        record.Speciality = results["Speciality"].ToString();
                        record.Hospital = results["HospitalName"].ToString();

                        list.Add(record);
                    }
                }
            }

            return list;
        }

        public List<Doctor> GetAllDoctorss()
        {
            if (this._AllDoctors != null)
                return _AllDoctors;

            _AllDoctors = new List<Doctor>();

            using (SqlConnection con = GetConnection())
            {
                con.Open();

                SqlCommand command = new SqlCommand("GetAllDoctors", con);
                command.CommandType = CommandType.StoredProcedure;

                var results = command.ExecuteReader();

                if (results.HasRows)
                {
                    Doctor record;
                    int tempInt;

                    while (results.Read())
                    {
                        record = new Doctor();
                        record.FirstName = results["FirstName"].ToString();
                        record.LastName = results["LastName"].ToString();
                        int.TryParse(results["Id"].ToString(), out tempInt);
                        record.Id = tempInt;

                        _AllDoctors.Add(record);
                    }
                }
            }

            return _AllDoctors;
        }
    }
}