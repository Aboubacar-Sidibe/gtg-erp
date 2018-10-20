
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.repartition.imprimer;

import com.itextpdf.kernel.color.Color;
import static com.itextpdf.kernel.pdf.PdfName.Text;
import com.itextpdf.layout.element.Text;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import persistence.travaux.TravauxDAO;
import persistence.travaux.TravauxDAOFactory;
import persistence.travaux.Travaux;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.File;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.Image;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.TextField;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import javax.servlet.ServletContext;

import persistence.travaux.TravauxDAOPostImpl;

/**
 *
 * @author macbookpro
 */
@WebServlet(name = "ImprimerServer", urlPatterns = {"/ImprimerServer"})
public class ImprimerServer extends HttpServlet {

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

    }

    public void createPdf(String dest) throws IOException, DocumentException {

    }

    private void buildNestedTables(PdfPTable outerTable, List<Print> allToPrint) throws IOException, DocumentException {

        Font blue = new Font(FontFamily.TIMES_ROMAN, 9, Font.BOLD, BaseColor.BLUE);
        Font black = new Font(FontFamily.TIMES_ROMAN, 8, Font.NORMAL, BaseColor.BLACK);
        Font headerBlack = new Font(FontFamily.TIMES_ROMAN, 9, Font.BOLDITALIC, BaseColor.BLACK);
        Font white = new Font(FontFamily.TIMES_ROMAN, 11, Font.BOLD, BaseColor.WHITE);

        int i = 1;
        for (Print print : allToPrint) {
            PdfPCell cell0 = new PdfPCell();
            cell0.setBackgroundColor(new BaseColor(187, 187, 187));

            PdfPTable innerTable1 = new PdfPTable(1);

            Chunk c = new Chunk(print.getInstrumentEquipe(), headerBlack);
            Paragraph p = new Paragraph(c);
            cell0.addElement(p);

            innerTable1.addCell(cell0);

            List<Travaux> travaux = print.getPrintTravaux();
            for (Travaux travail : travaux) {

                PdfPCell cell1 = new PdfPCell();
                cell1.setBorder(Rectangle.NO_BORDER);

                PdfPCell cell2 = new PdfPCell();
                cell2.setBorder(Rectangle.NO_BORDER);

                PdfPCell cell3 = new PdfPCell();
                cell3.setBorder(Rectangle.NO_BORDER);

                PdfPCell cell4 = new PdfPCell();
                cell4.setBorder(Rectangle.NO_BORDER);

                PdfPCell cell5 = new PdfPCell();
                cell5.setBorder(Rectangle.NO_BORDER);

                PdfPCell cell6 = new PdfPCell();
                cell6.setBorder(Rectangle.NO_BORDER);

                PdfPCell cell7 = new PdfPCell();

                cell7.setBorder(Rectangle.BOTTOM);

                Chunk dossier = new Chunk("Folder: ", blue);
                Paragraph p1 = new Paragraph(dossier);
                Chunk dossierVal = new Chunk(travail.getDossier(), black);
                p1.add(dossierVal);
                cell1.addElement(p1);

                Chunk client = new Chunk("Client: ", blue);
                Paragraph p2 = new Paragraph(client);
                Chunk clientVal = new Chunk(travail.getClient(), black);
                p2.add(clientVal);
                cell2.addElement(p2);

                Chunk travailT = new Chunk("Work: ", blue);
                Paragraph p3 = new Paragraph(travailT);
                Chunk travailTVal = new Chunk(travail.getTypeDeTravail(), black);
                p3.add(travailTVal);
                cell3.addElement(p3);

                Chunk lieu = new Chunk("Place: ", blue);
                Paragraph p4 = new Paragraph(lieu);
                Chunk lieuVal = new Chunk(travail.getLieu(), black);
                p4.add(lieuVal);
                cell4.addElement(p4);

                Chunk durée = new Chunk("Duration: ", blue);
                Paragraph p5 = new Paragraph(durée);
                Chunk duréeVal = new Chunk(travail.getDureEstime(), black);
                p5.add(duréeVal);
                cell5.addElement(p5);

                Chunk deadline = new Chunk("Deadline: ", blue);
                Paragraph p6 = new Paragraph(deadline);
                Chunk deadlineVal = new Chunk(travail.getDeadlineStr(), black);
                p6.add(deadlineVal);
                cell6.addElement(p6);

                Chunk donneur = new Chunk("Giver: ", blue);
                Paragraph p7 = new Paragraph(donneur);
                Chunk donneurVal = new Chunk(travail.getDonneur(), black);
                p7.add(donneurVal);
                cell7.addElement(p7);

                innerTable1.addCell(cell1);
                innerTable1.addCell(cell2);
                innerTable1.addCell(cell3);
                innerTable1.addCell(cell4);
                innerTable1.addCell(cell5);
                innerTable1.addCell(cell6);
                innerTable1.addCell(cell7);

            }
            outerTable.addCell(innerTable1);

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
        processRequest(request, response);

        String ids = request.getParameter("AllIds");

        String pdfname = "Repartition.pdf";
        ServletContext servletContext = request.getSession().getServletContext();
        String fi = request.getSession().getServletContext().getRealPath("/");
        String FILE = fi + "/web/pdf/" + pdfname;

        File file = new File(FILE);
        file.getParentFile().mkdirs();

        Document document = new Document(PageSize.A3);

        try {
            PdfWriter.getInstance(document, new FileOutputStream(FILE));
        } catch (DocumentException ex) {
            Logger.getLogger(ImprimerServer.class.getName()).log(Level.SEVERE, null, ex);
        }
        document.open();
        Font white = new Font(Font.FontFamily.TIMES_ROMAN, 16, Font.BOLD, BaseColor.WHITE);
        Font black = new Font(Font.FontFamily.TIMES_ROMAN, 16, Font.BOLD, BaseColor.BLACK);

        //créer l'entête Stimulus
        PdfPTable header = new PdfPTable(3);

        header.setSpacingAfter(20);
        header.setWidthPercentage(100);
        try {
            header.addCell(createImageCell(getServletContext().getRealPath("img").replaceAll("/build", "").concat("/") + "g.jpg"));
        } catch (DocumentException ex) {
            Logger.getLogger(ImprimerServer.class.getName()).log(Level.SEVERE, null, ex);
        }

        Chunk h1textmiddle = new Chunk("Planification of the week  "+getOnlyJourMoisAn(), white);
        PdfPCell h1m = new PdfPCell(new Phrase(h1textmiddle));
        h1m.setPaddingTop(40);
        h1m.setHorizontalAlignment(PdfPCell.ALIGN_CENTER);
        h1m.setBackgroundColor(new BaseColor(163, 0, 43));

        Chunk h1textright = new Chunk("Done on : "+ getTodayDate(), black);
        PdfPCell h1r = new PdfPCell(new Phrase(h1textright));

        h1r.setPaddingTop(40);
        h1r.setHorizontalAlignment(PdfPCell.ALIGN_RIGHT);

        header.addCell(h1m);
        header.addCell(h1r);
        try {
            document.add(header);
        } catch (DocumentException ex) {
            Logger.getLogger(ImprimerServer.class.getName()).log(Level.SEVERE, null, ex);
        }

        String[] idsArr = ids.split("@");
        List<Print> allToPrint = new ArrayList<>();
        for (String id : idsArr) {
            Print print = new Print();
            String[] repartitionColumn = id.split(",");
            print.setInstrumentEquipe(repartitionColumn[0]);
            for (int i = 1; i < repartitionColumn.length; i++) {
                TravauxDAO travauxDAO = TravauxDAOFactory.createTravaux();
                Travaux travail = travauxDAO.getTravaux(repartitionColumn[i]);
                print.setPrintTravaux(travail);
            }
            allToPrint.add(print);

        }

        PdfPTable outerTable = new PdfPTable(5);

        outerTable.setTotalWidth(770F);
        outerTable.setLockedWidth(true);
        try {
            buildNestedTables(outerTable, allToPrint);
        } catch (DocumentException ex) {
            Logger.getLogger(ImprimerServer.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            document.add(outerTable);
        } catch (DocumentException ex) {
            Logger.getLogger(ImprimerServer.class.getName()).log(Level.SEVERE, null, ex);
        }

        document.close();
        String minmeType = getServletContext().getMimeType(FILE);
        if (minmeType == null) {
            minmeType = "application/octet-stream";
        }
        response.setContentType(minmeType);
        response.setContentLength((int) file.length());
        response.setHeader("Content-Disposition", "attachment; filename=\"" + pdfname + "\"");
        try (OutputStream out = response.getOutputStream()) {
            byte[] buffer = new byte[4096];
            int bytesRead = -1;
            try (FileInputStream fileInputStream = new FileInputStream(file)) {
                int i;
                while ((bytesRead = fileInputStream.read(buffer)) != -1) {
                    out.write(buffer, 0, bytesRead);
                }
            }
        }

    }

    public static PdfPCell createImageCell(String path) throws DocumentException, IOException {
        Image img = Image.getInstance(path);
        PdfPCell cell = new PdfPCell(img);

        return cell;

    }

    public static String
            getTodayDate() {
        /* new java api, est à ce jour la meilleure manière  de travailler avec la date
          Elle es très simple comme je peux le comparer moi même au code juste en haut pour obtenir la date d'aujourd'hui.
         */
        LocalDateTime now = LocalDateTime.now(ZoneId.of("America/Montreal"));
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy  HH:mm");
        String formatDateTime = now.format(formatter);

        return formatDateTime;

    }
        public static String
            getOnlyJourMoisAn() {
        /* new java api, est à ce jour la meilleure manière  de travailler avec la date
          Elle es très simple comme je peux le comparer moi même au code juste en haut pour obtenir la date d'aujourd'hui.
         */
        LocalDateTime now = LocalDateTime.now(ZoneId.of("America/Montreal"));
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        String formatDateTime = now.format(formatter);
        
        LocalDate ld = LocalDate.now(ZoneId.of("America/Montreal"));

        String jj = formatDateTime.substring(0, 2);
        String mm = formatDateTime.substring(3, 5);
        String aa = formatDateTime.substring(6);

        int jjour = Integer.parseInt(jj);
        int mmois = Integer.parseInt(mm);
        int aan = Integer.parseInt(aa);

        LocalDate l = ld.of(aan, mmois, jjour);

        String lundi = null;

        DayOfWeek dayOfTheWeek = l.getDayOfWeek();

        switch (dayOfTheWeek.toString()) {
            case "MONDAY":
                lundi = l.getDayOfMonth() + "/" + l.getMonthValue() + "/" + l.getYear();

                break;
            case "TUESDAY":
                lundi = l.minusDays(1).getDayOfMonth() + "/" + l.minusDays(1).getMonthValue() + "/" + l.minusDays(1).getYear();

                break;
            case "WEDNESDAY":
                lundi = l.minusDays(2).getDayOfMonth() + "/" + l.minusDays(2).getMonthValue() + "/" + l.minusDays(2).getYear();

                break;
            case "THURSDAY":
                lundi = l.minusDays(3).getDayOfMonth() + "/" + l.minusDays(3).getMonthValue() + "/" + l.minusDays(3).getYear();

                break;
            case "FRIDAY":
                lundi = l.minusDays(4).getDayOfMonth() + "/" + l.minusDays(4).getMonthValue() + "/" + l.minusDays(4).getYear();

                break;
                case "SATURDAY":
                lundi = l.minusDays(5).getDayOfMonth() + "/" + l.minusDays(5).getMonthValue() + "/" + l.minusDays(5).getYear();

                break;
                case "SUNDAY":
                lundi = l.minusDays(6).getDayOfMonth() + "/" + l.minusDays(6).getMonthValue() + "/" + l.minusDays(6).getYear();

                break;
            default:
                break;
        }

        return lundi;

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
