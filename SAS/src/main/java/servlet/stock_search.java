package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;

import dao.StockDAO;

/**
 * Servlet implementation class stock_search
 */
public class stock_search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public stock_search() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("stock_stock post");
		request.setCharacterEncoding("utf-8");
		String value = (String)request.getParameter("value");
//		System.out.println(value);
		StockDAO dao = new StockDAO();
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		if (value.indexOf("sh") != -1 || value.indexOf("sz") != -1){
			if (dao.findID(value)){	
				
				out.print(value);
			}
			else{
				out.print("error");
			}
		}
		else{
			String ans = dao.findName(value);
			if (ans.equals("fail")){
				out.print("error");
			}
			else{
				try {
					JSONArray json = new JSONArray(ans);
					System.out.println(json.length());
					if (json.length() == 1) {					
						out.print(json.getJSONObject(0).getString("id").toString());
					}
					else{	
						out.print("error");
					}
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
		}
		
	}

}
