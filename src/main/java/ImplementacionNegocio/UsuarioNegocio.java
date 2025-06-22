package ImplementacionNegocio; // Coincide con tu paquete 'ImplementacionNegocio'

import InterfazNegocio.IUsuarioNegocio; // La interfaz de negocio
import InterfazDao.IUsuarioDAO;       // ¡CORREGIDO! Interfaz para 'Usuario' (singular)
import ImplementacionDao.UsuarioDAO;  // ¡CORREGIDO! Implementación para 'Usuario' (singular)
import Entidades.Usuario;             // ¡CORREGIDO! La entidad 'Usuario' (singular)

// Importa las excepciones personalizadas que hayas creado
// import Excepciones.AutenticacionFallidaException;

/**
 * Implementación de la lógica de negocio para la entidad Usuario.
 * Se encarga de validar datos, aplicar reglas de negocio y coordinar las operaciones con la capa DAO.
 */
public class UsuarioNegocio implements IUsuarioNegocio { // El nombre de esta clase de negocio puede seguir siendo plural si así lo prefieres para la capa de negocio

    private IUsuarioDAO usuarioDAO; // ¡CORREGIDO! Ahora referencia a la interfaz de Usuario (singular)

    /**
     * Constructor que inicializa el DAO.
     */
    public UsuarioNegocio() {
        this.usuarioDAO = new UsuarioDAO(); // ¡CORREGIDO! Se crea una instancia de la implementación de UsuarioDAO (singular)
    }

    /**
     * Autentica un usuario verificando sus credenciales y su estado de actividad.
     * @param nombreUsuario El nombre de usuario ingresado.
     * @param password La contraseña ingresada.
     * @return El objeto Usuario autenticado si las credenciales son válidas y el usuario está activo.
     * @throws IllegalArgumentException Si los campos de usuario o contraseña son inválidos (ej. vacíos).
     * @throws RuntimeException Si las credenciales son incorrectas, el usuario no existe o no está activo.
     */
    @Override
    public Usuario autenticarUsuario(String nombreUsuario, String password) { // Retorna Usuario (singular)
        // --- Reglas de Negocio / Validaciones de entrada ---
        if (nombreUsuario == null || nombreUsuario.trim().isEmpty()) {
            throw new IllegalArgumentException("El nombre de usuario no puede estar vacío.");
        }
        if (password == null || password.trim().isEmpty()) {
            throw new IllegalArgumentException("La contraseña no puede estar vacía.");
        }

        // --- Coordinación con la capa DAO ---
        Usuario usuarioAutenticado = usuarioDAO.obtenerUsuarioPorCredenciales(nombreUsuario, password);

        // --- Reglas de Negocio / Verificación de resultado del DAO ---
        if (usuarioAutenticado == null) {
            throw new RuntimeException("Usuario o contraseña incorrectos.");
        }

        // Verificar si el usuario está activo (asumiendo que el campo en BD es 'EstadoActivo' y POJO 'isEstado()')
        if (!usuarioAutenticado.isEstado()) {
            throw new RuntimeException("El usuario se encuentra inactivo.");
        }

        return usuarioAutenticado;
    }

    // Más métodos de negocio se implementarían aquí.
}
