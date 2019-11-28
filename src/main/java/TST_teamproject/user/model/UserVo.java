package TST_teamproject.user.model;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserVo {
	private int tst_user_seq;
	private String tst_user_nickname;
	private String tst_user_id;
	private String tst_user_email;
	private String tst_user_pw;
	private String tst_user_img;
	private String tst_user_location;
	private String tst_user_key;
	private String tst_user_gender;
	private String tst_user_brith;
	private int tst_user_black;
	private int tst_user_isaccountnonexpired;
	private int tst_user_isaccountnonlocked;
	private int tst_user_iscredentialsnonexpired;
	private int tst_user_isenabled;
	private Collection<? extends GrantedAuthority> authorities;

	public Collection<? extends GrantedAuthority> getAuthorities() {
        return authorities;
    }
 
    public void setAuthorities(Collection<? extends GrantedAuthority> authorities) {
        this.authorities = authorities;
    }
    


	@Override
	public String toString() {
		return "UserVo [tst_user_seq=" + tst_user_seq + ", tst_user_nickname=" + tst_user_nickname + ", tst_user_id="
				+ tst_user_id + ", tst_user_email=" + tst_user_email + ", tst_user_pw=" + tst_user_pw
				+ ", tst_user_img=" + tst_user_img + ", tst_user_location=" + tst_user_location + ", tst_user_key="
				+ tst_user_key + ", tst_user_gender=" + tst_user_gender + ", tst_user_brith=" + tst_user_brith
				+ ", tst_user_black=" + tst_user_black + ", tst_user_isaccountnonexpired="
				+ tst_user_isaccountnonexpired + ", tst_user_isaccountnonlocked=" + tst_user_isaccountnonlocked
				+ ", tst_user_iscredentialsnonexpired=" + tst_user_iscredentialsnonexpired + ", tst_user_isenabled="
				+ tst_user_isenabled + "]";
	}

	
	
}
