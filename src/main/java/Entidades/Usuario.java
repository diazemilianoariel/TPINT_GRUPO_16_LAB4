package Entidades;

public class Usuario {
    private int idUsuario;
    private String nombreUsuario;
    private String password;
    private TipoUsuario tipoUsuario; // Objeto de composición
    private boolean estado; 

    public Usuario() {
        // Constructor vacío
    }

    public Usuario(int idUsuario, String nombreUsuario, String password, TipoUsuario tipoUsuario, boolean estado) {
        this.idUsuario = idUsuario;
        this.nombreUsuario = nombreUsuario;
        this.password = password;
        this.tipoUsuario = tipoUsuario;
        this.estado = estado;
    }

    // Getters
    public int getIdUsuario() {
        return idUsuario;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public String getPassword() {
        return password;
    }

    public TipoUsuario getTipoUsuario() {
        return tipoUsuario;
    }

    public boolean isEstado() { // Método getter para 'estado'
        return estado;
    }

    // Setters
    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setTipoUsuario(TipoUsuario tipoUsuario) {
        this.tipoUsuario = tipoUsuario;
    }

    public void setEstado(boolean estado) { // Método setter para 'estado'
        this.estado = estado;
    }

    @Override
    public String toString() {
        return "Usuario{" +
               "idUsuario=" + idUsuario +
               ", nombreUsuario='" + nombreUsuario + '\'' +
               ", tipoUsuario=" + (tipoUsuario != null ? tipoUsuario.getDescripcion() : "N/A") +
               ", estado=" + estado +
               '}';
    }
}