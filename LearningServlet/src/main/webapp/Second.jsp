<%@page import="java.sql.*"%>
<%
String a = request.getParameter("t1");
String b = request.getParameter("t2");
String c = request.getParameter("t3");
String d = request.getParameter("t4");
String e = request.getParameter("t5");
String work = request.getParameter("work");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Registration</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
    body {
        background-color: cyan;
    }
    .container {
        max-width: 600px;
        margin: auto;
        padding: 20px;
        background-color: white;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    h1 {
        margin-bottom: 20px;
    }
    .result-container {
        margin-top: 20px;
    }
    .result-container table {
        width: 100%;
        border-collapse: collapse;
    }
    .result-container th, .result-container td {
        border: 1px solid #ddd;
        padding: 8px;
    }
    .result-container th {
        background-color: #f2f2f2;
        text-align: left;
    }
</style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Employee Registration Page</h1>
        <hr>
        <div class="mb-3">
            <p>Name: <%= a %></p>
            <p>Phone number: <%= b %></p>
            <p>Email: <%= c %></p>
            <p>Address: <%= d %></p>
            <p>Age: <%= e %></p>
            <p>Action: <%= work %></p>
        </div>

        <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Initialization of JDBC
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/training", "root", "Admin@123");

            if ("insert".equals(work)) {
                PreparedStatement st = con.prepareStatement("insert into emp values(?,?,?,?,?)");
                st.setString(1, a);
                st.setString(2, b);
                st.setString(3, c);
                st.setString(4, d);
                st.setString(5, e);
                st.execute();
                out.println("<div class='result-container'><p class='text-success'>Row Inserted</p></div>");
            } else if ("update".equals(work)) {
                PreparedStatement st = con.prepareStatement("update emp set phoneno=?, email=?, address=?, age=? where name=?");
                st.setString(1, b);
                st.setString(2, c);
                st.setString(3, d);
                st.setString(4, e);
                st.setString(5, a);
                st.execute();
                out.println("<div class='result-container'><p class='text-success'>Row Updated</p></div>");
            } else if ("delete".equals(work)) {
                PreparedStatement st = con.prepareStatement("delete from emp where name=?");
                st.setString(1, a);
                st.execute();
                out.println("<div class='result-container'><p class='text-success'>Row Deleted</p></div>");
            } else {
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from emp");
                if (rs.isBeforeFirst()) {
                    out.println("<div class='result-container'><table class='table table-striped'><thead><tr><th>Name</th><th>Phone Number</th><th>Email</th><th>Address</th><th>Age</th></tr></thead><tbody>");
                    while (rs.next()) {
                        out.println("<tr><td>" + rs.getString(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getString(3) + "</td><td>" + rs.getString(4) + "</td><td>" + rs.getString(5) + "</td></tr>");
                    }
                    out.println("</tbody></table></div>");
                } else {
                    out.println("<div class='result-container'><p class='text-danger'>No data found</p></div>");
                }
            }

        } catch (Exception ae) {
            out.println("<div class='result-container'><p class='text-danger'>The error: " + ae + "</p></div>");
        }
        %>
        <a href="First.html" class="btn btn-primary mt-3">Go back</a>
    </div>
</body>
</html>
