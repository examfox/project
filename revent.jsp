<%@ page import="java.sql.*"%>

<%
String fname=request.getParameter("name");
String mname=request.getParameter("phone");
String lname=request.getParameter("address");
String message=request.getParameter("message");
try{
    Connection con=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","yogi");
    PreparedStatement ps=con.prepareStatement("insert into revent values(?,?,?,?)");
    ps.setString(1,fname);
    ps.setString(2,mname);
    ps.setString(3,lname);
    ps.setString(4,message);
    int x=ps.executeUpdate();
    if(x!=0){
        out.print("Registration Sucessfully Completed....");
    }else{
        out.println("Registration not Sucessfully Completed....");
        out.print("Something went wrong...");
    }
    

}catch(Exception e){
    out.print(e);
}
%>