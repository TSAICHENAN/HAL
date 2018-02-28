
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CashServelt
 */
@WebServlet("/CashServlet")
public class CashServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CashServlet() {
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
		// ").append(request.getContextPath());
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession(true);
		int intAns = (Integer) session.getAttribute("ANS");
		int intTOTAL = (Integer) session.getAttribute("TOTAL");
		int intFlag = (Integer) session.getAttribute("FLAG");
		String strJSPName = "";
		if (intFlag == 0) {
			int intCash[] = (int[]) session.getAttribute("CASH");
			int intChangeCion[] = { 0, 0, 0, 0, 0, 0 };
			int intChange = intAns - intTOTAL;
			//System.out.println("お釣り→" + intChange);
			session.setAttribute("CHANGE", intChange);
			//
			if (intChange == 0) {
				session.setAttribute("MGS3", "お釣りはありません");
				strJSPName = "./cash.jsp";
				response.sendRedirect(strJSPName);
				return;
			}
			if (intChange >= 5000) {
				intCash[5] = (intChange / 5000) + intCash[5];
				intChangeCion[5] = intChange / 5000;
				intChange = intChange % 5000;
				//System.out.println("5000");
			}
			if (intChange >= 1000) {
				intCash[4] = (intChange / 1000) + intCash[4];
				intChangeCion[4] = intChange / 1000;
				intChange = intChange % 1000;
				//System.out.println("1000");
			}
			if (intChange >= 500) {
				intCash[3] = (intChange / 500) + intCash[3];
				intChangeCion[3] = intChange / 500;
				intChange = intChange % 500;
				//System.out.println("500");
			}
			if (intChange >= 100) {
				intCash[2] = (intChange / 100) + intCash[2];
				intChangeCion[2] = intChange / 100;
				intChange = intChange % 100;
				//System.out.println("100");
			}
			if (intChange >= 50) {
				intCash[1] = (intChange / 50) + intCash[1];
				intChangeCion[1] = intChange / 50;
				intChange = intChange % 50;
				//System.out.println("50");
			}
			if (intChange >= 10) {
				intCash[0] = (intChange / 10) + intCash[0];
				intChangeCion[0] = intChange / 10;
				intChange = intChange / 10;
				//System.out.println("10");
			}
			strJSPName = "./cash.jsp";
			session.setAttribute("CASH", intCash);
			session.setAttribute("CHNAGECOIN", intChangeCion);
		}

		if (intFlag == 1) {
			strJSPName = "./cash.jsp";
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
