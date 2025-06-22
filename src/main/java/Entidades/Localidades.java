package Entidades;

public class Localidades {
    private int idLocalidad;
    private String descripcion;
    private Provincias provincia; 

    public Localidades() {
        // Constructor vacío
    }

    public Localidades(int idLocalidad, String descripcion, Provincias provincia) {
        this.idLocalidad = idLocalidad;
        this.descripcion = descripcion;
        this.provincia = provincia;
    }

    // Getters
    public int getIdLocalidad() {
        return idLocalidad;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public Provincias getProvincia() {
        return provincia;
    }

    // Setters
    public void setIdLocalidad(int idLocalidad) {
        this.idLocalidad = idLocalidad;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void setProvincia(Provincias provincia) {
        this.provincia = provincia;
    }

    @Override
    public String toString() {
        return "Localidad{" +
               "idLocalidad=" + idLocalidad +
               ", descripcion='" + descripcion + '\'' +
               ", provincia=" + (provincia != null ? provincia.getDescripcion() : "N/A") +
               '}';
    }
}