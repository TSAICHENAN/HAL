
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CountServlet
 */
@WebServlet("/CountServlet")
public class CountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CountServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());request.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession(true);
		String strCount = request.getParameter("Count");
		String strCount10 = request.getParameter("Count10");
		String strJSPName ="";
		int intFlag = (Integer)session.getAttribute("FLAG");
		int intCount = Integer.parseInt(strCount);
		int intCount10 = Integer.parseInt(strCount10);
		if(intCount+intCount10==0){
			strJSPName ="./ticket.jsp";
			session.setAttribute("MGS1", "枚数を選択してください");
			session.setAttribute("TOTAL", 0);
			response.sendRedirect(strJSPName);
			return;
		}
		else{
			strJSPName ="./ticket.jsp";
		if(intFlag==0){
			int Ans = (intCount+intCount10)*130;
			//System.out.println("現金"+Ans+"円");
			session.setAttribute("TOTAL", Ans);
			session.setAttribute("MANY", intCount+intCount10);
			session.setAttribute("MGS1", " ");
			response.sendRedirect(strJSPName);
			return;
		}
		else if (intFlag==1){
			int Ans = (intCount+intCount10)*124;
			//System.out.println("電子マネー"+Ans+"円");
			session.setAttribute("TOTAL", Ans);
			session.setAttribute("MANY", intCount+intCount10);
			session.setAttribute("MGS1", " ");
			response.sendRedirect(strJSPName);
			return;
		}
	}

		RequestDispatcher rd = request.getRequestDispatcher(strJSPName);
		rd.forward(request, response);
}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
