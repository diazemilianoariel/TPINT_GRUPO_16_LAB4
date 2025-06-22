package InterfazDao; 

import Entidades.Usuario; 
import java.util.List;

public interface IUsuarioDAO {

   
    public Usuario obtenerUsuarioPorCredenciales(String nombreUsuario, String password);
    
    
    public int insertarUsuario(Usuario usuario);
    public boolean actualizarUsuario(Usuario usuario);
    public boolean actualizarEstadoUsuario(int idUsuario, boolean estadoActivo);
    public Usuario obtenerUsuarioPorID(int idUsuario);
    public List<Usuario> obtenerTodosLosUsuarios();

    // Métodos específicos de búsqueda y filtrado podrían ir aca 
}
