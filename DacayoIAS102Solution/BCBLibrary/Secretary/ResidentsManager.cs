namespace BCBLibrary.Secretary
{
    public class ResidentsManager : IResidentsStore
    {
        private readonly IResidentsStore _residentsStore;
        public ResidentsManager(IResidentsStore residentsStore)
        {
            _residentsStore = residentsStore;

        }

        public async Task CreateResidents(ResidentsModel residents, CancellationToken cancellationToken = default)
        {
            await _residentsStore.CreateResidents(residents, cancellationToken);
        }

        public async Task DeleteResidents(string id, CancellationToken cancellationToken = default)
        => await _residentsStore.DeleteResidents(id, cancellationToken);

        public async Task<IEnumerable<ResidentsModel>> GetAllResidents()
        {
            return await _residentsStore.GetAllResidents();
        }
        public async Task<IEnumerable<ResidentsModel>> GetResidentsById(int id, CancellationToken cancellationToken = default)
        {
            return await _residentsStore.GetResidentsById(id, cancellationToken);
        }


    }
}
