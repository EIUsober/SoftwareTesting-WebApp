import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * This is Triangle Servlet Page
 */
public class MainControl extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String minValue = request.getParameter("min");
        String maxValue = request.getParameter("max");
        String[] checkboxes = request.getParameterValues("checkbox");
        try {
            int min = Integer.parseInt(minValue);
            int max = Integer.parseInt(maxValue);
            if (min <= 0 || max <= 0) {
                request.setAttribute("less", "Value must be greater than 0");
            }
            int nom = (min + max) / 2;
            request.setAttribute("min", min);
            request.setAttribute("max", max);
            request.setAttribute("nom", nom);
            int[][] boundarySides = {{min, nom, nom}, {min++, nom, nom}, {nom, nom, nom}, {max--, nom, nom}, {max, nom, nom},
            {nom, min, nom}, {nom, min++, nom}, {nom, max--, nom}, {nom, max, nom}, {nom, nom, min}, {nom, nom, min++},
            {nom, nom, max--}, {nom, nom, max}};

            int[][] robustSides = {{min--, nom, nom}, {min, nom, nom}, {min++, nom, nom}, {nom, nom, nom}, {max--, nom, nom}, {max, nom, nom}, {max++, nom, nom},
            {nom, min--, nom}, {nom, min, nom}, {nom, min++, nom},{nom, max--, nom}, {nom, max, nom}, {nom, max++, nom}, {nom, nom, min--}, {nom, nom, min},
            {nom, nom, min++}, {nom, nom, max--}, {nom, nom, max}, {nom, nom, max++}};

            boolean boundaryChecked = false;
            boolean robustChecked = false;


            String[] boundary = {"classify", "classify2", "classify3", "classify4", "classify5", "classify6", "classify7",
                "classify8", "classify9", "classify10", "classify11", "classify12", "classify13"};
            String[] robust = {"classify", "classify2", "classify3", "classify4", "classify5", "classify6", "classify7",
                "classify8", "classify9", "classify10", "classify11", "classify12", "classify13", "classify14", "classify15", "classify16",
                "classify17", "classify18", "classify19"};

            if (checkboxes != null) {
                for (String ck : checkboxes) {
                    if (ck.equals("boundary")) {
                        boundaryChecked = true;
                    }
                    if (ck.equals("robust")) {
                        robustChecked = true;
                    }
                }
                if (robustChecked && boundaryChecked){
                    request.setAttribute("error", "YOU CAN'T CHECK TWO OPTIONS!");
                }
                if (boundaryChecked) {
                    request.setAttribute("boundaryTriangle", "true");
                    for (int i = 0; i < boundarySides.length; i++) {
                        Triangle triangle = new Triangle();
                        triangle.setSide(boundarySides[i][0], boundarySides[i][1], boundarySides[i][2]);
                        if (triangle.isTriangle()) {
                            String value = triangle.classify();
                            request.setAttribute(boundary[i], value);
                        } else {
                            request.setAttribute(boundary[i], "Not a Triangle");
                        }
                    }
                    if (!(min < nom + max) && (nom < min + nom) && (max < nom + min)) {
                        request.setAttribute("alert", "It's not a triangle");
                    }
                }
                if (robustChecked) {
                    request.setAttribute("robustTriangle", "true");
                    for (int i = 0; i < robustSides.length; i++) {
                        Triangle triangle = new Triangle();
                        triangle.setSide(robustSides[i][0], robustSides[i][1], robustSides[i][2]);
                        if (triangle.isTriangle()) {
                            String value = triangle.classify();
                            request.setAttribute(robust[i], value);
                        } else {
                            request.setAttribute(robust[i], "Not a Triangle");
                        }
                    }
                    if (!(min < nom + max) && (nom < min + nom) && (max < nom + min)) {
                        request.setAttribute("alert", "It's not a triangle");
                    }
                }
            } else {
                request.setAttribute("notChecked", "You have to check the box");
            }

        } catch (NullPointerException e) {
            request.setAttribute("notFill", "You have to enter input");
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("TriangleJSP.jsp");
        requestDispatcher.forward(request, response);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
