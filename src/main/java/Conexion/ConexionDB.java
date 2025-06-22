package Conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionDB {

    // Datos de conexión a tu base de datos MySQL
    private static final String URL = "jdbc:mysql://localhost:3306/BancoTpIntegrador3";
    private static final String USUARIO = "root";
    private static final String PASSWORD = "root"; 
    
    

    public static Connection obtenerConexion() {
        Connection conexion = null;
        try {
           
            Class.forName("com.mysql.jdbc.Driver");
            
            conexion = DriverManager.getConnection(URL, USUARIO, PASSWORD);
            System.out.println("Conexión a la base de datos exitosa.");
        } 
        catch (ClassNotFoundException e) {
            System.err.println("Error");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Error al conectar a la base de datos: " + e.getMessage());
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

    
    
    
    
    //  ESTO ESTO ES PARA PROBAR LA CONEXION, LO PUEDEN BORRAR SI QUIEREN
    public static void main(String[] args) {
        Connection testConnection = obtenerConexion();
        if (testConnection != null) {
           
            try {
                System.out.println(" la conexion esta establecida " + testConnection.getCatalog());
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                cerrarConexion(testConnection);
            }
        } else {
            System.out.println(" Falló la conexión.");
        }
    }
    
    
    
    
    
    
}