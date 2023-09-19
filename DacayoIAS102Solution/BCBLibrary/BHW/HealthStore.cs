namespace BCBLibrary.BHW
{
    public interface IHealthStore
    {
        Task CreateHealthProfile(HealthModel health, CancellationToken cancellationToken = default);
    }

    public class HealthStore : IHealthStore
    {
        private readonly IHealthRepository _repo;

        public HealthStore(IHealthRepository repo)
        {
            _repo = repo;
        }

        public async Task CreateHealthProfile(HealthModel health, CancellationToken cancellationToken = default)
        {
            await _repo.CreateHealthProfile(health, cancellationToken);
        }
    }
}
