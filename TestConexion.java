import Conexion.ConexionDB;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class TestConexion {
    
    public static void main(String[] args) {
        System.out.println("=== PRUEBA DE CONEXIÓN A LA BASE DE DATOS ===");
        
        Connection conexion = null;
        try {
            // Intentar conectar
            conexion = ConexionDB.obtenerConexion();
            
            if (conexion != null) {
                System.out.println("✅ Conexión exitosa!");
                System.out.println("Base de datos: " + conexion.getCatalog());
                
                // Probar una consulta simple
                Statement stmt = conexion.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT COUNT(*) as total FROM Usuario");
                
                if (rs.next()) {
                    int totalUsuarios = rs.getInt("total");
                    System.out.println("✅ Usuarios en la base de datos: " + totalUsuarios);
                }
                
                // Probar consulta de tipos de usuario
                rs = stmt.executeQuery("SELECT * FROM TipoUsuario");
                System.out.println("✅ Tipos de usuario disponibles:");
                while (rs.next()) {
                    System.out.println("   - ID: " + rs.getInt("IdTipoUsuario") + 
                                     ", Descripción: " + rs.getString("Descripcion"));
                }
                
                rs.close();
                stmt.close();
                
            } else {
                System.out.println("❌ No se pudo establecer la conexión");
            }
            
        } catch (SQLException e) {
            System.err.println("❌ Error en la consulta: " + e.getMessage());
            e.printStackTrace();
        } finally {
            ConexionDB.cerrarConexion(conexion);
        }
        
        System.out.println("=== FIN DE LA PRUEBA ===");
    }
} 