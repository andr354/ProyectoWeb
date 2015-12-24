package paquete;

import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

public class LoginAction extends ActionSupport implements SessionAware 
{
	private String username;
        private String password;
        private Map<String, Object> sessionMap;
 
        @Override
        public void setSession(Map<String, Object> sessionMap) {
                this.sessionMap = sessionMap;
        } 
        
	public String getUsername() {
		return username;
	}
 
	public void setUsername(String username) {
		this.username = username;
	}
        
        public String getPassword() {
		return password;
	}
 
	public void setPassword(String password) {
		this.password = password;
	}
 
	public String execute() {
            LoginBean lb = new LoginBean();
            sessionMap.put("username", username);
            if(lb.validateUser(username,password)){
                return "exitoso";
            }else{
                return "fail";
            }
 
	}
    }
