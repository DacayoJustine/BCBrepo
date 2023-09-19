namespace BCBLibrary.BCBModels
{
    public interface IResidentsModel
    {
        string Age { get; set; }
        string BirthDate { get; set; }
        string civilStatus { get; set; }
        string EducationalAttainment { get; set; }
        string FathersName { get; set; }
        string FirstName { get; set; }
        string Gender { get; set; }
        string HeadOfFamily { get; set; }
        int Id { get; set; }
        string LastName { get; set; }
        string MiddleName { get; set; }
        string MothersName { get; set; }
        string Occupation { get; set; }
        string Purok { get; set; }
        string Religion { get; set; }
        string StatusType { get; set; }
        string Suffix { get; set; }
        string TotalNumberOfFamily { get; set; }
    }

    public class ResidentsModel : IResidentsModel
    {
        public int Id { get; set; }
        public string? FirstName { get; set; }
        public string? MiddleName { get; set; }
        public string? LastName { get; set; }
        public string? Suffix { get; set; }
        public string? BirthDate { get; set; }
        public string? Age { get; set; }
        public string? Gender { get; set; }
        public string? civilStatus { get; set; }
        public string? Religion { get; set; }
        public string? Occupation { get; set; }
        public string? FathersName { get; set; }
        public string? MothersName { get; set; }
        public string? HeadOfFamily { get; set; }
        public string? TotalNumberOfFamily { get; set; }
        public string? EducationalAttainment { get; set; }
        public string? Purok { get; set; }
        public string? StatusType { get; set; }
    }
}
