package bg.caruca.servlets;
 
import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.mysql.jdbc.Connection;

import bg.caruca.dbmodels.DBManager;
 
@WebServlet("/BrandImgUploadServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*10, 	 
					   maxFileSize=1024*1024*50,       
					maxRequestSize=1024*1024*100)
public class BrandImgUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private static final String UPLOAD_DIR = "uploads"; 
	
    public BrandImgUploadServlet() {
        super();
    } 
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		int brandId = Integer.valueOf( (String) request.getSession().getAttribute("brandId") );  

		String applicationPath = request.getServletContext().getRealPath("");
		String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;

		File fileSaveDir = new File(uploadFilePath);
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdirs();
		}
		System.out.println("Upload File Directory="+fileSaveDir.getAbsolutePath());

		String fileName = null;
		for (Part part : request.getParts()) {
			fileName = getFileName(part);
			part.write(uploadFilePath + File.separator + fileName);
		}
		String filePath = fileSaveDir.getAbsolutePath()+File.separator+fileName;

		DBManager dbm = (DBManager)getServletContext().getAttribute("CarucaDBManager"); 

		try
		{
			if (!dbm.isConnected()) {
				if (!dbm.openConnection())  {
					System.out.println("Could not connect to the database...");
				}
			} 
			Connection c = (Connection) dbm.getConnection();
			c.createStatement().executeUpdate("UPDATE brands SET photo = '"+filePath.replace('\\', '/')+"' WHERE id = '"+brandId+"'" ); 
		}
		catch(Exception e)
		{
			System.out.println("<h1>ERROR: " + e.getMessage() + "</h1>");
		}

 
		response.sendRedirect("/Caruca.bg/addBrand.jsp");
//		getServletContext().getRequestDispatcher("/addBrand.jsp").forward(
//				request, response);
	}
	
	private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        System.out.println("content-disposition header= "+contentDisp);
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length()-1);
            }
        }
        return "";
    }

}
