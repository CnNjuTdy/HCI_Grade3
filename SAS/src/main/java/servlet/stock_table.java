package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.StockDAO;
import entity.Stock;

/**
 * Servlet implementation class StockServlet
 */
public class stock_table extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public stock_table() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		if (id == null) {
			id = "sh600050";
			System.out.println("stock_table:无参数，初始化为"+id);		
		}
		StockDAO dao = new StockDAO();
//		List<Stock> list = dao.getDefaultList(id);
		String jsonList = dao.getDefaultJsonList(id);
//		request.setAttribute("list", list);
		request.setAttribute("id", id);
		request.setAttribute("jsonList", jsonList);
		request.getRequestDispatcher("jsp/table.jsp").forward(request, response);
		//response.sendRedirect("jsp/aboutOurs.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
