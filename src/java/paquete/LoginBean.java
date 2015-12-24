package paquete;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

class LoginBean{
    Connection con = null;
    PreparedStatement pst = null; 
    ResultSet rs = null;
    boolean status = false;
    
    private HashMap validUsers = new HashMap();

    public LoginBean(){
    }

    public boolean validateUser(String userName, String password){
        String nombre = "";
        String pass = "";
        try {
            con = DataSource.getInstance().getConnection();
            String consulta = "Select * from users where id=? and password=?";
            pst = con.prepareStatement(consulta);
            pst.setString(1, userName);
            pst.setString(2, password);
            rs = pst.executeQuery();
            status = rs.next();   
        } catch (Exception e) {  
            System.out.println(e);  
        } finally {  
            if (con != null) {  
                try {  
                    con.close();  
                } catch (SQLException e) {  
                }  
            }  
            if (pst != null) {  
                try {  
                    pst.close();  
                } catch (SQLException e) {  
                }  
            }  
            if (rs != null) {  
                try {  
                    rs.close();  
                } catch (SQLException e) {    
                }  
            }  
        } 
        return status;
    }
    
    public int modifyUser(String userName, String password, String rol, int id){
        int status = 0;
        String pass2 = "";
        try {
            con = DataSource.getInstance().getConnection();
            int nivel = 1;
            if(rol=="ADMIN"){
                nivel = 3;
            }else if(rol=="PROFESSOR"){
                nivel = 2;
            }
            if(password==""){
                pst = con.prepareStatement("SELECT Users.password FROM Users WHERE Users.idUser="+id+"");
                rs = pst.executeQuery("SELECT Users.password FROM Users WHERE Users.idUser="+id+"");
                pass2 = rs.getString("Users.password");
            }
            password = pass2;
            String consulta = "update users\n" +
                            "set id='"+userName+"', password='"+password+"', rol='"+rol+"', nivel='"+nivel+"'\n" +
                            "where idUser='"+id+"';";
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            status=1;
        } catch (Exception e) {  
            System.out.println(e);  
        }
        return status;
    }
    
    public int deleteUser(int id){
        int status = 0;
        try {
            con = DataSource.getInstance().getConnection();
            String consulta = "DELETE FROM users\n" +
                                "WHERE idUser='"+id+"';";
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            status=1;
        } catch (Exception e) {  
            System.out.println(e);  
        }
        return status;
    }
    
    public int addUser(String userName, String password, int rol){
        int status = 0;
        String nivel = "STUDENT";
            if(rol==3){
                nivel = "ADMIN";
            }else if(rol==2){
                nivel = "PROFESOR";
            }
        try {
            con = DataSource.getInstance().getConnection();
            String consulta = "insert into users(id, password, rol, nivel) values('"+userName+"', '"+password+"', '"+nivel+"', '"+rol+"');";
            pst = con.prepareStatement(consulta);
            int cols = pst.executeUpdate(consulta);
            status=1;
        } catch (Exception e) {  
            System.out.println(e);  
        }
        return status;
    }
}