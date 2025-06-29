package ImplementacionDao; // Coincide con tu paquete 'ImplementacionDao'

import InterfazDao.IUsuarioDAO;
import Entidades.TipoUsuario;   // Las entidades están en tu paquete 'Entidades'
import Entidades.Usuario;       // Las entidades están en tu paquete 'Entidades'
import Conexion.ConexionDB;     // La clase de conexión está en tu paquete 'Conexion'

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * Implementación JDBC de la interfaz IUsuariosDAO.
 * Proporciona la lógica para interactuar con la tabla 'Usuarios' en la base de datos.
 */
public class UsuarioDAO implements IUsuarioDAO {

   
    public Usuario obtenerUsuarioPorCredenciales(String nombreUsuario, String password) {
        Usuario usuarios = null; // Objeto a retornar
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

       
        String sql = "SELECT u.IdUsuario, u.NombreUsuario, u.Password, u.Estado, " +
                     "tu.IdTipoUsuario, tu.Descripcion AS TipoUsuarioDescripcion " +
                     "FROM Usuario u JOIN TipoUsuario tu ON u.IdTipoUsuario = tu.IdTipoUsuario " +
                     "WHERE u.NombreUsuario = ? AND u.Password = ? AND u.Estado = TRUE";

        try {
            System.out.println("Intentando conectar a la base de datos...");
            con = ConexionDB.obtenerConexion(); 
            
            if (con == null) {
                System.err.println("ERROR: La conexión es null. No se pudo conectar a la base de datos.");
                System.err.println("Verifica que:");
                System.err.println("1. MySQL esté ejecutándose");
                System.err.println("2. La base de datos 'BancoTpIntegrador3' exista");
                System.err.println("3. Las credenciales sean correctas");
                return null;
            }
            
            System.out.println("Conexión exitosa, preparando consulta...");
            ps = con.prepareStatement(sql);
            ps.setString(1, nombreUsuario);
            ps.setString(2, password);
            System.out.println("Ejecutando consulta para usuario: " + nombreUsuario);
            rs = ps.executeQuery(); 

            if (rs.next()) { 
                System.out.println("Usuario encontrado en la base de datos");
                usuarios = new Usuario(); 
                usuarios.setIdUsuario(rs.getInt("IdUsuario"));
                usuarios.setNombreUsuario(rs.getString("NombreUsuario"));
                usuarios.setPassword(rs.getString("Password")); 
                usuarios.setEstado(rs.getBoolean("Estado")); 

               
                TipoUsuario tiposUsuario = new TipoUsuario(
                    rs.getInt("IdTipoUsuario"),
                    rs.getString("TipoUsuarioDescripcion")
                );
                usuarios.setTipoUsuario(tiposUsuario);
                System.out.println("Usuario autenticado: " + usuarios.getNombreUsuario() + 
                                 " (Tipo: " + usuarios.getTipoUsuario().getDescripcion() + ")");
            } else {
                System.out.println("No se encontró usuario con las credenciales proporcionadas");
            }
        } catch (SQLException e) {
            System.err.println("Error SQL al obtener usuario por credenciales: " + e.getMessage());
            System.err.println("SQL State: " + e.getSQLState());
            System.err.println("Error Code: " + e.getErrorCode());
            e.printStackTrace();
           
        } finally {
           
            ConexionDB.cerrarConexion(con);
        }
        return usuarios;
    }
    
    
    
    

    public int insertarUsuario(Usuario usuario) {
        int idGenerado = -1;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

       
        String sql = "INSERT INTO Usuario (NombreUsuario, Password, IdTipoUsuario, Estado) " +
                     "VALUES (?, ?, ?, ?)";

        try {
            con = ConexionDB.obtenerConexion();
            
            ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            ps.setString(1, usuario.getNombreUsuario());
            ps.setString(2, usuario.getPassword());
            ps.setInt(3, usuario.getTipoUsuario().getIdTipoUsuario()); 
            ps.setBoolean(4, usuario.isEstado());

            int filasAfectadas = ps.executeUpdate();

            if (filasAfectadas > 0) {
                rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    idGenerado = rs.getInt(1); 
                }
            }
        } catch (SQLException e) {
            System.err.println("Error SQL al insertar usuario: " + e.getMessage());
            e.printStackTrace();
        } finally {
            ConexionDB.cerrarConexion(con);
        }
        return idGenerado;
    }

    public boolean actualizarUsuario(Usuario usuario) {
        boolean exito = false;
        Connection con = null;
        PreparedStatement ps = null;

        
        String sql = "UPDATE Usuario SET NombreUsuario = ?, Password = ?, IdTipoUsuario = ?, Estado = ? " +
                     "WHERE IdUsuario = ?";

        try {
            con = ConexionDB.obtenerConexion();
            ps = con.prepareStatement(sql);

            ps.setString(1, usuario.getNombreUsuario());
            ps.setString(2, usuario.getPassword());
            ps.setInt(3, usuario.getTipoUsuario().getIdTipoUsuario());
            ps.setBoolean(4, usuario.isEstado());
            ps.setInt(5, usuario.getIdUsuario()); 

            int filasAfectadas = ps.executeUpdate();
            if (filasAfectadas > 0) {
                exito = true; 
            }
        } catch (SQLException e) {
            System.err.println("Error SQL al actualizar usuario: " + e.getMessage());
            e.printStackTrace();
        } finally {
            ConexionDB.cerrarConexion(con);
        }
        return exito;
    }

    public boolean actualizarEstadoUsuario(int idUsuario, boolean estadoActivo) {
        boolean exito = false;
        Connection con = null;
        PreparedStatement ps = null;

        
        String sql = "UPDATE Usuario SET Estado = ? WHERE IdUsuario = ?";

        try {
            con = ConexionDB.obtenerConexion();
            ps = con.prepareStatement(sql);
            ps.setBoolean(1, estadoActivo); 
            ps.setInt(2, idUsuario);    

            int filasAfectadas = ps.executeUpdate();
            if (filasAfectadas > 0) {
                exito = true;
            }
        } catch (SQLException e) {
            System.err.println("Error SQL al actualizar estado de usuario: " + e.getMessage());
            e.printStackTrace();
        } finally {
            ConexionDB.cerrarConexion(con);
        }
        return exito;
    }

    public Usuario obtenerUsuarioPorID(int idUsuario) {
        Usuario usuario = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

       
        String sql = "SELECT u.IdUsuario, u.NombreUsuario, u.Password, u.Estado, " +
                     "tu.IdTipoUsuario, tu.Descripcion AS TipoUsuarioDescripcion " +
                     "FROM Usuario u JOIN TipoUsuario tu ON u.IdTipoUsuario = tu.IdTipoUsuario " +
                     "WHERE u.IdUsuario = ?";

        try {
            con = ConexionDB.obtenerConexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idUsuario);
            rs = ps.executeQuery();

            if (rs.next()) {
                usuario = new Usuario();
                usuario.setIdUsuario(rs.getInt("IdUsuario"));
                usuario.setNombreUsuario(rs.getString("NombreUsuario"));
                usuario.setPassword(rs.getString("Password"));
                usuario.setEstado(rs.getBoolean("Estado"));

                TipoUsuario tiposUsuario = new TipoUsuario(
                    rs.getInt("IdTipoUsuario"),
                    rs.getString("TipoUsuarioDescripcion")
                );
                usuario.setTipoUsuario(tiposUsuario);
            }
        } catch (SQLException e) {
            System.err.println("Error SQL al obtener usuario por ID: " + e.getMessage());
            e.printStackTrace();
        } finally {
            ConexionDB.cerrarConexion(con);
        }
        return usuario;
    }

    public List<Usuario> obtenerTodosLosUsuarios() {
        List<Usuario> listaUsuarios = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

       
        String sql = "SELECT u.IdUsuario, u.NombreUsuario, u.Password, u.Estado, " +
                     "tu.IdTipoUsuario, tu.Descripcion AS TipoUsuarioDescripcion " +
                     "FROM Usuario u JOIN TipoUsuario tu ON u.IdTipoUsuario = tu.IdTipoUsuario";

        try {
            con = ConexionDB.obtenerConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) { 
                Usuario usuario = new Usuario();
                usuario.setIdUsuario(rs.getInt("IdUsuario"));
                usuario.setNombreUsuario(rs.getString("NombreUsuario"));
                usuario.setPassword(rs.getString("Password"));
                usuario.setEstado(rs.getBoolean("Estado"));

                TipoUsuario tiposUsuario = new TipoUsuario(
                    rs.getInt("IdTipoUsuario"),
                    rs.getString("TipoUsuarioDescripcion")
                );
                usuario.setTipoUsuario(tiposUsuario);

                listaUsuarios.add(usuario); 
            }
        } catch (SQLException e) {
            System.err.println("Error SQL al obtener todos los usuarios: " + e.getMessage());
            e.printStackTrace();
        } finally {
            ConexionDB.cerrarConexion(con);
        }
        return listaUsuarios;
    }




}
