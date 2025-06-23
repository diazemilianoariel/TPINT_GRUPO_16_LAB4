package ImplementacionNegocio; 

import InterfazNegocio.IUsuarioNegocio; 
import InterfazDao.IUsuarioDAO;     
import ImplementacionDao.UsuarioDAO;  
import Entidades.Usuario;             



/**
 * Implementación de la lógica de negocio para la entidad Usuario.
 * Se encarga de validar datos, aplicar reglas de negocio y coordinar las operaciones con la capa DAO.
 */
public class UsuarioNegocio implements IUsuarioNegocio {

    private IUsuarioDAO usuarioDAO; 

    /**
     * Constructor que inicializa el DAO.
     */
    public UsuarioNegocio() {
        this.usuarioDAO = new UsuarioDAO(); 
    }

  
    @Override
    public Usuario autenticarUsuario(String nombreUsuario, String password) { 
        
        if (nombreUsuario == null || nombreUsuario.trim().isEmpty()) {
            throw new IllegalArgumentException("El nombre de usuario no puede estar vacío.");
        }
        if (password == null || password.trim().isEmpty()) {
            throw new IllegalArgumentException("La contraseña no puede estar vacía.");
        }

        
        Usuario usuarioAutenticado = usuarioDAO.obtenerUsuarioPorCredenciales(nombreUsuario, password);

       
        if (usuarioAutenticado == null) {
            throw new RuntimeException("Usuario o contraseña incorrectos.");
        }

     
        if (!usuarioAutenticado.isEstado()) {
            throw new RuntimeException("El usuario se encuentra inactivo.");
        }

        return usuarioAutenticado;
    }

    // Más métodos de negocio se implementarían aquí.
}
