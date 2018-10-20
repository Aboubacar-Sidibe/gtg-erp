/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.instrument;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import persistence.ConnectionFactory;
import persistence.dateconverter.DateConverter;
import persistence.*;
import persistence.fournisseurs.Fournisseur;
import persistence.fournisseurs.FournisseurDAO;
import persistence.fournisseurs.FournisseurDAOFactory;

/**
 *
 * @author macbookpro
 */
@WebServlet(name = "ServerAllInstrument", urlPatterns = {"/ServerAllInstrument"})
public class ServerAllInstrument extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        String spageid = request.getParameter("page");

        int pageid = Integer.parseInt(spageid);
        int total = 30;
        if (pageid == 1) {
            pageid = 0;
        } else {
            pageid = pageid - 1;
            pageid = pageid * total;
        }

        FournisseurDAO fournisseurDAO = FournisseurDAOFactory.createFournisseur();
        List<Fournisseur> fournisseurs = fournisseurDAO.getAllFournisseurs();

        try (Connection connection = ConnectionFactory.getConnection();
                Statement stm = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet r = stm.executeQuery("SELECT * FROM instrument");
                PreparedStatement p = connection.prepareStatement("SELECT * FROM instrument ORDER BY  count DESC limit ? offset ?")) {

            int rowCount = 0;
            int paginationNo = 0;
            int currRow = r.getRow();
            if (!r.last()) {
            }
            rowCount = r.getRow();

            if (currRow == 0) {
                r.beforeFirst();
            } else {
                r.absolute(currRow);
            }

            if (rowCount % 30 == 0) {
                paginationNo = rowCount / 30;
            } else {
                paginationNo = (rowCount / 30) + 1;
            }

            p.setInt(1, total);
            p.setInt(2, pageid);
            ResultSet rs = p.executeQuery();

            List<Instrument> instruments = new ArrayList<>();
            while (rs.next()) {

                Instrument instrument = new Instrument();
                instrument.setNumeroDeSerie(rs.getString("numero_de_serie"));
                instrument.setNom(rs.getString("nom"));
                instrument.setMarque(rs.getString("marque"));
                instrument.setModel(rs.getString("model"));
                instrument.setVersion(rs.getString("version"));
                instrument.setNumero(rs.getString("numero"));
                instrument.setType(rs.getString("type"));
                instrument.setCouleur(rs.getString("couleur"));
                instrument.setCompatibilite(rs.getString("compatibilite"));
                instrument.setDisponibilite(rs.getString("disponibilite"));
                instrument.setDateDacquisitionStr(DateConverter.convertToFrFormat(rs, "date_dacquisition"));
                instrument.setCoutDacquisition(rs.getString("cout_dacquisition"));
                instrument.setFinGarantieStr(DateConverter.convertToFrFormat(rs, "fin_garantie"));
                instrument.setAbbreviation(rs.getString("abbreviation"));
                instrument.setActif(rs.getString("actif"));
                instrument.setFournisseurId(rs.getInt("fournisseur_id"));

                PreparedStatement pfn = connection.prepareStatement("SELECT nom,id FROM fournisseur WHERE id=?");
                pfn.setLong(1, instrument.getFournisseurId());
                ResultSet pfnRs = pfn.executeQuery();
                if (pfnRs.next()) {
                    instrument.setFournisseurName(pfnRs.getString("nom"));
                }

                instruments.add(instrument);

            }
            if (!instruments.isEmpty()) {
                request.setAttribute("selectedId", request.getAttribute("selectedId"));
                request.setAttribute("no", paginationNo);
                request.setAttribute("rowcount", rowCount);
                request.setAttribute("fournisseurs", fournisseurs);
                request.setAttribute("instruments", instruments);
                request.getRequestDispatcher("ContainerInstruments.jsp").forward(request, response);
            }

        } catch (SQLException ex) {
            request.setAttribute("error", ex);
            request.getRequestDispatcher("Error.jsp").forward(request, response);
        }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServerAllInstrument.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(ServerAllInstrument.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServerAllInstrument.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(ServerAllInstrument.class.getName()).log(Level.SEVERE, null, ex);
        }
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
