package InterfazNegocio;


import Entidades.Usuario;

public interface IUsuarioNegocio {
	
	
	
	public Usuario autenticarUsuario(String nombreUsuario, String contraseña);

}
