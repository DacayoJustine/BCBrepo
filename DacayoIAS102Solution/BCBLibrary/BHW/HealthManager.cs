namespace BCBLibrary.BHW
{
    public interface IHealthManager
    {
        Task CreateHealthProfile(HealthModel health, CancellationToken cancellationToken = default);
    }

    public class HealthManager : IHealthManager
    {
        private readonly IHealthStore _healthStore;
        public HealthManager(IHealthStore healthStore)
        {
            _healthStore = healthStore;

        }

        public async Task CreateHealthProfile(HealthModel health, CancellationToken cancellationToken = default)
        => await _healthStore.CreateHealthProfile(health, cancellationToken);



    }
}
