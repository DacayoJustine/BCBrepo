namespace BCBLibrary.Secretary
{

    public interface IResidentsStore
    {
        Task CreateResidents(ResidentsModel residents, CancellationToken cancellationToken = default);
        Task DeleteResidents(string id, CancellationToken cancellationToken = default);
        Task<IEnumerable<ResidentsModel>> GetAllResidents();
        Task<IEnumerable<ResidentsModel>> GetResidentsById(int id, CancellationToken cancellationToken = default);
    }

    public class ResidentsStore : IResidentsStore
    {
        private readonly IResidentsRepository _repo;

        public ResidentsStore(IResidentsRepository repo)
        {
            _repo = repo;
        }
        public Task<IEnumerable<ResidentsModel>> GetAllResidents() =>
            _repo.LoadData<ResidentsModel, dynamic>("dbo.GetAllResidents", new { });

        public Task UpdateResidents(ResidentsModel _residents) =>
        _repo.SaveData("dbo.UpdateResidents", new
        {
             Id = _residents.Id,
             FirstName = _residents.FirstName,
             MiddleName = _residents.MiddleName,
             LastName = _residents.LastName,
             Suffix = _residents.Suffix,
             BirthDate = _residents.BirthDate,
             Age = _residents.Age,
             Gender = _residents.Gender,
             civilStatus = _residents.civilStatus,
             Religion = _residents.Religion,
             Occupation = _residents.Occupation,
             FathersName = _residents.FathersName,
             MothersName = _residents.MothersName,
             HeadOfFamily = _residents.HeadOfFamily,
             TotalNumberOfFamily = _residents.TotalNumberOfFamily,
             EducationalAttainment = _residents.EducationalAttainment,
             Purok = _residents.Purok,
             StatusType = _residents.StatusType
        });



        public async Task CreateResidents(ResidentsModel residents, CancellationToken cancellationToken = default)
        {
            await _repo.CreateResidents(residents, cancellationToken);
        }
        public async Task DeleteResidents(string id, CancellationToken cancellationToken = default)
        {
            await _repo.DeleteResidents(id, cancellationToken);
        }

        public async Task<IEnumerable<ResidentsModel>> GetResidentsById(int id, CancellationToken cancellationToken = default)
        {
            return await _repo.GetResidentsById(id, cancellationToken);
        }



    }
}
