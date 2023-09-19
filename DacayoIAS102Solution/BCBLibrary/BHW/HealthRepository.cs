namespace BCBLibrary.BHW
{
    public interface IHealthRepository
    {
        Task CreateHealthProfile(HealthModel health, CancellationToken cancellationToken = default);
        Task<IEnumerable<T>> LoadData<T, U>(string storedProcedure, U parameters);
    }

    public class HealthRepository : IHealthRepository
    {
        private readonly IConfiguration _config;
        private readonly string _connectionId;
        public HealthRepository(IConfiguration config)
        {
            _config = config;
            _connectionId = "DefaultConnection";
        }

        public async Task<IEnumerable<T>> LoadData<T, U>(
            string storedProcedure,
            U parameters
                )
        {
            using IDbConnection connection = new SqlConnection(_config.GetConnectionString(_connectionId));
            return await connection.QueryAsync<T>(storedProcedure, parameters, commandType: CommandType.StoredProcedure);

        }

        public async Task CreateHealthProfile(HealthModel health, CancellationToken cancellationToken = default)
        {
            cancellationToken.ThrowIfCancellationRequested();

            try
            {
                var parameters = new DynamicParameters();
                parameters.Add("@Id", health.Id, DbType.String, ParameterDirection.Input);
                parameters.Add("@FirstName", health.FirstName, DbType.String, ParameterDirection.Input);
                parameters.Add("@MiddleName", health.MiddleName, DbType.String, ParameterDirection.Input);
                parameters.Add("@LastName", health.LastName, DbType.String, ParameterDirection.Input);
                parameters.Add("@Suffix", health.Suffix, DbType.String, ParameterDirection.Input);
                parameters.Add("@BirthDate", health.BirthDate, DbType.String, ParameterDirection.Input);
                parameters.Add("@Age", health.Age, DbType.String, ParameterDirection.Input);
                parameters.Add("@Gender", health.Gender, DbType.String, ParameterDirection.Input);
                parameters.Add("@civilStatus", health.civilStatus, DbType.String, ParameterDirection.Input);
                parameters.Add("@Religion", health.Religion, DbType.String, ParameterDirection.Input);
                parameters.Add("@Occupation", health.Occupation, DbType.String, ParameterDirection.Input);
                parameters.Add("@FathersName", health.FathersName, DbType.String, ParameterDirection.Input);
                parameters.Add("@MothersName", health.MothersName, DbType.String, ParameterDirection.Input);
                parameters.Add("@HeadOfFamily", health.HeadOfFamily, DbType.String, ParameterDirection.Input);
                parameters.Add("@TotalNumberOfFamily", health.TotalNumberOfFamily, DbType.String, ParameterDirection.Input);
                parameters.Add("@EducationalAttainment", health.EducationalAttainment, DbType.String, ParameterDirection.Input);
                parameters.Add("@Purok", health.Purok, DbType.String, ParameterDirection.Input);
                parameters.Add("@PWD", health.PWD, DbType.String, ParameterDirection.Input);
                parameters.Add("@Prenatal", health.Prenatal, DbType.String, ParameterDirection.Input);
                parameters.Add("@TypeOfIllness", health.TypeOfIllness, DbType.String, ParameterDirection.Input);
                parameters.Add("@Immunation", health.Immunation, DbType.String, ParameterDirection.Input);
                parameters.Add("@Weight", health.Weight, DbType.String, ParameterDirection.Input);
                parameters.Add("@Height", health.Height, DbType.String, ParameterDirection.Input);
                parameters.Add("@Temperature", health.Temperature, DbType.String, ParameterDirection.Input);
                parameters.Add("@BloodPressure", health.BloodPressure, DbType.String, ParameterDirection.Input);
                parameters.Add("@Medicine", health.Medicine, DbType.String, ParameterDirection.Input);

                var connectionString = _config.GetConnectionString(_connectionId);
                using IDbConnection connection = new SqlConnection(connectionString);
                await connection.ExecuteAsync("[dbo].[CreateHealthProfile]", parameters, commandType: CommandType.StoredProcedure);
            }
            catch (Exception)
            {
                throw;
            }
        }

    }
}
