/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class MainControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
            {nom, min, nom}, {nom, min++, nom}, {nom, nom, nom}, {nom, max--, nom}, {nom, max, nom}, {nom, nom, min}, {nom, nom, min++},
            {nom, nom, nom}, {nom, nom, max--}, {nom, nom, max}};

            int[][] robustSides = {{min--, nom, nom}, {min, nom, nom}, {min++, nom, nom}, {nom, nom, nom}, {max--, nom, nom}, {max, nom, nom}, {max++, nom, nom},
            {nom, min--, nom}, {nom, min, nom}, {nom, min++, nom}, {nom, nom, nom}, {nom, max--, nom}, {nom, max, nom}, {nom, max++, nom}, {nom, nom, min--}, {nom, nom, min},
            {nom, nom, min++}, {nom, nom, nom}, {nom, nom, max--}, {nom, nom, max}, {nom, nom, max++}};

            boolean boundaryChecked = false;
            boolean robustChecked = false;
            boolean triangleChecked = false;
            boolean commissionChecked = false;

            String[] boundary = {"classify", "classify2", "classify3", "classify4", "classify5", "classify6", "classify7",
                "classify8", "classify9", "classify10", "classify11", "classify12", "classify13", "classify14", "classify15"};
            String[] robust = {"classify", "classify2", "classify3", "classify4", "classify5", "classify6", "classify7",
                "classify8", "classify9", "classify10", "classify11", "classify12", "classify13", "classify14", "classify15", "classify16",
                "classify17", "classify18", "classify19", "classify20", "classify21"};

            if (checkboxes != null) {
                for (String ck : checkboxes) {
                    if (ck.equals("boundary")) {
                        boundaryChecked = true;
                    }
                    if (ck.equals("robust")) {
                        robustChecked = true;
                    }
                    if (ck.equals("triangle")) {
                        triangleChecked = true;
                    }
                    if (ck.equals("commission")) {
                        commissionChecked = true;
                    }
                }
                if (robustChecked && boundaryChecked) {
                    request.setAttribute("invalid1", "Invalid Choice");
                }
                if (commissionChecked && triangleChecked) {
                    request.setAttribute("invalid2", "Invalid Choice");
                }
                if (robustChecked && commissionChecked) {
                    request.setAttribute("robustCommiss", "true");
                    double Commission;
                    for (int i = 0; i < robustSides.length; i++) {
                        Commission commission = new Commission(robustSides[i][0], robustSides[i][1], robustSides[i][2], 30.0, 35.0, 40.0);
                        double Sales = commission.calSale();

                        if (Sales > 1800) {
                            Commission = 0.10 * 1000.0;
                            Commission = Commission + 0.15 * 800;
                            Commission = Commission + 0.20 * (Sales - 1800.0);
                        } else if (Sales > 1000) {
                            Commission = 0.10 * 1000;
                            Commission = Commission + 0.15 * (Sales - 1000);
                        } else {
                            Commission = 0.10 * Sales;
                        }

                        request.setAttribute(robust[i], Commission);
                    }
                }
                if (boundaryChecked && commissionChecked) {
                    request.setAttribute("boundaryCommiss", "true");
                    double Commission;
                    for (int i = 0; i < boundarySides.length; i++) {
                        Commission commission = new Commission(boundarySides[i][0], boundarySides[i][1], boundarySides[i][2], 30.0, 35.0, 40.0);
                        double Sales = commission.calSale();

                        if (Sales > 1800) {
                            Commission = 0.10 * 1000.0;
                            Commission = Commission + 0.15 * 800;
                            Commission = Commission + 0.20 * (Sales - 1800.0);
                        } else if (Sales > 1000) {
                            Commission = 0.10 * 1000;
                            Commission = Commission + 0.15 * (Sales - 1000);
                        } else {
                            Commission = 0.10 * Sales;
                        }

                        request.setAttribute(boundary[i], Commission);
                    }
                }
                if (boundaryChecked && triangleChecked) {
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
                if (robustChecked && triangleChecked) {
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

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("MainJSP.jsp");
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