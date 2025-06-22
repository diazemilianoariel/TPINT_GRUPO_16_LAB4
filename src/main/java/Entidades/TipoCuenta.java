package Entidades;

public class TipoCuenta {
    private int idTipoCuenta;
    private String descripcion;

    public TipoCuenta() {
        // Constructor vacío
    }

    public TipoCuenta(int idTipoCuenta, String descripcion) {
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