
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class TicketServlet
 */
@WebServlet("/TicketServlet")
public class TicketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TicketServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession(true);
		String strFlag = request.getParameter("check");
		String strJSPName = "";
		int intFlag = Integer.parseInt(strFlag);
		session.setAttribute("TOTAL", 0);
		session.setAttribute("MANY", 0);
		session.setAttribute("ANS", 0);
		if (intFlag == 0) {
			//System.out.println("現金");
			session.setAttribute("FLAG", 0);
			int intInCash[] = {0,0,0,0,0,0,0};
			session.setAttribute("INCASH", intInCash);
			int intChangeCion[] = {0,0,0,0,0,0,0};
			session.setAttribute("CHNAGECOIN", intChangeCion);

		} if (intFlag == 1) {
			//System.out.println("電子マネー");
			session.setAttribute("FLAG", 1);
		}
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());
		strJSPName = "/ticket.jsp";
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
