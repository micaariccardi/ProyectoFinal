using System.Data.SqlClient;
using System.Data;
using Dapper;
using ProyectoFinal_MedLife.Models;

namespace ProyectoFinal_MedLife;

//dotnet add package Dapper; Dotnet add package System.Data.SqlClient;

public static class BD{
    private static string ConnectionString = @"Server=localhost;DataBase=MedLife;Trusted_Connection=True;";

    //Seleccionar MuestrasResultado por filtro
    public static List<MuestraResultado> SeleccionarMuestrasResultadoPorFiltro(string provincia, string hospital, string apellidoBebe, string apellidoMama, DateTime fechaDesde, DateTime fechaHasta, string ordenadoPor)
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                string sql = "SeleccionarMuestraResultadoPorFiltro"; // Nombre del procedimiento almacenado
                var parameters = new { Provincia = provincia, Hospital = hospital, ApellidoBebe= apellidoBebe, ApellidoMama = apellidoMama, Fechadesde = fechaDesde, Fechahasta = fechaHasta, OrdenadoPor = ordenadoPor };
                return db.Query<MuestraResultado>(sql, parameters, commandType: CommandType.StoredProcedure).AsList();
            }
        }

    // Método para seleccionar todos los hospitales 
        public static List<Hospital> SeleccionarHospitales()
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                string sql = "SeleccionarHospitales"; 

                return db.Query<Hospital>(sql, commandType: CommandType.StoredProcedure).AsList();
            }
        }

        public static List<Perfil> SeleccionarPerfiles()
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                string sql = "SeleccionarPerfiles"; 
                return db.Query<Perfil>(sql, commandType: CommandType.StoredProcedure).AsList();
            }
        }
        public static List<string> SeleccionarEmailsPorHospital(int idHospital)
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                string sql = "SeleccionarEmailsPorHospital"; 
                var parameters = new { idHospital = idHospital }; 
                return db.Query<string>(sql, parameters, commandType: CommandType.StoredProcedure).AsList();
            }
        }
        public static List<string> SeleccionarReferentesPorHospital(int idHospital)
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                string sql = "SeleccionarReferentesPorHospital";
                var parameters = new { idHospital = idHospital }; 
                return db.Query<string>(sql, parameters, commandType: CommandType.StoredProcedure).AsList();
            }
        }

    // Método para seleccionar un hospital por su Id
        public static Hospital SeleccionarHospitalPorId(int idHospital)
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                string sql = "SeleccionarHospitalPorId";
                var parameters = new { IdHospital = idHospital };

                return db.QueryFirstOrDefault<Hospital>(sql, parameters, commandType: CommandType.StoredProcedure);
            }
        }
    
        // Método para seleccionar un hospital por su nombre
        public static Hospital SeleccionarHospitalPorNombre(string nombreHospital)
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                string sql = "SeleccionarHospitalPorNombre"; // Nombre del procedimiento almacenado
                var parameters = new { NombreHospital = nombreHospital };

                return db.QueryFirstOrDefault<Hospital>(sql, parameters, commandType: CommandType.StoredProcedure);
            }
        }

        // Método para seleccionar una muestra por su Id
        public static Muestra SeleccionarMuestraPorId(int idMuestra)
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                string sql = "SeleccionarMuestraPorId"; // Nombre del procedimiento almacenado
                var parameters = new { IdMuestra = idMuestra };

                return db.QueryFirstOrDefault<Muestra>(sql, parameters, commandType: CommandType.StoredProcedure);
            }
        }

        // Método para seleccionar pacientes por filtros
        public static List<Paciente> SeleccionarPacientesPorFiltros(string provincia, string hospital, string apellido, string nombre, DateTime fechaRegistroDesde, DateTime fechaRegistroHasta)
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                string sql = "SeleccionarPacientesPorFiltros"; // Nombre del procedimiento almacenado
                var parameters = new
                {
                    Provincia = provincia,
                    Hospital = hospital,
                    Apellido = apellido,
                    Nombre = nombre,
                    FechaRegistroDesde = fechaRegistroDesde,
                    FechaRegistroHasta = fechaRegistroHasta
                };

                return db.Query<Paciente>(sql, parameters, commandType: CommandType.StoredProcedure).AsList();
            }
        }

        // Método para buscar un perfil por su Id
        public static Perfil BuscarPerfilPorId(int idPerfil)
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                string sql = "SeleccionarPerfilPorId"; // Nombre del procedimiento almacenado
                var parameters = new { IdPerfil = idPerfil };

                return db.QueryFirstOrDefault<Perfil>(sql, parameters, commandType: CommandType.StoredProcedure);
            }
        }

        // Método para crear un perfil
        public static void CrearPerfil(Perfil miPerfil)
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                string sql = "CrearPerfil"; 
                var parameters = miPerfil;

                db.QueryFirstOrDefault<Perfil>(sql, parameters, commandType: CommandType.StoredProcedure);
            }
        }

        // Método para seleccionar perfiles 


        // public static List<Hospital> SeleccionarPerfiles()
        // {
        //     using (SqlConnection db = new SqlConnection(ConnectionString))
        //     {
        //         string sql = "SeleccionarPerfiles"; 
        //         return db.Query<Perfil>(sql, commandType: CommandType.StoredProcedure).AsList();
        //     }
        // }



    //......Actualizar

        // Método para actualizar una muestra en la base de datos
        public static void ActualizarMuestra(int idMuestra, string firmaSello)
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                string sql = "ActualizarMuestraFirma"; // Nombre del procedimiento almacenado
                var parameters = new
                {
                    IdMuestra = idMuestra,
                    FirmaSello = firmaSello
                };

                db.Execute(sql, parameters, commandType: CommandType.StoredProcedure);
            }
        }

    //Eliminar

        // Método para eliminar un hospital de la base de datos
        public static void EliminarHospital(int idHospital)
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                string sql = "EliminarHospital"; // Nombre del procedimiento almacenado
                var parameters = new { IdHospital = idHospital };

                db.Execute(sql, parameters, commandType: CommandType.StoredProcedure);
            }
        }


        // Método para eliminar una muestra de la base de datos
        public static void EliminarMuestra(int idMuestra)
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                string sql = "EliminarMuestra"; // Nombre del procedimiento almacenado
                var parameters = new { IdMuestra = idMuestra };

                db.Execute(sql, parameters, commandType: CommandType.StoredProcedure);
            }
        }


        // Método para eliminar una muestra y su resultado de la base de datos
        public static void EliminarMuestraYResultado(int idMuestra)
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                string sql = "EliminarMuestraYResultado"; // Nombre del procedimiento almacenado
                var parameters = new { IdMuestra = idMuestra };

                db.Execute(sql, parameters, commandType: CommandType.StoredProcedure);
            }
        }


        // Método para eliminar un paciente de la base de datos
        public static void EliminarPaciente(int idPaciente)
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                string sql = "EliminarPaciente";
                var parameters = new { IdPaciente = idPaciente };

                db.Execute(sql, parameters, commandType: CommandType.StoredProcedure);
            }
        }

    
    //Insertar

        public static void InsertarHospital(Hospital hospital)
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                string sql = "InsertarHospital";
                var parameters = new
                {
                    NombreHospital = hospital.NombreHospital,
                    Email1 = hospital.EmailsRef[0],
                    Email2 = hospital.EmailsRef[1],
                    Email3 = hospital.EmailsRef[2],
                    Email4 = hospital.EmailsRef[3],
                    Email5 = hospital.EmailsRef[4],
                    Referente1 = hospital.Referentes[0],
                    Referente2 = hospital.Referentes[1],
                    Referente3 = hospital.Referentes[2],
                    Referente4 = hospital.Referentes[3],
                    Referente5 = hospital.Referentes[4],
                    Tel1 = hospital.TelefonosRef[0],
                    Tel2 = hospital.TelefonosRef[1],
                    Tel3 = hospital.TelefonosRef[2],
                    Tel4 = hospital.TelefonosRef[3],
                    Tel5 = hospital.TelefonosRef[4],
                    Direccion = hospital.Direccion,
                    Localidad = hospital.Localidad,
                    Provincia = hospital.Provincia,
                    Telefono = hospital.Telefono,
                    Responsable = hospital.Responsable,
                    Servicio = hospital.Servicio
                };

                db.Execute(sql, parameters, commandType: CommandType.StoredProcedure);
            }
        }

    // Método para insertar una nueva muestra en la base de datos
        public static int InsertarMuestra( string institucionNacimiento, int idHospitalMuestra,
            string apellidoBebe, string nombreBebe, DateTime fechaHoraNacimiento, DateTime fechaHoraExtraccion,
            string sexo, string alimentacion, DateTime fechaIngestaLeche, int semanasGestacion, int peso,
            string condicionRN, string patologiaBase, string patologia, string parto, bool embarazoMultiple, bool embarazoGemelar,
            string apellidoMama, string nombreMama, int documento, string domicilio, string localidad,
            int telefono, string lugarControlEmbarazo, bool antibioticos, bool desinfectantesYodados,
            bool transfusion, DateTime fechaTransfusion, bool dopamina, bool dobutamina, bool corticoidesMadre,
            bool corticoidesBebe, bool tiroidepatias, string otras, bool repiteMuestra, bool prematuro,
            bool malaMuestra, bool resultadoAlterado, bool analitico, string responsable, string rolResponsable, 
            DateTime fechaEnvio, DateTime fechaLlegada, string observaciones)
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                string sql = "InsertarMuestra";
                var parameters = new
                {
                    InstitucionNacimiento = institucionNacimiento,
                    IdHospitalMuestra = idHospitalMuestra,
                    ApellidoBebe = apellidoBebe,
                    NombreBebe = nombreBebe,
                    FechaHoraNacimiento = fechaHoraNacimiento,
                    FechaHoraExtraccion = fechaHoraExtraccion,
                    Sexo = sexo,
                    Alimentacion = alimentacion,
                    FechaIngestaLeche = fechaIngestaLeche,
                    SemanasGestacion = semanasGestacion,
                    Peso = peso,
                    CondicionRN = condicionRN,
                    PatologiaBase = patologiaBase,
                    Patologia = patologia,
                    Parto = parto,
                    EmbarazoMultiple = embarazoMultiple,
                    EmbarazoGemelar = embarazoGemelar,
                    ApellidoMama = apellidoMama,
                    NombreMama = nombreMama,
                    Documento = documento,
                    Domicilio = domicilio,
                    Localidad = localidad,
                    Telefono = telefono,
                    LugarControlEmbarazo = lugarControlEmbarazo,
                    Antibioticos = antibioticos,
                    DesinfectantesYodados = desinfectantesYodados,
                    Transfusion = transfusion,
                    FechaTransfusion = fechaTransfusion,
                    Dopamina = dopamina,
                    Dobutamina = dobutamina,
                    CorticoidesMadre = corticoidesMadre,
                    CorticoidesBebe = corticoidesBebe,
                    Tiroidepatias = tiroidepatias,
                    Otras = otras,
                    RepiteMuestra = repiteMuestra,
                    Prematuro = prematuro,
                    MalaMuestra = malaMuestra,
                    ResultadoAlterado = resultadoAlterado,
                    Analitico = analitico,
                    Responsable = responsable,
                    RolResponsable = rolResponsable,
                    FechaEnvio = fechaEnvio,
                    FechaLlegada = fechaLlegada,
                    FirmaSello = "null",
                    ObservacionesMuestra = observaciones
                };

                db.Execute(sql, parameters, commandType: CommandType.StoredProcedure);

                string query = "SELECT TOP(1) IdMuestra FROM Muestra ORDER BY IdMuestra DESC"; // Consulta que quieres usar
                object result;
                int  resultado = 0;
                using (var connection = new SqlConnection(db.ConnectionString))
                {
                    connection.Open();

                    using (var command = new SqlCommand(query, connection))
                    {
                        result = command.ExecuteScalar();
                        resultado = ( result!= null) ? Convert.ToInt32(result) : 0; // Devuelve 0 si no hay resultado
                    }
                }

                return resultado;

            }
        }


        // Método para insertar una nueva muestra y su resultado en la base de datos
        public static void InsertarMuestraYResultado(string institucionNacimiento, int idHospitalMuestra,
            string apellidoBebe, string nombreBebe, DateTime fechaHoraNacimiento, DateTime fechaHoraExtraccion,
            string sexo, string alimentacion, DateTime fechaIngestaLeche, int semanasGestacion, int peso,
            string condicionRN, string patologiaBase, string parto, bool embarazoMultiple, bool embarazoGemelar,
            string apellidoMama, string nombreMama, int documento, string domicilio, string localidad,
            int telefono, string lugarControlEmbarazo, bool antibioticos, bool desinfectantesYodados,
            bool transfusion, DateTime fechaTransfusion, bool dopamina, bool dobutamina, bool corticoidesMadre,
            bool corticoidesBebe, bool tiroidepatias, string otras, bool repiteMuestra, bool prematuro,
            bool malaMuestra, bool resultadoAlterado, int analitico, string responsable, string rolResponsable,
            string firmaSello, DateTime fechaEnvio, DateTime fechaLlegada, string observaciones,
            string tshNeonatal, string metodologiaTsh, string fenilanina, string metodologiaFenilanina,
            string irtNeonatal, string metodologiaIrt, string galactosa, string metodologiaGalactosa,
            string hidroxiprogesterona, string metodologiaHidro, string biotinidasa, string metodologiaBiotinidasa,
            string normalidadTsh, string normalidadFenilanina, string normalidadIrt, string normalidadGalactosa,
            string normalidadHidro, string normalidadBiotinidasa, string observacionesResultado)
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                string sql = "InsertarMuestraYResultado"; // Nombre del procedimiento almacenado
                var parameters = new
                {
                    InstitucionNacimiento = institucionNacimiento,
                    IdHospitalMuestra = idHospitalMuestra,
                    ApellidoBebe = apellidoBebe,
                    NombreBebe = nombreBebe,
                    FechaHoraNacimiento = fechaHoraNacimiento,
                    FechaHoraExtraccion = fechaHoraExtraccion,
                    Sexo = sexo,
                    Alimentacion = alimentacion,
                    FechaIngestaLeche = fechaIngestaLeche,
                    SemanasGestacion = semanasGestacion,
                    Peso = peso,
                    CondicionRN = condicionRN,
                    PatologiaBase = patologiaBase,
                    Parto = parto,
                    EmbarazoMultiple = embarazoMultiple,
                    EmbarazoGemelar = embarazoGemelar,
                    ApellidoMama = apellidoMama,
                    NombreMama = nombreMama,
                    Documento = documento,
                    Domicilio = domicilio,
                    Localidad = localidad,
                    Telefono = telefono,
                    LugarControlEmbarazo = lugarControlEmbarazo,
                    Antibioticos = antibioticos,
                    DesinfectantesYodados = desinfectantesYodados,
                    Transfusion = transfusion,
                    FechaTransfusion = fechaTransfusion,
                    Dopamina = dopamina,
                    Dobutamina = dobutamina,
                    CorticoidesMadre = corticoidesMadre,
                    CorticoidesBebe = corticoidesBebe,
                    Tiroidepatias = tiroidepatias,
                    Otras = otras,
                    RepiteMuestra = repiteMuestra,
                    Prematuro = prematuro,
                    MalaMuestra = malaMuestra,
                    ResultadoAlterado = resultadoAlterado,
                    Analitico = analitico,
                    Responsable = responsable,
                    RolResponsable = rolResponsable,
                    FirmaSello = firmaSello,
                    FechaEnvio = fechaEnvio,
                    FechaLlegada = fechaLlegada,
                    Observaciones = observaciones,
                    TshNeonatal = tshNeonatal,
                    MetodologiaTsh = metodologiaTsh,
                    Fenilanina = fenilanina,
                    MetodologiaFenilanina = metodologiaFenilanina,
                    IrtNeonatal = irtNeonatal,
                    MetodologiaIrt = metodologiaIrt,
                    Galactosa = galactosa,
                    MetodologiaGalactosa = metodologiaGalactosa,
                    Hidroxiprogesterona = hidroxiprogesterona,
                    MetodologiaHidro = metodologiaHidro,
                    Biotinidasa = biotinidasa,
                    MetodologiaBiotinidasa = metodologiaBiotinidasa,
                    NormalidadTsh = normalidadTsh,
                    NormalidadFenilanina = normalidadFenilanina,
                    NormalidadIrt = normalidadIrt,
                    NormalidadGalactosa = normalidadGalactosa,
                    NormalidadHidro = normalidadHidro,
                    NormalidadBiotinidasa = normalidadBiotinidasa,
                    ObservacionesResultado = observacionesResultado
                };

                db.Execute(sql, parameters, commandType: CommandType.StoredProcedure);
            }
        }

        // Método para insertar un nuevo paciente en la base de datos
        public static void InsertarPaciente(int idMuestra, int acta, int hc, int? idGarrahan, DateTime fechaEnvio, DateTime? fechaLlegada)
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                string sql = "InsertarPaciente"; // Nombre del procedimiento almacenado
                var parameters = new
                {
                    IdMuestra = idMuestra,
                    Acta = acta,
                    Hc = hc,
                    IdGarrahan = idGarrahan,
                    FechaEnvio = fechaEnvio,
                    FechaLlegada = fechaLlegada
                };

                db.Execute(sql, parameters, commandType: CommandType.StoredProcedure);
            }
        }





}