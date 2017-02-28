package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import analysis.analysis;
import entity.ROLL;

/**
 * Servlet implementation class candlestick
 */
public class servlet_ROLL extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public servlet_ROLL() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		if (id == null) {
			id = "sh600050";	
		}
		analysis a= new analysis();
		List<ROLL> list = a.getRoll(id);
//		ROLLCondition rollCondition = a.judgeRoll(list, id);
//		ArrayList<String> result = rollCondition.getResult();
		request.setAttribute("id", id);
		request.setAttribute("list", list);
//		request.setAttribute("result", result);
		request.getRequestDispatcher("jsp/ROLL.jsp").forward(request, response); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
