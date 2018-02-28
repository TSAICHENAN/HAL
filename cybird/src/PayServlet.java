
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class PayServlet
 */
@WebServlet("/PayServlet")
public class PayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PayServlet() {
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
		String strJSPName = "";
		String strCheck = request.getParameter("check");
		int intFlag = (Integer) session.getAttribute("FLAG");
		int intTOTAL = (Integer) session.getAttribute("TOTAL");
		if (intFlag == 0) {
			int intCash[] = (int[]) session.getAttribute("CASH");
			int intInCash[] = (int[]) session.getAttribute("INCASH");
			int intZero[] = { 10, 50, 100, 500, 1000, 5000, 10000 };
			int Cost, Ans = 0;
			// --------------------------------------------------取り消し------------------------------------------
			if (strCheck.equals("cancel")) {
				for (int i = 0; i < 7; i++) {
					intCash[i] = intInCash[i] + intCash[i];
					// System.out.print(intInCash[i] + ",");
				}
				/*
				 * System.out.println(); for (int i = 0; i < 7; i++) {
				 * System.out.print(intCash[i] + ","); }
				 */
				//System.out.print("取り消し");
				strJSPName = "./homepage.jsp";
				response.sendRedirect(strJSPName);
				return;
			}

			int Coin = Integer.parseInt(request.getParameter("COIN"));
			int Su = Integer.parseInt(request.getParameter("SU"));
			switch (Coin) {
			case 10:
				intInCash[0] = Su + intInCash[0];
				strJSPName = "./pay.jsp";
				if (intCash[0] - Su < 0) {
					session.setAttribute("MGS2", "手元に金が足りません");
					intInCash[0] = intInCash[0] - Su;
					response.sendRedirect(strJSPName);
					return;
				} else {
					intCash[0] = intCash[0] - Su;
					session.setAttribute("MGS2", " ");
					// System.out.println("実行");
				}
				break;

			case 50:
				intInCash[1] = Su + intInCash[1];
				strJSPName = "./pay.jsp";
				if (intCash[1] - Su < 0) {
					session.setAttribute("MGS2", "手元に金が足りません");
					intInCash[1] = intInCash[1] - Su;
					response.sendRedirect(strJSPName);
					return;
				} else {
					intCash[1] = intCash[1] - Su;
					session.setAttribute("MGS2", " ");
					// System.out.println("実行");
				}
				break;
			case 100:
				intInCash[2] = Su + intInCash[2];
				strJSPName = "./pay.jsp";
				if (intCash[2] - Su < 0) {
					session.setAttribute("MGS2", "手元に金が足りません");
					intInCash[2] = intInCash[2] - Su;
					response.sendRedirect(strJSPName);
					return;
				} else {
					intCash[2] = intCash[2] - Su;
					session.setAttribute("MGS2", " ");
					// System.out.println("実行");
				}
				break;
			case 500:
				intInCash[3] = Su + intInCash[3];
				strJSPName = "./pay.jsp";
				if (intCash[3] - Su < 0) {
					session.setAttribute("MGS2", "手元に金が足りません");
					intInCash[3] = intInCash[3] - Su;
					response.sendRedirect(strJSPName);
					return;
				} else {
					intCash[3] = intCash[3] - Su;
					session.setAttribute("MGS2", " ");
					// System.out.println("実行");
				}
				break;
			case 1000:
				intInCash[4] = Su + intInCash[4];
				strJSPName = "./pay.jsp";
				if (intCash[4] - Su < 0) {
					session.setAttribute("MGS2", "手元に金が足りません");
					intInCash[4] = intInCash[4] - Su;
					response.sendRedirect(strJSPName);
					return;
				} else {
					intCash[4] = intCash[4] - Su;
					session.setAttribute("MGS2", " ");
					// System.out.println("実行");
				}
				break;
			case 5000:
				intInCash[5] = Su + intInCash[5];
				strJSPName = "./pay.jsp";
				if (intCash[5] - Su < 0) {
					session.setAttribute("MGS2", "手元に金が足りません");
					intInCash[5] = intInCash[5] - Su;
					response.sendRedirect(strJSPName);
					return;
				} else {
					intCash[5] = intCash[5] - Su;
					session.setAttribute("MGS2", " ");
					// System.out.println("実行");
				}
				break;
			case 10000:
				intInCash[6] = Su + intInCash[6];
				strJSPName = "./pay.jsp";
				if (intCash[6] - Su < 0) {
					session.setAttribute("MGS2", "手元に金が足りません");
					intInCash[6] = intInCash[6] - Su;
					response.sendRedirect(strJSPName);
					return;
				} else {
					intCash[6] = intCash[6] - Su;
					session.setAttribute("MGS2", " ");
					// System.out.println("実行");
				}
				break;
			}
			for (int i = 0; i < 7; i++) {
				Cost = intInCash[i] * intZero[i];
				Ans = Ans + Cost;
				// System.out.print("intInCash-" + intInCash[i]);
				// System.out.println();
				// System.out.print("intCash-" + intCash[i]);
				// System.out.println();
			}
			session.setAttribute("ANS", Ans);
			session.setAttribute("CASH", intCash);
			session.setAttribute("INCASH", intInCash);

		}
		if (intFlag == 1) {
			int intCard = (Integer) session.getAttribute("CARD");
			// --------------------------------------------------取り消し------------------------------------------
			if (strCheck.equals("cancel")) {
				//System.out.print("取り消し");
				strJSPName = "./homepage.jsp";
				response.sendRedirect(strJSPName);
				return;
			}
			if (intCard - intTOTAL < 0) {
				session.setAttribute("MGS2", "残高が足りません");
				strJSPName = "./pay.jsp";
				response.sendRedirect(strJSPName);
				return;

			} else {
				intCard = intCard - intTOTAL;
				session.setAttribute("CARD", intCard);
				strJSPName = "./CashServlet";
			}

		}
		RequestDispatcher rd = request.getRequestDispatcher(strJSPName);
		rd.forward(request, response);
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());
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
