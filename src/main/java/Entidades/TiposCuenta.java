package Entidades;

public class TiposCuenta {
    private int idTipoCuenta;
    private String descripcion;

    public TiposCuenta() {
        // Constructor vacío
    }

    public TiposCuenta(int idTipoCuenta, String descripcion) {
        this.idTipoCuenta = idTipoCuenta;
        this.descripcion = descripcion;
    }

    // Getters
    public int getIdTipoCuenta() {
        return idTipoCuenta;
    }

    public String getDescripcion() {
        return descripcion;
    }

    // Setters
    public void setIdTipoCuenta(int idTipoCuenta) {
        this.idTipoCuenta = idTipoCuenta;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @Override
    public String toString() {
        return "TipoCuenta{" +
               "idTipoCuenta=" + idTipoCuenta +
               ", descripcion='" + descripcion + '\'' +
               '}';
    }
}