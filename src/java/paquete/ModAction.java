package paquete;

import static com.opensymphony.xwork2.Action.NONE;
import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

public class ModAction extends ActionSupport
{
        private String username;
        private String password;
        private int rol;
        private int id;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRol() {
        return rol;
    }

    public void setRol(int rol) {
        this.rol = rol;
    }
      
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
 
    public String getUsername() {
	return username;
    }
 
    public void setUsername(String username) {
	this.username = username;
    }
    
    public String getDefaultRol() {
	return "STUDENT";
	}
 
    public String execute() {
        System.out.println("Rol: " + rol);
         LoginBean lb = new LoginBean();
        if(lb.modifyUser(username,password, rol, id)==1){
            return "exitoso";
        }else{
            return "error";
        }
	}
        
        public String display() {
		return NONE;
	}
        
    }