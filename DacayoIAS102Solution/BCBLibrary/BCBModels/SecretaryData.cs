using BCBLibrary.Secretary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BCBLibrary.BCBModels
{
    public interface Isecretarydata
    {
        Task<IEnumerable<T>> LoadData<T, U>(string storedProcedure, U parameters);
    }

    public class secretarydata : Isecretarydata
    {
        private readonly IConfiguration _config;
        private readonly string _connectionId;
        public secretarydata(IConfiguration config)
        {
            _config = config;
            _connectionId = "residentsform";
        }

        public async Task<IEnumerable<T>> LoadData<T, U>(
            string storedProcedure,
            U parameters
        )
        {
            using IDbConnection connection = new SqlConnection(_config.GetConnectionString(_connectionId));
            return await connection.QueryAsync<T>(storedProcedure, parameters, commandType: CommandType.StoredProcedure);

        }
    }
}
