package Servlets; 

import ImplementacionNegocio.UsuarioNegocio; 
import Entidades.Usuario;                

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet("/login") 
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UsuarioNegocio usuarioNegocio;

  
    public LoginServlet() {
        super();
        this.usuarioNegocio = new UsuarioNegocio(); 
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Simplemente redirige a la página de login si se accede por GET
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombreUsuario = request.getParameter("usuario"); 
        String password = request.getParameter("contrasena");

        Usuario usuarioLogueado = null;
        String mensajeError = null;

        try {
           
            usuarioLogueado = usuarioNegocio.autenticarUsuario(nombreUsuario, password);

            if (usuarioLogueado != null) {
                
                HttpSession session = request.getSession(); // Obtiene o crea la sesión HTTP
                session.setAttribute("usuarioLogueado", usuarioLogueado); // Guarda el objeto Usuario en la sesión

               
                if (usuarioLogueado.getTipoUsuario().getIdTipoUsuario() == 1) { 
                    response.sendRedirect(request.getContextPath() + "/menuAdministrador.jsp"); 
                } else if (usuarioLogueado.getTipoUsuario().getIdTipoUsuario() == 2) {
                    response.sendRedirect("menuCliente.jsp"); 
                } else {
                   
                    mensajeError = "Tipo de usuario no reconocido.";
                    request.setAttribute("mensajeError", mensajeError);
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            } else {
                
                mensajeError = "Usuario o contraseña incorrectos.";
                request.setAttribute("mensajeError", mensajeError);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        } catch (IllegalArgumentException e) {
            
            mensajeError = e.getMessage();
            request.setAttribute("mensajeError", mensajeError);
            request.getRequestDispatcher("login.jsp").forward(request, response);

        } catch (RuntimeException e) {
            
            mensajeError = e.getMessage();
            request.setAttribute("mensajeError", mensajeError);
            request.getRequestDispatcher("login.jsp").forward(request, response);

        } catch (Exception e) {
           
            mensajeError = "Ocurrió un error inesperado. Intente de nuevo.";
            System.err.println("Error inesperado en LoginServlet: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("mensajeError", mensajeError);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }



}
