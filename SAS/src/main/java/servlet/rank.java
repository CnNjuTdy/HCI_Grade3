package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RankDAO;
import entity.Stock;

/**
 * Servlet implementation class rank
 */
public class rank extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public rank() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RankDAO rank = new RankDAO();
		String amount_red = rank.getList("red", "amount"); //成交金额的平均值(7天)
		String turnover_red = rank.getList("red", "turnover"); //换手率(1日)
		String change_red = rank.getList("red", "change"); //涨幅(1日)
		String amount_black= rank.getList("black", "amount"); //成交金额的平均值(7天)
		String turnover_black = rank.getList("black", "turnover"); //换手率(1日)
		String change_black = rank.getList("black", "change"); //涨幅(1日)
		request.setAttribute("amount_red", amount_red);
		request.setAttribute("turnover_red", turnover_red);
		request.setAttribute("change_red", change_red);
		request.setAttribute("amount_black", amount_black);
		request.setAttribute("turnover_black", turnover_black);
		request.setAttribute("change_black", change_black); 
		//都是id,name,data
		request.getRequestDispatcher("jsp/analysis.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
