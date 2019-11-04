package TST_teamproject.config;

import org.springframework.security.core.userdetails.User;

import TST_teamproject.user.model.UserVo;

public class SecurityMember extends User{
	 
    private static final long serialVersionUID = 1L;
    
    private String ip;
    
    public SecurityMember(UserVo member) {
        super(member.getTst_user_nickname(), member.getTst_user_pw(), member.getAuthorities());
    }
 
    public String getIp() {
        return ip;
    }
 
    public void setIp(String ip) {
        this.ip = ip;
    }
 
}

