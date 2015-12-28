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
            int acc = lb.validateUser(username, password);
            if(acc!=0){
                sessionMap.put("acc", Integer.toString(acc));
                if(acc==3){
                    return "exitoso";
                }else if(acc==2){
                    return "professor";
                }else{
                    return "student";
                }
            }else{
                return "fail";
            }
	}
    }
