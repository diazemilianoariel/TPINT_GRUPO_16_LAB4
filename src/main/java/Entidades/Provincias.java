package Entidades;

public class Provincias {
    private int idProvincia;
    private String descripcion;

    public Provincias() {
        // Constructor vacío
    }

    public Provincias(int idProvincia, String descripcion) {
        this.idProvincia = idProvincia;
        this.descripcion = descripcion;
    }

    // Getters
    public int getIdProvincia() {
        return idProvincia;
    }

    public String getDescripcion() {
        return descripcion;
    }

    // Setters
    public void setIdProvincia(int idProvincia) {
        this.idProvincia = idProvincia;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @Override
    public String toString() {
        return "Provincia{" +
               "idProvincia=" + idProvincia +
               ", descripcion='" + descripcion + '\'' +
               '}';
    }
}