package Entidades;

public class TipoMovimiento {
    private int idTipoMovimiento;
    private String descripcion;

    public TipoMovimiento() {
        // Constructor vacío
    }

    public TipoMovimiento(int idTipoMovimiento, String descripcion) {
        this.idTipoMovimiento = idTipoMovimiento;
        this.descripcion = descripcion;
    }

    // Getters
    public int getIdTipoMovimiento() {
        return idTipoMovimiento;
    }

    public String getDescripcion() {
        return descripcion;
    }

    // Setters
    public void setIdTipoMovimiento(int idTipoMovimiento) {
        this.idTipoMovimiento = idTipoMovimiento;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @Override
    public String toString() {
        return "TipoMovimiento{" +
               "idTipoMovimiento=" + idTipoMovimiento +
               ", descripcion='" + descripcion + '\'' +
               '}';
    }
}