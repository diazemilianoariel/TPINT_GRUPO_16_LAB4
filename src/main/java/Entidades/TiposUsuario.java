package Entidades;



public class TiposUsuario {
    private int idTipoUsuario;
    private String descripcion;

    public TiposUsuario() {
        // Constructor vacío
    }

    public TiposUsuario(int idTipoUsuario, String descripcion) {
        this.idTipoUsuario = idTipoUsuario;
        this.descripcion = descripcion;
    }

    // Getters
    public int getIdTipoUsuario() {
        return idTipoUsuario;
    }

    public String getDescripcion() {
        return descripcion;
    }

    // Setters
    public void setIdTipoUsuario(int idTipoUsuario) {
        this.idTipoUsuario = idTipoUsuario;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @Override
    public String toString() {
        return "TipoUsuario{" +
               "idTipoUsuario=" + idTipoUsuario +
               ", descripcion='" + descripcion + '\'' +
               '}';
    }
}
