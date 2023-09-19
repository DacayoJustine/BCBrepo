namespace BCBLibrary.Secretary
{
    public interface IResidentsRepository
    {
        Task CreateResidents(ResidentsModel residents, CancellationToken cancellationToken = default);
        Task DeleteResidents(string id, CancellationToken cancellationToken = default);
        Task<IEnumerable<ResidentsModel>> GetResidentsById(int id, CancellationToken cancellationToken);
        Task<IEnumerable<T>> LoadData<T, U>(string storedProcedure, U parameters);
        Task SaveData<T>(string storeProcedure, T parameters);

    }

    public class ResidentsRepository : IResidentsRepository
    {
        private readonly IConfiguration _config;
        private readonly string _connectionId;
        public ResidentsRepository(IConfiguration config)
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

    public async Task SaveData<T>(
        string storeProcedure,
        T parameters
    )
        {
            using IDbConnection connection = new SqlConnection(_config.GetConnectionString(_connectionId));

            await connection.ExecuteAsync(storeProcedure, parameters, commandType: CommandType.StoredProcedure);
        }


        public async Task CreateResidents(ResidentsModel residents, CancellationToken cancellationToken = default)
        {
            cancellationToken.ThrowIfCancellationRequested();

            try
            {
                var parameters = new DynamicParameters();
                parameters.Add("@Id", residents.Id, DbType.Int32, ParameterDirection.Input);
                parameters.Add("@FirstName", residents.FirstName, DbType.String, ParameterDirection.Input);
                parameters.Add("@MiddleName", residents.MiddleName, DbType.String, ParameterDirection.Input);
                parameters.Add("@LastName", residents.LastName, DbType.String, ParameterDirection.Input);
                parameters.Add("@Suffix", residents.Suffix, DbType.String, ParameterDirection.Input);
                parameters.Add("@BirthDate", residents.BirthDate, DbType.String, ParameterDirection.Input);
                parameters.Add("@Age", residents.Age, DbType.String, ParameterDirection.Input);
                parameters.Add("@Gender", residents.Gender, DbType.String, ParameterDirection.Input);
                parameters.Add("@civilStatus", residents.civilStatus, DbType.String, ParameterDirection.Input);
                parameters.Add("@Religion", residents.Religion, DbType.String, ParameterDirection.Input);
                parameters.Add("@Occupation", residents.Occupation, DbType.String, ParameterDirection.Input);
                parameters.Add("@FathersName", residents.FathersName, DbType.String, ParameterDirection.Input);
                parameters.Add("@MothersName", residents.MothersName, DbType.String, ParameterDirection.Input);
                parameters.Add("@HeadOfFamily", residents.HeadOfFamily, DbType.String, ParameterDirection.Input);
                parameters.Add("@TotalNumberOfFamily", residents.TotalNumberOfFamily, DbType.String, ParameterDirection.Input);
                parameters.Add("@EducationalAttainment", residents.EducationalAttainment, DbType.String, ParameterDirection.Input);
                parameters.Add("@Purok", residents.Purok, DbType.String, ParameterDirection.Input);
                parameters.Add("@StatusType", residents.StatusType, DbType.String, ParameterDirection.Input);

                var connectionString = _config.GetConnectionString(_connectionId);
                using IDbConnection connection = new SqlConnection(connectionString);
                await connection.ExecuteAsync("[dbo].[CreateResidents]", parameters, commandType: CommandType.StoredProcedure);
            }
            catch (Exception)
            {
                throw;
            }
        }
        public async Task DeleteResidents(string id, CancellationToken cancellationToken = default)
        {
            cancellationToken.ThrowIfCancellationRequested();

            try
            {
                var parameters = new DynamicParameters();
                parameters.Add("@Id", id, DbType.String, ParameterDirection.Input);

                var connectionString = _config.GetConnectionString(_connectionId);
                using IDbConnection connection = new SqlConnection(connectionString);
                await connection.ExecuteAsync("[dbo].[DeleteResidents]", parameters, commandType: CommandType.StoredProcedure);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public async Task<IEnumerable<ResidentsModel>> GetResidentsById(int id, CancellationToken cancellationToken = default)
        {
            cancellationToken.ThrowIfCancellationRequested();

            try
            {
                var parameters = new DynamicParameters();
                parameters.Add("@Id", id, DbType.String, ParameterDirection.Input);

                var connectionString = _config.GetConnectionString(_connectionId);
                using IDbConnection connection = new SqlConnection(connectionString);
                return await connection.QueryAsync<ResidentsModel>("[dbo].[GetResidentsById]", parameters, commandType: CommandType.StoredProcedure);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
