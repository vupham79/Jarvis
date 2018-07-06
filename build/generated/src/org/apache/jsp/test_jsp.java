package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class test_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!doctype html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <title>JARVIS</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/style.css\" type=\"text/css\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/mobile.css\">\n");
      out.write("        <script src=\"js/mobile.js\" type=\"text/javascript\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div id=\"page\">\n");
      out.write("            <div id=\"header\">\n");
      out.write("                <div>\n");
      out.write("                    <a class=\"logo\"><img src=\"images/logoo.png\" alt=\"\"></a>\n");
      out.write("                    <ul id=\"navigation\">\n");
      out.write("                        <li class=\"selected\">\n");
      out.write("                            <a href=\"admin/ViewAccountController\">Account</a>\n");
      out.write("                        </li>\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"admin/ViewAvengerController\">Avengers</a>\n");
      out.write("                        </li>\n");
      out.write("                        <li>                            \n");
      out.write("                            <a href=\"admin/ViewMissionController\">Missions</a>\n");
      out.write("                        </li>\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"admin/ViewWeaponController\">Weapons</a>\n");
      out.write("                        </li>\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"admin/ViewMarkController\">Marks</a>\n");
      out.write("                        </li>\n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div id=\"body\" class=\"home\">\n");
      out.write("                <table border=\"1\">\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Avenger ID: </td>\n");
      out.write("                        <td><input type=\"text\" name=\"avengerId\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.AVENGER.getAvengerId()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" readonly/></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Fullname: </td>\n");
      out.write("                        <td><input type=\"text\" name=\"fullname\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.AVENGER.getFullname()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" readonly/></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Role: </td>\n");
      out.write("                        <td><input type=\"text\" name=\"role\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.AVENGER.getRole()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" readonly/></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Status: </td>\n");
      out.write("                        <td>\n");
      out.write("                    <c:if test=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.AVENGER.getStatus().equals('Weak')}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">\n");
      out.write("                        <font color=\"purple\">Weak</font>\n");
      out.write("                    </c:if>\n");
      out.write("                    <c:if test=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.AVENGER.getStatus().equals('Injured')}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">\n");
      out.write("                        <font color=\"red\">Injured</font>\n");
      out.write("                    </c:if>\n");
      out.write("                    <c:if test=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.AVENGER.getStatus().equals('Good')}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">\n");
      out.write("                        <font color=\"orange\">Good</font>\n");
      out.write("                    </c:if>\n");
      out.write("                    <c:if test=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.AVENGER.getStatus().equals('Excellent')}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">\n");
      out.write("                        <font color=\"green\">Excellent</font>\n");
      out.write("                    </c:if>\n");
      out.write("                    </td>\n");
      out.write("                    </tr>\n");
      out.write("                </table>\n");
      out.write("                <form action=\"UpdateAccountController\" method=\"POST\">\n");
      out.write("                    <input type=\"submit\" name=\"action\" value=\"Edit\"/>\n");
      out.write("                    <input type=\"hidden\" name=\"avengerId\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.AVENGER.getAvengerId()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\"/>\n");
      out.write("                    <input type=\"hidden\" name=\"fullname\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.AVENGER.getFullname()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\"/>\n");
      out.write("                    <input type=\"hidden\" name=\"role\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.AVENGER.getRole()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\"/>\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("            <div id=\"footer\">\n");
      out.write("                <div class=\"connect\">\n");
      out.write("                    <div>\n");
      out.write("                        <h1>FOLLOW OUR  MISSIONS ON</h1>\n");
      out.write("                        <div>\n");
      out.write("                            <a href=\"\" class=\"facebook\">facebook</a>\n");
      out.write("                            <a href=\"\" class=\"twitter\">twitter</a>\n");
      out.write("                            <a href=\"\" class=\"googleplus\">googleplus</a>\n");
      out.write("                            <a href=\"\" class=\"pinterest\">pinterest</a>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"footnote\">\n");
      out.write("                    <div>\n");
      out.write("                        <p>&copy; 1998 BY THE AVENGERS | ALL RIGHTS RESERVED</p>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
