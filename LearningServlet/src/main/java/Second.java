import javax.servlet.*;
import java.io.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/Second")
public class Second extends GenericServlet
{
	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException 
	{
	PrintWriter pw=res.getWriter();
	res.setContentType("text/html");
	String a=req.getParameter("t1");
	String b=req.getParameter("t2");
	String c=req.getParameter("t3");
	String d=req.getParameter("t4");
	String e=req.getParameter("t5");
	String work = req.getParameter("work");
	pw.println("the name is "+a);
	pw.println("the phone no is "+b);
	pw.println("the email is "+c);
	pw.println("the address is "+d);
	pw.println("the age is "+e);
	}
}