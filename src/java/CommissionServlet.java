/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(urlPatterns = {"/CommissionServlet"})
public class CommissionServlet extends HttpServlet {

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
        String minLock = request.getParameter("minlock");
        String maxLock = request.getParameter("maxlock");
        String minStock = request.getParameter("minstock");
        String maxStock = request.getParameter("maxstock");
        String minBarrel = request.getParameter("minbarrel");
        String maxBarrel = request.getParameter("maxbarrel");

        String[] checkboxes = request.getParameterValues("checkbox");

        try {
            int minL = Integer.parseInt(minLock);
            int maxL = Integer.parseInt(maxLock);
            int minS = Integer.parseInt(minStock);
            int maxS = Integer.parseInt(maxStock);
            int minB = Integer.parseInt(minBarrel);
            int maxB = Integer.parseInt(maxBarrel);
            int nomL = (minL + maxL) / 2;
            int nomS = (minS + maxS) / 2;
            int nomB = (minB + maxB) / 2;

            request.setAttribute("minL", minL);
            request.setAttribute("minS", minS);
            request.setAttribute("minB", minB);
            request.setAttribute("maxL", maxL);
            request.setAttribute("maxS", maxS);
            request.setAttribute("maxB", maxB);
            request.setAttribute("nomL", nomL);
            request.setAttribute("nomS", nomS);
            request.setAttribute("nomB", nomB);

            int[][] boundarySides = {{minL, nomS, nomB}, {minL++, nomS, nomB}, {nomL, nomS, nomB}, {maxL--, nomS, nomB}, {maxL, nomS, nomB},
            {nomL, minS, nomB}, {nomL, minS++, nomB}, {nomL, maxS--, nomB}, {nomL, maxS, nomB}, {nomL, nomS, minB}, {nomL, nomS, minB++},
            {nomL, nomS, maxB--}, {nomL, nomS, maxB}};

            int[][] robustSides = {{minL--, nomS, nomB}, {minL, nomS, nomB}, {minL++, nomS, nomB}, {nomL, nomS, nomB}, {maxL--, nomS, nomB}, {maxL, nomS, nomB}, {maxL++, nomS, nomB},
            {nomL, minS--, nomB}, {nomL, minS, nomB}, {nomL, minS++, nomB},{nomL, maxS--, nomB}, {nomL, maxS, nomB}, {nomL, maxS++, nomB}, {nomL, nomS, minB--}, {nomL, nomS, minB}, {nomL, nomS, minB++},
            {nomL, nomS, maxB--}, {nomL, nomS, maxB}, {nomL, nomS, maxB++}};

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
                if (robustChecked) {
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
                if (boundaryChecked) {
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
            } else {
                request.setAttribute("notChecked", "You have to check the box");
            }
        } catch (NullPointerException e) {
            request.setAttribute("notFill", "You have to enter input");
        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("CommissionJSP.jsp");
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
