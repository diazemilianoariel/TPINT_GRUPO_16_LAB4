package Conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionDB {

    // Datos de conexión a tu base de datos MySQL 5.1.47
    private static final String URL = "jdbc:mysql://localhost:3306/BancoTpIntegrador3";
    private static final String USUARIO = "root";
    private static final String PASSWORD = "root"; 
    
    public static Connection obtenerConexion() {
        Connection conexion = null;
        try {
            // Driver para MySQL 5.x
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection(URL, USUARIO, PASSWORD);
            System.out.println("Conexión a la base de datos exitosa.");
        } 
        catch (ClassNotFoundException e) {
            System.err.println("Error: No se pudo cargar el driver de MySQL 5.1.47");
            System.err.println("Asegúrate de que el .jar esté en el Build Path y en WEB-INF/lib");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Error al conectar a la base de datos: " + e.getMessage());
            System.err.println("Verifica que:");
            System.err.println("1. MySQL esté ejecutándose en localhost:3306");
            System.err.println("2. La base de datos 'BancoTpIntegrador3' exista");
            System.err.println("3. El usuario 'root' tenga permisos");
            System.err.println("4. La contraseña sea correcta");
            e.printStackTrace();
        }
        return conexion;
    }

    public static void cerrarConexion(Connection conexion) {
        if (conexion != null) {
            try {
                conexion.close();
                System.out.println("Conexión a la base de datos cerrada.");
            } catch (SQLException e) {
                System.err.println("Error al cerrar la conexión: " + e.getMessage());
                e.printStackTrace();
            }
        }
    }

    // Método main para probar la conexión manualmente
    public static void main(String[] args) {
        Connection testConnection = obtenerConexion();
        if (testConnection != null) {
            try {
                System.out.println("La conexión está establecida con la base: " + testConnection.getCatalog());
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                cerrarConexion(testConnection);
            }
        } else {
            System.out.println("Falló la conexión.");
        }
    }
}