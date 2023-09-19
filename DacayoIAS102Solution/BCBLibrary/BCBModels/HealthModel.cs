

namespace BCBLibrary.BCBModels
{
    public interface IHealthModel
    {
        string Age { get; set; }
        string BirthDate { get; set; }
        string BloodPressure { get; set; }
        string EducationalAttainment { get; set; }
        string FathersName { get; set; }
        string FirstName { get; set; }
        string Gender { get; set; }
        string HeadOfFamily { get; set; }
        string Height { get; set; }
        int Id { get; set; }
        string Immunation { get; set; }
        string LastName { get; set; }
        string Medicine { get; set; }
        string MiddleName { get; set; }
        string MothersName { get; set; }
        string Occupation { get; set; }
        string Prenatal { get; set; }
        string Purok { get; set; }
        string PWD { get; set; }
        string Religion { get; set; }
        string Suffix { get; set; }
        string Temperature { get; set; }
        string TotalNumberOfFamily { get; set; }
        string TypeOfIllness { get; set; }
        string Weight { get; set; }
    }

    public class HealthModel : IHealthModel
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string Suffix { get; set; }
        public string BirthDate { get; set; }
        public string Age { get; set; }
        public string Gender { get; set; }
        public string civilStatus { get; set; }
        public string Religion { get; set; }
        public string Occupation { get; set; }
        public string FathersName { get; set; }
        public string MothersName { get; set; }
        public string HeadOfFamily { get; set; }
        public string TotalNumberOfFamily { get; set; }
        public string EducationalAttainment { get; set; }
        public string Purok { get; set; }
        public string PWD { get; set; }
        public string Prenatal { get; set; }
        public string TypeOfIllness { get; set; }
        public string Immunation { get; set; }
        public string Weight { get; set; }
        public string Height { get; set; }
        public string Temperature { get; set; }
        public string BloodPressure { get; set; }
        public string Medicine { get; set; }

    }
}
